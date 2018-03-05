# labels ------------------------------------------------------------------

#' Find labels from "waveband" object
#'
#' A function to obtain the name and label of objects of class "waveband".
#'
#' @param object an object of class "waveband"
#' @param ... not used in current version
#'
#' @export
#'
#' @name labels
#'
#' @family waveband attributes
#'
labels.waveband <- function(object, ...) {
  return(list(label = object$label, name = object$name))
}

#' @describeIn labels
#'
#' @export
#'
#' @examples
#' labels(sun.spct)
#'
labels.generic_spct <- function(object, ...) {
  return(names(object))
}

# range -------------------------------------------------------------------

#' Wavelength range
#'
#' A function that returns the wavelength range.
#'
#' @param ... not used in current version
#' @param na.rm ignored
#' @export
#'
#' @name range
#'
#' @family wavelength summaries
#'
range.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
  return(c(x$low, x$high)) # we are using double precision
}

#' @describeIn range
#'
#' @export
#'
#' @examples
#' range(sun.spct)
#'
range.generic_spct <- function(..., na.rm = FALSE) {
  wl <- list(...)[[1]][["w.length"]]
  # guaranteed to be sorted
  wl[c(1, length(wl))]
  #  range(x[["w.length"]], na.rm = na.rm)
}

#' @describeIn range
#'
#' @param idx logical whether to add a column with the names of the elements of
#'   spct
#'
#' @export
#'
range.generic_mspct <- function(..., na.rm = FALSE, idx = NULL) {
  mspct <- list(...)[[1]]
  if (is.null(idx)) {
    idx <- !is.null(names(mspct))
  }
  msdply(mspct = mspct, .fun = range, na.rm = na.rm, idx = idx)
}

# min ---------------------------------------------------------------------

#' Wavelength minimum
#'
#' A function that returns the wavelength minimum.
#'
#' @param ... not used in current version
#' @param na.rm ignored
#' @export
#'
#' @name min
#'
#' @family wavelength summaries
#'
min.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
    return(x$low)
}

#' @describeIn min
#'
#' @export
#'
#' @examples
#' min(sun.spct)
#'
min.generic_spct <- function(..., na.rm = FALSE) {
  wl <- list(...)[[1]][["w.length"]]
  # guaranteed to be sorted
  wl[1]
}

#' @describeIn min
#'
#' @param idx logical whether to add a column with the names of the elements of
#'   spct
#'
#' @export
#'
min.generic_mspct <- function(..., na.rm = FALSE, idx = NULL) {
  mspct <- list(...)[[1]]
  if (is.null(idx)) {
    idx <- !is.null(names(mspct))
  }
  msdply(mspct = mspct, .fun = min, na.rm = na.rm, idx = idx)
}

# max ---------------------------------------------------------------------

#' Wavelength maximum
#'
#' A function that returns the wavelength maximum from objects of class "waveband".
#'
#' @param ... not used in current version
#' @param na.rm ignored
#' @export
#'
#' @name max
#'
max.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
  return(x$high)
}

#' @describeIn max
#'
#' @export
#'
#' @examples
#' max(sun.spct)
#'
max.generic_spct <- function(..., na.rm=FALSE) {
  wl <- list(...)[[1]][["w.length"]]
  # guaranteed to be sorted
  wl[length(wl)]
}

#' @describeIn max
#'
#' @param idx logical whether to add a column with the names of the elements of
#'   spct
#'
#' @export
#'
max.generic_mspct <- function(..., na.rm = FALSE, idx = NULL) {
  mspct <- list(...)[[1]]
  if (is.null(idx)) {
    idx <- !is.null(names(mspct))
  }
  msdply(mspct = mspct, .fun = max, ..., na.rm = na.rm, idx = idx)
}


# midpoint ------------------------------------------------------------------

