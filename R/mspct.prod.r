#' Product from collection of spectra
#'
#' Method to compute the "parallel" product of values across members of a
#' collection of spectra or of a spectral object containing multiple spectra in
#' long form.
#'
#' @details Method specializations compute the product at each wavelength across
#'   a group of spectra stored in an object of one of the classes defined in
#'   package 'photobiology'. Omission of NAs is done separately at each
#'   wavelength. Interpolation is not applied, so all spectra in \code{x} must
#'   share the same set of wavelengths. An error is triggered if this condition
#'   is nor fulfilled.
#'
#' @param x An R object. Currently this package defines methods for collections of
#'    spectral objects.
#' @param na.rm	logical. A value indicating whether NA values should be stripped
#'   before the computation proceeds.
#' @param ...	Further arguments passed to or from other methods.
#'
#' @return If \code{x} is a collection spectral of objects, such as a
#'   \code{"filter_mspct"} object, the returned object is of same class as the
#'   members of the collection, such as \code{"filter_spct"}, containing the
#'   summary spectrum, with variables with names tagged for summaries other
#'   than mean or median.
#'
#' @note Objects of classes \code{raw_spct} and \code{cps_spct} can contain data
#'   from multiple scans in multiple variables or "columns". The methods accept
#'   as arguments objects of these classes only if spectra contain data for a
#'   single spectrometer scan. In the case of \code{cps_spct} objects, a single
#'   column can also contain data from multiple scans spliced into a single
#'   variable.
#'
#'   The product operation is meaningful only for certain physical
#'   quantities or bases of expression.
#'
#' @seealso See \code{\link[base]{prod}} for the \code{prod()} method used for
#'   the computations.
#'
#' @export
#'
#' @examples
#' s_prod(two_filters.mspct)
#'
s_prod <- function(x, na.rm, ...)
  UseMethod("s_prod")

#' @describeIn s_prod
#'
#' @export
#'
s_prod.default <- function(x, na.rm = FALSE, ...) {
  warning("Metod 's_prod()' not implementd for objects of class ",
          class(x)[1],
          ".")
  ifelse(is.any_mspct(x), do.call(class(x[[1]])[1], args = list()), NA)
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.generic_spct <- function(x, na.rm = FALSE, ...) {
  if (getMultipleWl(x) > 1) {
    s_prod(subset2mspct(x), na.rm = na.rm, ...)
  } else {
    x
  }
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.source_mspct <- function(x, na.rm = FALSE, ...) {
  warning("A product of irradiance values does not yield response irradiance!!")
  rowwise_source(
    x,
    .fun = base::prod,
    na.rm = na.rm,
    col.name.tag = ".prod",
    .fun.name = "Product of"
  )
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.response_mspct <- function(x, na.rm = FALSE, ...) {
  warning("A product of response values does not yield response values!!")
  rowwise_response(
    x,
    .fun = base::prod,
    na.rm = na.rm,
    col.name.tag = ".prod",
    .fun.name = "Product of"
  )
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.filter_mspct <- function(x, na.rm = FALSE, ...) {
  rowwise_filter(x,
                 .fun = base::prod,
                 na.rm = na.rm,
                 .fun.name = "Product of")
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.reflector_mspct <- function(x, na.rm = FALSE, ...) {
  rowwise_reflector(x,
                    .fun = base::prod,
                    na.rm = na.rm,
                    .fun.name = "Product of")
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.calibration_mspct <- function(x, na.rm = FALSE, ...) {
  rowwise_calibration(
    x,
    .fun = base::prod,
    na.rm = na.rm,
    col.name.tag = ".prod",
    .fun.name = "Product of"
  )
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.cps_mspct <- function(x, na.rm = FALSE, ...) {
  rowwise_cps(
    x,
    .fun = base::prod,
    na.rm = na.rm,
    col.name.tag = ".prod",
    .fun.name = "Product of"
  )
}

#' @describeIn s_prod
#'
#' @export
#'
s_prod.raw_mspct <- function(x, na.rm = FALSE, ...) {
  rowwise_raw(
    x,
    .fun = base::prod,
    na.rm = na.rm,
    col.name.tag = ".prod",
    .fun.name = "Product of"
  )
}
