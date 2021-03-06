% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.classes.r
\name{getTfrType}
\alias{getTfrType}
\title{Get the "Tfr.type" attribute}
\usage{
getTfrType(x)
}
\arguments{
\item{x}{a filter_spct or object_spct object}
}
\value{
character string
}
\description{
Function to read the "Tfr.type" attribute of an existing filter_spct or
object_spct object.
}
\note{
If x is not a \code{filter_spct} or an \code{object_spct} object,
  \code{NA} is returned.
}
\examples{
getTfrType(polyester.spct)

}
\seealso{
Other Tfr attribute functions: 
\code{\link{setTfrType}()}
}
\concept{Tfr attribute functions}
