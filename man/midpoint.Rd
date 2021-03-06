% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/waveband.class.r
\name{wl_midpoint}
\alias{wl_midpoint}
\alias{midpoint}
\alias{midpoint.default}
\alias{midpoint.numeric}
\alias{midpoint.waveband}
\alias{midpoint.generic_spct}
\alias{midpoint.generic_mspct}
\title{Midpoint}
\usage{
wl_midpoint(x, ...)

midpoint(x, ...)

\method{midpoint}{default}(x, ...)

\method{midpoint}{numeric}(x, ...)

\method{midpoint}{waveband}(x, ...)

\method{midpoint}{generic_spct}(x, ...)

\method{midpoint}{generic_mspct}(x, ..., idx = "spct.idx")
}
\arguments{
\item{x}{an R object}

\item{...}{not used in current version}

\item{idx}{character Name of the column with the names of the members of the
collection of spectra.}
}
\value{
A numeric value equal to (max(x) - min(x)) / 2. In the case of spectral
objects a wavelength in nm. For any other R object, according to available
definitions of \code{\link{min}} and \code{\link{max}}.
}
\description{
A function that returns the wavelength (or value) at the center of the
of the wavelength range of a waveband or spectrum object (or numeric vector).
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: Default method for generic function

\item \code{numeric}: Default method for generic function

\item \code{waveband}: Wavelength at center of a "waveband".

\item \code{generic_spct}: Method for "generic_spct".

\item \code{generic_mspct}: Method for "generic_mspct" objects.
}}

\examples{
midpoint(10:20)
midpoint(sun.spct)
wl_midpoint(sun.spct)

midpoint(sun.spct)

}
\seealso{
Other wavelength summaries: 
\code{\link{wl_min}()},
\code{\link{wl_range}()},
\code{\link{wl_stepsize}()}

Other wavelength summaries: 
\code{\link{wl_min}()},
\code{\link{wl_range}()},
\code{\link{wl_stepsize}()}

Other wavelength summaries: 
\code{\link{wl_min}()},
\code{\link{wl_range}()},
\code{\link{wl_stepsize}()}
}
\concept{wavelength summaries}
