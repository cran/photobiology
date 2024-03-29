% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mspct.median.r
\name{s_median}
\alias{s_median}
\alias{s_median.default}
\alias{s_median.source_mspct}
\alias{s_median.response_mspct}
\alias{s_median.filter_mspct}
\alias{s_median.reflector_mspct}
\alias{s_median.calibration_mspct}
\alias{s_median.cps_mspct}
\alias{s_median.raw_mspct}
\title{Median of a collection of spectra}
\usage{
s_median(x, na.rm, ...)

\method{s_median}{default}(x, na.rm = FALSE, ...)

\method{s_median}{source_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{response_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{filter_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{reflector_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{calibration_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{cps_mspct}(x, na.rm = FALSE, ...)

\method{s_median}{raw_mspct}(x, na.rm = FALSE, ...)
}
\arguments{
\item{x}{An R object. Currently this package defines methods for collections
of spectral objects.}

\item{na.rm}{logical. A value indicating whether NA values should be stripped
before the computation proceeds.}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
If \code{x} is a collection spectral of objects, such as a
  "filter_mspct" object, the returned object is of same class as the members
  of the collection, such as "filter_spct", containing the median spectrum.
}
\description{
A method to compute the median of values across members of a collections of
spectra. Computes the median at each wavelength across all the spectra in the
collection returning a spectral object.
}
\section{Methods (by class)}{
\itemize{
\item \code{s_median(default)}: 

\item \code{s_median(source_mspct)}: 

\item \code{s_median(response_mspct)}: 

\item \code{s_median(filter_mspct)}: 

\item \code{s_median(reflector_mspct)}: 

\item \code{s_median(calibration_mspct)}: 

\item \code{s_median(cps_mspct)}: 

\item \code{s_median(raw_mspct)}: 

}}
\note{
Omission of NAs is done separately at each wavelength. Interpolation is
  not applied, so all spectra in \code{x} must share the same set of
  wavelengths.

  Objects of classes raw_spct and cps_spct can contain data from multiple
  scans. This functions are implemented for these classes only for the case
  when all member spectra contain data for a single scan, or spliced into a
  single column in the case of cps_spct members.
}
\seealso{
See \code{\link[stats]{median}} for the \code{median()} method used
  for the computations.
}
