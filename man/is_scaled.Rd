% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.fscale.r
\name{is_scaled}
\alias{is_scaled}
\title{Query whether a generic spectrum has been scaled}
\usage{
is_scaled(x)
}
\arguments{
\item{x}{An R object.}
}
\value{
A \code{logical} value. If \code{x} is not scaled or \code{x} is
  not a \code{generic_spct} object the value returned is \code{FALSE}.
}
\description{
This function tests a \code{generic_spct} object for an attribute that
signals whether the spectral data has been rescaled or not after the object
was created.
}
\examples{

scaled.spct <- fscale(sun.spct)
is_scaled(sun.spct)
is_scaled(scaled.spct)

}
\seealso{
Other rescaling functions: 
\code{\link{fscale}()},
\code{\link{fshift}()},
\code{\link{getNormalized}()},
\code{\link{getScaled}()},
\code{\link{is_normalized}()},
\code{\link{normalize}()},
\code{\link{setNormalized}()},
\code{\link{setScaled}()}
}
\concept{rescaling functions}
