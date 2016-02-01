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
#' @family waveband attributes
#'
labels.waveband <- function(object, ...) {
  return(list(label = object$label, name = object$name))
}

# range -------------------------------------------------------------------

#' Wavelength range
#'
#' A function that returns the wavelength range from objects of class "waveband".
#'
#' @param ... not used in current version
#' @param na.rm ignored
#' @export
#'
#' @family wavelength summaries
#'
range.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
  return(c(x$low, x$high)) # we are using double precision
}

# min ---------------------------------------------------------------------

#' Wavelength minimum
#'
#' A function that returns the wavelength minimum from objects of class "waveband".
#'
#' @param ... not used in current version
#' @param na.rm ignored
#' @export
#'
#' @family wavelength summaries
#'
min.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
    return(x$low)
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
max.waveband <- function(..., na.rm = FALSE) {
  x <- c(...)
  return(x$high)
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

#' @describeIn midpoint Wavelength at center of a "waveband" object.
#'
#' @export
#'
midpoint.waveband <- function(x, ...) {
  return(x$low + (x$high - x$low) / 2)
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

#' @describeIn spread Default method for generic function
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

#' @describeIn spread Wavelength spread in nm.
#'
#' @export
#'
spread.waveband <- function(x, ...) {
  return(x$high - x$low)
}

# color -------------------------------------------------------------------

#' Color of an object
#'
#' A function that returns the equivalent RGB color of an object such as a
#' spectrum or wavelength.
#'
#' @param x an R object
#' @param ... not used in current version
#' @export color
#'
#' @examples
#' wavelengths <- c(300, 420, 500, 600, NA) # nanometres
#' color(wavelengths)
#' color(waveband(c(300,400)))
#' color(list(blue = waveband(c(400,480)), red = waveband(c(600,700))))
#' color(numeric())
#' color(NA_real_)
#'
color <- function(x, ...) UseMethod("color")

#' @describeIn color Default method (returns always "black").
#'
#' @export
#'
color.default <- function(x, ...) {
  if (length(x) == 0) {
    return(character())
  }
  ifelse(is.na(x),
         NA_character_,
         rep("#000000", length(x)))
}

#' @describeIn color Method that returns Color definitions corresponding to
#'   numeric values representing a wavelengths in nm.
#'
#' @param type character telling whether "CMF", "CC", or "both" should be returned.
#'
#' @export
#'
color.numeric <- function(x, type="CMF", ...) {
  if (length(x) == 0) {
    return(character())
  }
  color.out <- rep(NA_character_, length(x))
  if (!all(is.na(x))) {
    if (type == "CMF") {
      color.out[!is.na(x)] <-
        w_length2rgb(x[!is.na(x)], sens = photobiology::ciexyzCMF2.spct, color.name = NULL)
    } else if (type == "CC") {
      color.out[!is.na(x)] <-
        w_length2rgb(x[!is.na(x)], sens = photobiology::ciexyzCC2.spct, color.name = NULL)
    } else {
      warning("Color 'type' = ", type, " not implemented for 'numeric'.")
    }
  }
  if (!is.null(names(x))) {
    names(color.out) <- paste(names(x), type, sep = ".")
  }
  color.out
}

#' @describeIn color Method that returns Color of elements in a list.
#'
#' @param short.names logical indicating whether to use short or long names for
#'   wavebands
#'
#' @note When \code{x} is a list but not a waveband, if a method  \code{color}
#'   is not available for the class of each element of the list, then
#'   \code{color.default} will be called.
#' @export
#'
color.list <- function(x, short.names=TRUE, type="CMF", ...) {
  color.out <- character(0)
  for (xi in x) {
    color.out <- c(color.out, color(xi, short.names = short.names, type = type, ...))
  }
  if (!is.null(names(x))) {
    names(color.out) <- paste(names(x), type, sep = ".")
  }
  return(color.out)
}

#' @describeIn color Color at midpoint of a \code{\link{waveband}} object.
#'
#' @export
#'
color.waveband <- function(x, short.names = TRUE, type = "CMF", ...) {
  idx <- ifelse(!short.names, "name", "label")
  name <- labels(x)[[idx]]
  if (type == "both") {
    color <- list(CMF = w_length_range2rgb(range(x),
                                           sens = photobiology::ciexyzCMF2.spct,
                                           color.name = paste(name, "CMF", sep = ".")),
                  CC  = w_length_range2rgb(range(x),
                                           sens = photobiology::ciexyzCC2.spct,
                                           color.name = paste(name, "CC", sep = ".")))
  } else if (type == "CMF") {
    color <- w_length_range2rgb(range(x),
                                sens = photobiology::ciexyzCMF2.spct,
                                color.name = paste(name, "CMF", sep = "."))
  } else if (type == "CC") {
    color <- w_length_range2rgb(range(x),
                                sens = photobiology::ciexyzCC2.spct,
                                color.name = paste(name, "CC", sep = "."))
  } else {
    color <- NA
  }
  return(color)
}

# normalization -----------------------------------------------------------

#' Normalization of an R object
#'
#' Normalization wavelength of an R object, retireved from the object's
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
#' A generic function for quering if a biological spectral weighting function
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
#'   calcualtaing effective irradiance.
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

