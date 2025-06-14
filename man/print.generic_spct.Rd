% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.summaries.r
\name{print.generic_spct}
\alias{print.generic_spct}
\alias{print.generic_mspct}
\title{Print spectral objects}
\usage{
\method{print}{generic_spct}(x, ..., attr.simplify = TRUE, n = NULL, width = NULL)

\method{print}{generic_mspct}(x, ..., attr.simplify = TRUE, n = NULL, width = NULL, n.members = 10)
}
\arguments{
\item{x}{An object of one of the summary classes for spectra.}

\item{...}{not used in current version.}

\item{attr.simplify}{logical If all members share the same attribute value
return one copy instead of a data.frame, list or vector.}

\item{n}{Number of rows to show. If NULL, the default, will print all rows if
less than option \code{dplyr.print_max}. Otherwise, will print
\code{dplyr.print_min} rows.}

\item{width}{Width of text output to generate. This defaults to NULL, which
means use getOption("width") and only display the columns that fit on one
screen. You can also set option(dplyr.width = Inf) to override this default
and always print all columns.}

\item{n.members}{numeric Number of members of the collection to print.}
}
\value{
Returns \code{x} invisibly.
}
\description{
Print methods for objects of spectral classes, including collections of
spectra.
}
\details{
This is simply a wrapper on the print method for tibbles, with
additional information in the header. Currently, \code{width} applies only to
the table of data.

Objects are printed as is, ignoring the current settings of R options
\code{photobiology.radiation.unit} and \code{photobiology.filter.qty}.
}
\section{Functions}{
\itemize{
\item \code{print(generic_mspct)}: 

}}
\examples{

print(sun.spct)
print(sun.spct, n = 5)

print(q2e(sun.spct, action = "replace"))
print(e2q(sun.spct, action = "replace"))

print(polyester.spct)
print(any2A(polyester.spct))
print(any2Afr(polyester.spct))

print(two_filters.spct)

}
