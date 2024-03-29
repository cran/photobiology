% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.fscale.r
\name{fscale_spct}
\alias{fscale_spct}
\title{fscale a spectrum}
\usage{
fscale_spct(spct, range, col.names, f, target, set.scaled, ...)
}
\arguments{
\item{spct}{generic_spct The spectrum to be normalized}

\item{range}{an R object on which range() returns a vector of length 2, with
min and max wavelengths (nm)}

\item{col.names}{character The name of the variable to fscale}

\item{f}{function A summary function to be applied to \code{spct}}

\item{set.scaled}{logical Flag indicating if the data is to be marked
as "scaled" or not.}

\item{...}{other arguments passed to f()}
}
\value{
a new object of the same class as \code{spct}.
}
\description{
This function returns a spectral object of the same class as the one
supplied as argument but with the spectral data re-scaled.
}
\keyword{internal}
