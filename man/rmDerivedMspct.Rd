% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zmspct.classes.R
\name{rmDerivedMspct}
\alias{rmDerivedMspct}
\title{Remove "generic_mspct" and derived class attributes.}
\usage{
rmDerivedMspct(x)
}
\arguments{
\item{x}{an R object.}
}
\value{
A character vector containing the removed class attribute values.
  This is different to the behaviour of function \code{unlist} in base R!
}
\description{
Removes from a spectrum object the class attributes "generic_mspct" and any
derived class attribute such as "source_mspct". \strong{This operation is done
by reference!}
}
\note{
If \code{x} is an object of any of the multi spectral classes defined
  in this package, this function changes by reference the multi spectrum
  object into the underlying list object. Otherwise, it just leaves \code{x}
  unchanged. The modified \code{x} is also returned invisibly.
}
\seealso{
Other set and unset 'multi spectral' class functions: 
\code{\link{shared_member_class}()}
}
\concept{set and unset 'multi spectral' class functions}
