% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/copy.attr.R
\name{get_attributes}
\alias{get_attributes}
\alias{get_attributes.generic_spct}
\alias{get_attributes.source_spct}
\alias{get_attributes.filter_spct}
\alias{get_attributes.reflector_spct}
\alias{get_attributes.object_spct}
\alias{get_attributes.waveband}
\title{Get the metadata attributes}
\usage{
get_attributes(x, which, ...)

\method{get_attributes}{generic_spct}(x, which = NULL,
  allowed = all.attributes, ...)

\method{get_attributes}{source_spct}(x, which = NULL, ...)

\method{get_attributes}{filter_spct}(x, which = NULL, ...)

\method{get_attributes}{reflector_spct}(x, which = NULL, ...)

\method{get_attributes}{object_spct}(x, which = NULL, ...)

\method{get_attributes}{waveband}(x, which = NULL, ...)
}
\arguments{
\item{x}{a generic_spct object.}

\item{which}{character vector Names of attributes to retrieve.}

\item{...}{currently ignored}

\item{allowed}{character vector Names of attributes accepted by \code{which}.}
}
\value{
Named \code{list} of attribute values.
}
\description{
Method returning attributes of an object of class generic_spct or derived,
or of class waveband. Only attributes defined and/or set by package
'photobiology' for objects of the corresponding class are returned.
}
\section{Methods (by class)}{
\itemize{
\item \code{generic_spct}: generic_spct

\item \code{source_spct}: source_spct

\item \code{filter_spct}: filter_spct

\item \code{reflector_spct}: reflector_spct

\item \code{object_spct}: object_spct

\item \code{waveband}: waveband
}}

\seealso{
Other measurement metadata functions: \code{\link{getInstrDesc}},
  \code{\link{getInstrSettings}},
  \code{\link{getWhatMeasured}},
  \code{\link{getWhenMeasured}},
  \code{\link{getWhereMeasured}},
  \code{\link{isValidInstrDesc}},
  \code{\link{isValidInstrSettings}},
  \code{\link{setInstrDesc}},
  \code{\link{setInstrSettings}},
  \code{\link{setWhatMeasured}},
  \code{\link{setWhenMeasured}},
  \code{\link{setWhereMeasured}},
  \code{\link{trimInstrDesc}},
  \code{\link{trimInstrSettings}}
}