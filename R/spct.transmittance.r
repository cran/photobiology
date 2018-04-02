#' Transmittance
#'
#' Summary transmittance for supplied wavebands from filter or object spectrum.
#'
#' @param spct an R object.
#' @param w.band waveband or list of waveband objects or a numeric vector of
#'   length two. The waveband(s) determine the region(s) of the spectrum that
#'   are summarized. If a numeric range is supplied a waveband object is
#'   constructed on the fly from it.
#' @param quantity character string One of "total", "average" or "mean",
#'   "contribution", "contribution.pc", "relative" or "relative.pc".
#' @param wb.trim logical Flag indicating if wavebands crossing spectral data boundaries
#'   are trimmed or ignored.
#' @param use.hinges logical Flag indicating whether to insert "hinges" into the
#'   spectral data before integration so as to reduce interpolation errors at
#'   the boundaries of the wavebands.
#' @param ... ignored (possibly used by derived methods).
#'
#' @return A named \code{numeric} vector in the case of methods for individual
#'   spectra, with one value for each \code{waveband} passed to parameter
#'   \code{w.band}. A \code{data.frame} in the case of collections of spectra,
#'   containing one column for each \code{waveband} object, an index column with
#'   the names of the spectra, and optionally additional columns with metadata
#'   values retrieved from the attributes of the member spectra.
#'
#'   By default values are only integrated, but depending on the argument passed
#'   to parameter \code{quantity} they can be re-expressed as relative fractions
#'   or percentages. In the case of vector output, \code{names} attribute is set
#'   to the name of the corresponding waveband unless a named list is supplied
#'   in which case the names of the list members are used.
#'
#' @export transmittance
#' @examples
#' transmittance(polyester.spct, waveband(c(280, 315)))
#' transmittance(polyester.spct, waveband(c(315, 400)))
#' transmittance(polyester.spct, waveband(c(400, 700)))
#'
#' @note The \code{use.hinges} parameter controls speed optimization. The
#'   defaults should be suitable in most cases. Only the range of wavelengths
#'   in the wavebands is used and all BSWFs are ignored.
#'
#' @export transmittance
#'
transmittance <- function(spct, w.band, quantity, wb.trim, use.hinges, ...) UseMethod("transmittance")

#' @describeIn transmittance Default method
#'
#' @export
#'
transmittance.default <- function(spct, w.band, quantity, wb.trim, use.hinges, ...) {
  return(NA)
}

#' @describeIn transmittance Method for filter spectra
#'
#' @export
#'
transmittance.filter_spct <-
  function(spct, w.band=NULL,
           quantity="average",
           wb.trim = getOption("photobiology.waveband.trim", default = TRUE),
           use.hinges=getOption("photobiology.use.hinges", default = NULL), ...) {
    transmittance_spct(spct = spct,
                       w.band = w.band,
                       quantity = quantity,
                       wb.trim = wb.trim,
                       use.hinges = use.hinges)
  }

#' @describeIn transmittance Method for object spectra
#'
#' @export
#'
transmittance.object_spct <-
  function(spct, w.band=NULL,
           quantity="average",
           wb.trim = getOption("photobiology.waveband.trim", default = TRUE),
           use.hinges=getOption("photobiology.use.hinges", default = NULL), ...) {
    transmittance_spct(spct = spct,
                       w.band = w.band,
                       quantity = quantity,
                       wb.trim = wb.trim,
                       use.hinges = use.hinges)
  }

#' Calculate transmittance from spectral transmittance.
#'
#' Mean transmittance for one or more wavebands of a filter or object spectrum.
#'
#' @param spct an object of class "generic_spct".
#' @param w.band waveband or list of waveband objects or a numeric vector of
#'   length two. The waveband(s) determine the region(s) of the spectrum that
#'   are summarized. If a numeric range is supplied a waveband object is
#'   constructed on the fly from it.
#' @param quantity character string One of "total", "average" or "mean",
#'   "contribution", "contribution.pc", "relative" or "relative.pc".
#' @param wb.trim logical Flag indicating if wavebands crossing spectral data boundaries
#'   are trimmed or ignored.
#' @param use.hinges logical Flag indicating whether to insert "hinges" into the
#'   spectral data before integration so as to reduce interpolation errors at
#'   the boundaries of the wavebands.
#'
#' @return a single numeric value
#' @keywords internal
#'
#' @note The last parameter controls speed optimization. The defaults should be
#'   suitable in most cases. Only the range of wavelengths in the wavebands is
#'   used and all BSWFs are ignored.