#' Central wavelength value
#'
#' A function that returns the wavelength at the center of the wavelength range.
#'
#' @param x an R object
#' @param ... not used in current version
#' @export midpoint
#'
#' @return A numeric value equal to (max(x) - min(x)) / 2. In the case of spectral
#' objects a wavelength in nm. For any other R object, according to available
#' definitions of \code{\link{min}} and \code{\link{max}}.
#'
#' @family wavelength summaries
#'
midpoint <- function(x, ...) UseMethod("midpoint")

#' @describeIn midpoint Default method for generic function
#'
#' @export
#'
#' @family wavelength summaries
#'
midpoint.default <- function(x, ...) {
  warning("'midpoint()' not implemented for class '", class(x), "'.")
  NA_real_
}

#' @describeIn midpoint Default method for generic function
#'
#' @export
#'
#' @family wavelength summaries
#'
midpoint.numeric <- function(x, ...) {
  if (length(x) > 0) {
    min(x) + (max(x) - min(x)) / 2
  } else {
    NA_real_
  }
}

#' @describeIn midpoint Wavelength at center of a "waveband".
#'
#' @export
#'
midpoint.waveband <- function(x, ...) {
  return(x$low + (x$high - x$low) / 2)
}

#' @describeIn midpoint Method for "generic_spct".
#'
#' @export
#'
#' @examples
#' midpoint(sun.spct)
#'
midpoint.generic_spct <- function(x, ...) {
  wl <- x[["w.length"]]
  wl[1] + (wl[length(wl)] - wl[1]) / 2
}

#' @describeIn midpoint Method for "generic_mspct" objects.
#'
#' @param idx logical whether to add a column with the names of the elements of spct
#'
#' @export
#'
midpoint.generic_mspct <- function(x, ..., idx = !is.null(names(x))) {
  msdply(mspct = x, .fun = midpoint, ..., idx = idx)
}

# spread ------------------------------------------------------------------

#' Length of object in wavelength units
#'
#' A function that returns the spread (max(x) - min(x)) for R objects.
#'
#' @param x an R object
#' @param ... not used in current version
#'
#' @return A numeric value equal to max(x) - min(x). In the case of spectral
#'   objects wavelength difference in nm. For any other R object, according to
#'   available definitions of \code{\link{min}} and \code{\link{max}}.
#'
#' @export spread
#'
spread <- function(x, ...) UseMethod("spread")

#' @describeIn spread Default method for generic function
#'
#' @export
#'
spread.default <- function(x, ...) {
  warning("'spread()' not defined for class '", paste(class(x), collapse = " "), "'")
  NA
}

#' @describeIn spread Method for "numeric"
#'
#' @export
#'
spread.numeric <- function(x, ...) {
  if (length(x) > 0) {
    return(max(x) - min(x))
  } else {
    return(NA_real_)
  }
}

#' @describeIn spread Method for "waveband"
#'
#' @export
#'
spread.waveband <- function(x, ...) {
  return(x$high - x$low)
}

#' @describeIn spread  Method for "generic_spct"
#'
#' @export
#'
#' @examples
#' spread(sun.spct)
#'
spread.generic_spct <- function(x, ...) {
  wl <- x[["w.length"]]
  wl[length(wl)] - wl[1]
}

#' @describeIn spread  Method for "generic_mspct" objects.
#'
#' @param idx logical whether to add a column with the names of the elements of spct
#'
#' @export
#'
spread.generic_mspct <- function(x, ..., idx = !is.null(names(x))) {
  msdply(mspct = x, .fun = spread, ..., idx = idx)
}

# normalization -----------------------------------------------------------

#' Normalization of an R object
#'
#' Normalization wavelength of an R object, retrieved from the object's
#' attributes.
#'
#' @param x an R object
#' @export normalization
#'
#' @family waveband attributes
#'
normalization <- function(x) UseMethod("normalization")

