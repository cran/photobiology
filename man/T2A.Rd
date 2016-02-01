% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.operators.r
\name{T2A}
\alias{T2A}
\alias{T2A.default}
\alias{T2A.filter_mspct}
\alias{T2A.filter_spct}
\title{Convert transmittance into absorbance.}
\usage{
T2A(x, action, byref, ...)

\method{T2A}{default}(x, action = NULL, byref = FALSE, ...)

\method{T2A}{filter_spct}(x, action = "add", byref = FALSE, ...)

\method{T2A}{filter_mspct}(x, action = "add", byref = FALSE, ...)
}
\arguments{
\item{x}{an R object}

\item{action}{character Allowed values "replace" and "add"}

\item{byref}{logical indicating if new object will be created by reference or by copy of x}

\item{...}{not used in current version}
}
\description{
Function that coverts transmittance into absorbance (fraction).
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: Default method for generic function

\item \code{filter_spct}: Method for filter spectra

\item \code{filter_mspct}: Method for collections of filter spectra
}}
\seealso{
Other quantity conversion functions: \code{\link{A2T}},
  \code{\link{as_energy}}, \code{\link{as_quantum_mol}},
  \code{\link{as_quantum}},
  \code{\link{e2qmol_multipliers}},
  \code{\link{e2quantum_multipliers}}, \code{\link{e2q}},
  \code{\link{q2e}}
}