transmittance_spct <-
  function(spct, w.band, quantity, wb.trim, use.hinges) {
    num.spectra <- getMultipleWl(spct)
    if (num.spectra != 1) {
      warning("Skipping transmittance calculation as object contains ",
              num.spectra, " spectra")
      return(NA_real_)
    }
    if (is_normalized(spct)) {
      warning("The spectral data has been normalized, making impossible to calculate absorbance")
      return(NA_real_)
    }
    if (is_scaled(spct)) {
      warning("Summary calculated from rescaled data")
    }
    if (!is.filter_spct(spct)) {
      spct <- as.filter_spct(spct)
    }
    spct <- A2T(spct, action = "replace", byref = FALSE)
    spct <- spct[ , c("w.length", "Tfr")]
    # if the waveband is undefined then use all data
    if (length(w.band) == 0) {
      w.band <- waveband(spct)
    }
    if (is.numeric(w.band)) {
      w.band <- waveband(w.band)
    }
    if (is.waveband(w.band)) {
      # if the argument is a single w.band, we enclose it in a list
      # so that the for loop works as expected.This is a bit of a
      # kludge but let's us avoid treating it as a special case
      w.band <- list(w.band)
    }
    w.band <- trim_waveband(w.band = w.band, range = spct, trim = wb.trim)

    # if the w.band includes 'hinges' we insert them
    # choose whether to use hinges or not
    # if the user has specified its value, we leave it alone
    # but if it was not requested, we decide whether to insert
    # hinges or not based of the wavelength resolution of the
    # spectrum. This will produce small errors for high
    # spectral resolution data, and speed up the calculations
    # a lot in such cases
    if (is.null(use.hinges)) {
      use.hinges <- auto_hinges(spct[["w.length"]])
    }

    # we collect all hinges and insert them in one go
    # this may alter a little the returned values
    # but should be faster
    if (use.hinges) {
      all.hinges <- NULL
      for (wb in w.band) {
        all.hinges <- c(all.hinges, wb$hinges)
      }
      if (!is.null(all.hinges)) {
        spct <- insert_spct_hinges(spct, all.hinges)
      }
    }

    # we prepare labels for output
    wb.name <- names(w.band)
    no_names_flag <- is.null(wb.name)
    if (no_names_flag) {
      wb.name <- character(length(w.band))
    }
    # we iterate through the list of wavebands
    transmittance <- numeric(length(w.band))
    i <- 0
    for (wb in w.band) {
      i <- i + 1
      # we get names from wb if needed
      if (no_names_flag) {
        if (is_effective(wb)) {
          warning("Using only wavelength range from a weighted waveband object.")
          wb.name[i] <- paste("range", as.character(signif(min(wb), 4)),
                              as.character(signif(max(wb), 4)), sep = ".")
        } else {
          wb.name[i] <- wb$name
        }
      }
      # we calculate the average transmittance.
      transmittance[i] <- integrate_spct(trim_spct(spct, wb, use.hinges = FALSE))
    }

    if (quantity %in% c("contribution", "contribution.pc")) {
      total <- transmittance_spct(spct,
                                  w.band = NULL,
                                  wb.trim = wb.trim,
                                  quantity = "total",
                                  use.hinges = use.hinges)
      transmittance <- transmittance / total
      if (quantity == "contribution.pc") {
        transmittance <- transmittance * 1e2
      }
    } else if (quantity %in% c("relative", "relative.pc")) {
      total <- sum(transmittance)
      transmittance <- transmittance / total
      if (quantity == "relative.pc") {
        transmittance <- transmittance * 1e2
      }
    } else if (quantity %in% c("average", "mean")) {
      transmittance <- transmittance / sapply(w.band, wl_expanse)
    } else if (quantity == "total") {
      NULL
    } else if (quantity != "total") {
      warning("'quantity '", quantity, "' is invalid, returning 'total' instead")
      quantity <- "total"
    }

    if (length(transmittance) == 0) {
      transmittance <- NA
      names(transmittance) <- "out of range"
    }
    names(transmittance) <- paste(names(transmittance), wb.name)
    attr(transmittance, "Tfr.type") <- getTfrType(spct)
    attr(transmittance, "radiation.unit") <- paste("transmittance", quantity)
    return(transmittance)
  }

# filter_mspct methods -----------------------------------------------

#' @describeIn transmittance Calculates transmittance from a \code{filter_mspct}
#'
#' @param attr2tb character vector, see \code{\link{add_attr2tb}} for the syntax for \code{attr2tb} passed as is to formal parameter \code{col.names}.
#' @param idx logical whether to add a column with the names of the elements of
#'   spct
#'
#' @export
#'
transmittance.filter_mspct <-
  function(spct, w.band = NULL,
           quantity = "average",
           wb.trim = getOption("photobiology.waveband.trim", default = TRUE),
           use.hinges = getOption("photobiology.use.hinges", default = NULL),
           ...,
           attr2tb = NULL,
           idx = !is.null(names(spct)) ) {
    z <-
      msdply(
        mspct = spct,
        .fun = transmittance,
        w.band = w.band,
        quantity = quantity,
        wb.trim = wb.trim,
        use.hinges = use.hinges,
        idx = idx,
        col.names = names(w.band)
      )
    add_attr2tb(tb = z,
                mspct = spct,
                col.names = attr2tb)
  }

# object_mspct methods -----------------------------------------------

#' @describeIn transmittance Calculates transmittance from a \code{object_mspct}
#' @param .parallel	if TRUE, apply function in parallel, using parallel backend
#'   provided by foreach
#' @param .paropts a list of additional options passed into the foreach function
#'   when parallel computation is enabled. This is important if (for example)
#'   your code relies on external data or packages: use the .export and
#'   .packages arguments to supply them so that all cluster nodes have the
#'   correct environment set up for computing.
#'
#' @export
#'
transmittance.object_mspct <-
  function(spct, w.band = NULL,
           quantity = "average",
           wb.trim = getOption("photobiology.waveband.trim", default = TRUE),
           use.hinges = getOption("photobiology.use.hinges", default = NULL),
           ...,
           attr2tb = NULL,
           idx = !is.null(names(spct)),
           .parallel = FALSE,
           .paropts = NULL) {
    z <-
      msdply(
        mspct = spct,
        .fun = transmittance,
        w.band = w.band,
        quantity = quantity,
        wb.trim = wb.trim,
        use.hinges = use.hinges,
        idx = idx,
        col.names = names(w.band),
        .parallel = .parallel,
        .paropts = .paropts
      )
    add_attr2tb(tb = z,
                mspct = spct,
                col.names = attr2tb)
  }