#' @describeIn normalization Default methods.
#'
#' @export
#'
normalization.default <- function(x) {
  warning("'normalization()' not implemented for class '", class(x), "'.")
  return(NA_real_)
}

#' @describeIn normalization Normalization of a \code{\link{waveband}} object.
#'
#' @export
#'
normalization.waveband <- function(x) {
  return(ifelse(is.null(x$norm), NA_real_, x$norm))
}

# is_effective -----------------------------------------------------------

#' Is an R object "effective"
#'
#' A generic function for querying if a biological spectral weighting function
#' (BSWF) has been applied to an object or is included in its definition.
#'
#' @param x an R object
#'
#' @return A \code{logical}.
#'
#' @export is_effective
#'
#' @family waveband attributes
#'
is_effective <- function(x) UseMethod("is_effective")

#' @describeIn is_effective Default method.
#'
#' @export
#'
is_effective.default <- function(x) {
  warning("'is_effective()' not implemented for class '", class(x), "'.")
  NA_integer_
}

#' @describeIn is_effective Is a \code{waveband} object defining a method for
#'   calculating effective irradiance.
#'
#' @export
#'
is_effective.waveband <- function(x) {
  x$weight != "none"
}

#' @describeIn is_effective Does a \code{source_spct} object contain effective
#'   spectral irradiance values.
#'
#' @export
#'
is_effective.generic_spct <- function(x) {
  FALSE
}

#' @describeIn is_effective Does a \code{source_spct} object contain effective
#'   spectral irradiance values.
#'
#' @export
#'
is_effective.source_spct <- function(x) {
  bswf.used <- getBSWFUsed(x)
  !is.null(bswf.used) && (bswf.used != "none")
}

#' @describeIn is_effective Method for "summary_generic_spct".
#'
#' @export
#' @examples
#' is_effective(summary(sun.spct))
#'
is_effective.summary_generic_spct <- function(x) {
  FALSE
}

#' @describeIn is_effective Method for "summary_source_spct".
#'
#' @export
#'
is_effective.summary_source_spct <- function(x) {
  bswf.used <- getBSWFUsed(x)
  !is.null(bswf.used) && (bswf.used != "none")
}

# w.length summaries ------------------------------------------------------

#' Stepsize
#'
#' Function that returns the range of step sizes in an object. Range of
#' differences between successive sorted values.
#'
#' @param x an R object
#' @param ... not used in current version
#'
#' @return A numeric vector of length 2 with min and maximum stepsize values.
#' @export
#' @family wavelength summaries
#' @examples
#' stepsize(sun.spct)
#'
stepsize <- function(x, ...) UseMethod("stepsize")

#' @describeIn stepsize Default function usable on numeric vectors.
#' @export
stepsize.default <- function(x, ...) {
  warning("'stepsize()' not implemented for class '", class(x), "'.")
  c(NA_real_, NA_real_)
}

#' @describeIn stepsize Method for numeric vectors.
#' @export
stepsize.numeric <- function(x, ...) {
  if (length(x) > 1) {
    range(diff(x))
  } else {
    c(NA_real_, NA_real_)
  }
}

#' @describeIn stepsize  Method for "generic_spct" objects.
#'
#' @export
#'
#' @examples
#' stepsize(sun.spct)
#'
stepsize.generic_spct <- function(x, ...) {
  num.spectra <- getMultipleWl(x)
  if (num.spectra > 1) {
    wl <- unique(x[["w.length"]])
  } else {
    wl <- x[["w.length"]]
  }
  if (length(wl) > 1) {
    range(diff(wl))
  } else {
    c(NA_real_, NA_real_)
  }
}

#' @describeIn stepsize  Method for "generic_mspct" objects.
#'
#' @param idx logical whether to add a column with the names of the elements of spct
#'
#' @export
#'
stepsize.generic_mspct <- function(x, ..., idx = !is.null(names(x))) {
  msdply(mspct = x, .fun = stepsize, ..., idx = idx)
}
