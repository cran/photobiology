% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.metadata.r
\name{isValidInstrSettings}
\alias{isValidInstrSettings}
\title{Check the "instr.settings" attribute}
\usage{
isValidInstrSettings(x)
}
\arguments{
\item{x}{a \code{generic_spct} object or a \code{summary_generic_spct}
object.}
}
\value{
logical TRUE if at least the integration time is found in the
  metadata attribute. If \code{x} is not a \code{generic_spct} or
  a \code{summary_generic_spct} object, \code{NA} is returned.
}
\description{
Function to validate the \code{"instr.settings"} attribute of an existing
\code{generic_spct} or \code{summary_generic_spct} object.
}
\seealso{
Other measurement metadata functions: 
\code{\link{add_attr2tb}()},
\code{\link{getFilterProperties}()},
\code{\link{getHowMeasured}()},
\code{\link{getInstrDesc}()},
\code{\link{getInstrSettings}()},
\code{\link{getSoluteProperties}()},
\code{\link{getWhatMeasured}()},
\code{\link{getWhenMeasured}()},
\code{\link{getWhereMeasured}()},
\code{\link{get_attributes}()},
\code{\link{isValidInstrDesc}()},
\code{\link{select_spct_attributes}()},
\code{\link{setFilterProperties}()},
\code{\link{setHowMeasured}()},
\code{\link{setInstrDesc}()},
\code{\link{setInstrSettings}()},
\code{\link{setSoluteProperties}()},
\code{\link{setWhatMeasured}()},
\code{\link{setWhenMeasured}()},
\code{\link{setWhereMeasured}()},
\code{\link{spct_attr2tb}()},
\code{\link{spct_metadata}()},
\code{\link{subset_attributes}()},
\code{\link{trimInstrDesc}()},
\code{\link{trimInstrSettings}()}
}
\concept{measurement metadata functions}
