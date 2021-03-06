% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.classes.r
\name{getResponseType}
\alias{getResponseType}
\title{Get the "response.type" attribute}
\usage{
getResponseType(x)
}
\arguments{
\item{x}{a response_spct object}
}
\value{
character string
}
\description{
Function to read the "response.type" attribute of an existing response_spct
object.
}
\details{
Objects of class \code{response_spct()} can contain data for a response
spectrum or an action spectrum. Response spectra are measured using the
same photon (or energy) irradiance at each wavelength. Action spectra are
derived from dose response curves at each wavelength, and responsivity
at each wavelength is expressed as the reciprocal of the photon fluence
required to obtain a fixed level of response.
}
\note{
If x is not a \code{response_spct} object, \code{NA} is returned.
}
\examples{
getResponseType(ccd.spct)
getResponseType(sun.spct)

}
\concept{response.type attribute functions}
