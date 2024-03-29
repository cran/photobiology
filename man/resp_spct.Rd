% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.response.R
\name{resp_spct}
\alias{resp_spct}
\title{Calculate response from spectral response}
\usage{
resp_spct(
  spct,
  w.band,
  unit.out,
  quantity,
  time.unit,
  scale.factor,
  wb.trim,
  use.hinges,
  allow.scaled = !quantity \%in\% c("average", "mean", "total"),
  naming,
  ...
)
}
\arguments{
\item{spct}{an object of class response_spct".}

\item{w.band}{waveband or list of waveband objects or a numeric vector of
length two. The waveband(s) determine the region(s) of the spectrum that
are summarized. If a numeric range is supplied a waveband object is
constructed on the fly from it.}

\item{unit.out}{character with allowed values "energy", and "photon", or its
alias "quantum".}

\item{quantity}{character string One of "total", "average" or "mean",
"contribution", "contribution.pc", "relative" or "relative.pc".}

\item{scale.factor}{numeric vector of length 1, or length equal to that of
\code{w.band}. Numeric multiplier applied to returned values.}

\item{wb.trim}{logical if TRUE wavebands crossing spectral data boundaries
are trimmed, if FALSE, they are discarded.}

\item{use.hinges}{logical Flag indicating whether to insert "hinges" into the
spectral data before integration so as to reduce interpolation errors at
the boundaries of the wavebands.}

\item{naming}{character one of "long", "default", "short" or "none". Used to
select the type of names to assign to returned value.}

\item{...}{other arguments (possibly used by derived methods).}
}
\value{
a single numeric value expressed either as a fraction of one or a
  percentage, or a vector of the same length as the list of \code{waveband}
  objects.
}
\description{
This function returns the mean response for a given waveband and a response
spectrum.
}
\note{
The parameter \code{use.hinges} controls speed optimization. The
  defaults should be suitable in most cases. Only the range of wavelengths
  in the wavebands is used and all BSWFs are ignored.
}
\keyword{internal}
