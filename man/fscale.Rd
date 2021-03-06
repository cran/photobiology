% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.fscale.r
\name{fscale}
\alias{fscale}
\alias{fscale.default}
\alias{fscale.source_spct}
\alias{fscale.response_spct}
\alias{fscale.filter_spct}
\alias{fscale.reflector_spct}
\alias{fscale.raw_spct}
\alias{fscale.cps_spct}
\alias{fscale.generic_spct}
\alias{fscale.source_mspct}
\alias{fscale.response_mspct}
\alias{fscale.filter_mspct}
\alias{fscale.reflector_mspct}
\alias{fscale.raw_mspct}
\alias{fscale.cps_mspct}
\alias{fscale.generic_mspct}
\title{Rescale a spectrum using a summary function}
\usage{
fscale(x, ...)

\method{fscale}{default}(x, ...)

\method{fscale}{source_spct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  unit.out = getOption("photobiology.radiation.unit", default = "energy"),
  set.scaled = target == 1,
  ...
)

\method{fscale}{response_spct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  unit.out = getOption("photobiology.radiation.unit", default = "energy"),
  set.scaled = target == 1,
  ...
)

\method{fscale}{filter_spct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  qty.out = getOption("photobiology.filter.qty", default = "transmittance"),
  set.scaled = target == 1,
  ...
)

\method{fscale}{reflector_spct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  qty.out = NULL,
  set.scaled = target == 1,
  ...
)

\method{fscale}{raw_spct}(x, range = NULL, f = "mean", target = 1, set.scaled = target == 1, ...)

\method{fscale}{cps_spct}(x, range = NULL, f = "mean", target = 1, set.scaled = target == 1, ...)

\method{fscale}{generic_spct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  set.scaled = target == 1,
  col.names,
  ...
)

\method{fscale}{source_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  unit.out = getOption("photobiology.radiation.unit", default = "energy"),
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{response_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  unit.out = getOption("photobiology.radiation.unit", default = "energy"),
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{filter_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  qty.out = getOption("photobiology.filter.qty", default = "transmittance"),
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{reflector_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  qty.out = NULL,
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{raw_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{cps_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  set.scaled = target == 1,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)

\method{fscale}{generic_mspct}(
  x,
  range = NULL,
  f = "mean",
  target = 1,
  set.scaled = target == 1,
  col.names,
  ...,
  .parallel = FALSE,
  .paropts = NULL
)
}
\arguments{
\item{x}{An R object}

\item{...}{additional named arguments passed down to \code{f}.}

\item{range}{numeric. An R object on which \code{range()} returns a numeric
vector of length 2 with the limits of a range of wavelengths in nm, with
min and max wavelengths (nm)}

\item{f}{character string. "mean" or "total" for scaling so that this summary
value becomes 1 for the returned object, or the name of a function taking
\code{x} as first argument and returning a numeric value.}

\item{target}{numeric A constant used as target value for scaling.}

\item{unit.out}{character. Allowed values "energy", and "photon", or its alias
"quantum".}

\item{set.scaled}{logical or NULL Flag indicating if the data is to be marked
as "scaled" or not.}

\item{qty.out}{character. Allowed values "transmittance", and "absorbance".}

\item{col.names}{character vector containing the names of columns or
variables to which to apply the scaling.}

\item{.parallel}{logical if TRUE, apply function in parallel, using parallel
backend provided by foreach.}

\item{.paropts}{a list of additional options passed into the foreach function
when parallel computation is enabled. This is important if (for example)
your code relies on external data or packages: use the .export and
.packages arguments to supply them so that all cluster nodes have the
correct environment set up for computing.}
}
\value{
A copy of \code{x} with the original spectral data values replaced
  with rescaled values, and the \code{"scaled"} attribute set to a list
  describing the scaling applied.

a new object of the same class as \code{x}.
}
\description{
These functions return a spectral object of the same class as the one
supplied as argument but with the spectral data rescaled based on summary
function \code{f} applied over a specific \code{range} or wavelengths and a
\code{target} value for the summary value.
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: Default for generic function

\item \code{source_spct}: 

\item \code{response_spct}: 

\item \code{filter_spct}: 

\item \code{reflector_spct}: 

\item \code{raw_spct}: 

\item \code{cps_spct}: 

\item \code{generic_spct}: 

\item \code{source_mspct}: 

\item \code{response_mspct}: 

\item \code{filter_mspct}: 

\item \code{reflector_mspct}: 

\item \code{raw_mspct}: 

\item \code{cps_mspct}: 

\item \code{generic_mspct}: 
}}

\note{
Sometimes we rescale a spectrum to a "theoretical" value for the
  summary, while in other cases we rescale the spectrum to a real-world
  target value of e.g. a reference energy irradiance. In the first case we
  say that the data are expressed in relative units, while in the second case
  we retain actual physical units. To indicate this, this pacakge uses an
  attribute, which will by default be set assuming the first of these two
  situations when \code{target == 1} and the second situation otherwise.
  These defaults can be overriden with an explicit \code{logical} argument
  passed to \code{set.scaled}.
}
\examples{

fscale(sun.spct)
fscale(sun.spct, f = "mean") # same as default
fscale(sun.spct, f = "mean", na.rm = TRUE)
fscale(sun.spct, range = c(400, 700)) # default is whole spectrum
fscale(sun.spct, f = e_irrad, range = c(400, 700))
s400.spct <- fscale(sun.spct,
                    f = e_irrad,
                    range = c(400, 700),
                    target = 400) # a target in W m-2
s400.spct
e_irrad(s400.spct, c(400, 700))

}
\seealso{
Other rescaling functions: 
\code{\link{fshift}()},
\code{\link{getNormalized}()},
\code{\link{getScaled}()},
\code{\link{is_normalized}()},
\code{\link{is_scaled}()},
\code{\link{normalize}()},
\code{\link{setNormalized}()},
\code{\link{setScaled}()}
}
\concept{rescaling functions}
