% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.new.r
\name{source_spct}
\alias{source_spct}
\alias{calibration_spct}
\alias{raw_spct}
\alias{cps_spct}
\alias{generic_spct}
\alias{response_spct}
\alias{filter_spct}
\alias{reflector_spct}
\alias{object_spct}
\alias{chroma_spct}
\title{Spectral-object constructor}
\usage{
source_spct(
  w.length = NULL,
  s.e.irrad = NULL,
  s.q.irrad = NULL,
  time.unit = c("second", "day", "exposure"),
  bswf.used = c("none", "unknown"),
  comment = NULL,
  strict.range = getOption("photobiology.strict.range", default = FALSE),
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

calibration_spct(
  w.length = NULL,
  irrad.mult = NA_real_,
  comment = NULL,
  instr.desc = NA,
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

raw_spct(
  w.length = NULL,
  counts = NA_real_,
  comment = NULL,
  instr.desc = NA,
  instr.settings = NA,
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

cps_spct(
  w.length = NULL,
  cps = NA_real_,
  comment = NULL,
  instr.desc = NA,
  instr.settings = NA,
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

generic_spct(
  w.length = NULL,
  comment = NULL,
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

response_spct(
  w.length = NULL,
  s.e.response = NULL,
  s.q.response = NULL,
  time.unit = c("second", "day", "exposure"),
  response.type = c("response", "action"),
  comment = NULL,
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

filter_spct(
  w.length = NULL,
  Tfr = NULL,
  Tpc = NULL,
  Afr = NULL,
  A = NULL,
  Tfr.type = c("total", "internal"),
  comment = NULL,
  strict.range = getOption("photobiology.strict.range", default = FALSE),
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

reflector_spct(
  w.length = NULL,
  Rfr = NULL,
  Rpc = NULL,
  Rfr.type = c("total", "specular"),
  comment = NULL,
  strict.range = getOption("photobiology.strict.range", default = FALSE),
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

object_spct(
  w.length = NULL,
  Rfr = NULL,
  Tfr = NULL,
  Afr = NULL,
  Tfr.type = c("total", "internal"),
  Rfr.type = c("total", "specular"),
  comment = NULL,
  strict.range = getOption("photobiology.strict.range", default = FALSE),
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)

chroma_spct(
  w.length = NULL,
  x,
  y,
  z,
  comment = NULL,
  strict.range = getOption("photobiology.strict.range", default = FALSE),
  multiple.wl = 1L,
  idfactor = NULL,
  ...
)
}
\arguments{
\item{w.length}{numeric vector with wavelengths in nanometres}

\item{s.e.irrad}{numeric vector with spectral energy irradiance in [W m-2
nm-1] or [J d-1 m-2 nm-1]}

\item{s.q.irrad}{numeric A vector with spectral photon irradiance in [mol s-1
m-2 nm-1] or [mol d-1 m-2 nm-1].}

\item{time.unit}{character string indicating the time unit used for spectral
irradiance or exposure ("second" , "day" or "exposure") or an object of
class duration as defined in package lubridate.}

\item{bswf.used}{character A string indicating the BSWF used, if any, for
spectral effective irradiance or exposure ("none" or the name of the BSWF).}

\item{comment}{character A string to be added as a comment attribute to the
object created.}

\item{strict.range}{logical Flag indicating whether off-range values result
in an error instead of a warning.}

\item{multiple.wl}{numeric Maximum number of repeated w.length entries with
same value.}

\item{idfactor}{character Name of factor distinguishing multiple spectra when
stored logitudinally (required if mulitple.wl > 1).}

\item{...}{other arguments passed to \code{tibble()}}

\item{irrad.mult}{numeric vector with multipliers for each detector pixel.}

\item{instr.desc}{a list}

\item{counts}{numeric vector with raw counts expressed per scan}

\item{instr.settings}{a list}

\item{cps}{numeric vector with linearized raw counts expressed per second}

\item{s.e.response}{numeric vector with spectral energy irradiance in W m-2
nm-1 or J d-1 m-2 nm-1}

\item{s.q.response}{numeric vector with spectral photon irradiance in mol s-1
m-2 nm-1 or mol d-1 m-2 nm-1}

\item{response.type}{a character string, either "response" or "action".}

\item{Tfr}{numeric vector with spectral transmittance as fraction of one}

\item{Tpc}{numeric vector with spectral transmittance as percent values}

\item{Afr}{numeric vector of absorptance as fraction of one}

\item{A}{numeric vector of absorbance values (log10 based a.u.)}

\item{Tfr.type}{character string indicating whether transmittance
and absorptance values are "total" or "internal" values}

\item{Rfr}{numeric vector with spectral reflectance as fraction of one}

\item{Rpc}{numeric vector with spectral reflectance as percent values}

\item{Rfr.type}{character A string, either "total" or "specular".}

\item{x, y, z}{numeric colour coordinates}
}
\value{
A object of class generic_spct or a class derived from it, depending
  on the function used. In other words an object of a class with the same
  name as the constructor function.
}
\description{
These functions can be used to create spectral objects derived from
\code{generic_spct}. They take as arguments numeric vectors for the data
character scalars for attributes, and a logical flag.
}
\note{
The functions can be used to add only one spectral quantity to a
  spectral object. Some of the functions have different arguments, for the
  same quantity expressed in different units. An actual parameter can be
  supplied to only one of these formal parameters in a given call to any of
  these functions.

"internal" transmittance is defined as the transmittance of the
  material body itself, while "total" transmittance includes the effects of
  surface reflectance on the amount of light transmitted.
}
\seealso{
Other constructors of spectral objects: 
\code{\link{as.calibration_spct}()},
\code{\link{as.chroma_spct}()},
\code{\link{as.cps_spct}()},
\code{\link{as.filter_spct}()},
\code{\link{as.generic_spct}()},
\code{\link{as.object_spct}()},
\code{\link{as.raw_spct}()},
\code{\link{as.reflector_spct}()},
\code{\link{as.response_spct}()},
\code{\link{as.source_spct}()}
}
\concept{constructors of spectral objects}
