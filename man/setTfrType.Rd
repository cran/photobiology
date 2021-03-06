% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.classes.r
\name{setTfrType}
\alias{setTfrType}
\title{Set the "Tfr.type" attribute}
\usage{
setTfrType(x, Tfr.type = c("total", "internal"))
}
\arguments{
\item{x}{a filter_spct or an object_spct object}

\item{Tfr.type}{a character string, either "total" or "internal"}
}
\value{
x
}
\description{
Function to set by reference the "Tfr.type" attribute of an existing
filter_spct or object_spct object
}
\note{
This function alters x itself by reference and in addition
  returns x invisibly. If x is not a filter_spct or an object_spct object, x is not modified
  The behaviour of this function is 'unusual' in that the default for
  parameter \code{Tfr.type} is used only if \code{x} does not already have
  this attribute set.
}
\examples{
my.spct <- polyester.spct
getTfrType(my.spct)
setTfrType(my.spct, "internal")
getTfrType(my.spct)

}
\seealso{
Other Tfr attribute functions: 
\code{\link{getTfrType}()}
}
\concept{Tfr attribute functions}
