% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spct.metadata.r
\name{add_attr2tb}
\alias{add_attr2tb}
\alias{when_measured2tb}
\alias{geocode2tb}
\alias{lonlat2tb}
\alias{lon2tb}
\alias{lat2tb}
\alias{address2tb}
\alias{what_measured2tb}
\alias{how_measured2tb}
\alias{normalized2tb}
\alias{scaled2tb}
\alias{instr_desc2tb}
\alias{instr_settings2tb}
\alias{BSWF_used2tb}
\alias{filter_properties2tb}
\alias{solute_properties2tb}
\alias{Tfr_type2tb}
\alias{Rfr_type2tb}
\alias{time_unit2tb}
\alias{comment2tb}
\alias{multiple_wl2tb}
\title{Copy attributes from members of a \code{generic_mspct}}
\usage{
add_attr2tb(
  tb = NULL,
  mspct,
  col.names = NULL,
  idx = "spct.idx",
  unnest = FALSE
)

when_measured2tb(mspct, tb = NULL, col.names = "when.measured", idx = NULL)

geocode2tb(mspct, tb = NULL, col.names = "geocode", idx = "spct.idx")

lonlat2tb(mspct, tb = NULL, col.names = c("lon", "lat"), idx = "spct.idx")

lon2tb(mspct, tb = NULL, col.names = "lon", idx = "spct.idx")

lat2tb(mspct, tb = NULL, col.names = "lat", idx = "spct.idx")

address2tb(mspct, tb = NULL, col.names = "address", idx = "spct.idx")

what_measured2tb(
  mspct,
  tb = NULL,
  col.names = "what.measured",
  idx = "spct.idx"
)

how_measured2tb(mspct, tb = NULL, col.names = "how.measured", idx = "spct.idx")

normalized2tb(mspct, tb = NULL, col.names = "normalized", idx = "spct.idx")

scaled2tb(mspct, tb = NULL, col.names = "scaled", idx = "spct.idx")

instr_desc2tb(mspct, tb = NULL, col.names = "instr.desc", idx = "spct.idx")

instr_settings2tb(
  mspct,
  tb = NULL,
  col.names = "instr.settings",
  idx = "spct.idx"
)

BSWF_used2tb(mspct, tb = NULL, col.names = "BSWF.used", idx = "spct.idx")

filter_properties2tb(
  mspct,
  tb = NULL,
  col.names = "filter.properties",
  idx = "spct.idx"
)

solute_properties2tb(
  mspct,
  tb = NULL,
  col.names = "solute.properties",
  idx = "spct.idx"
)

Tfr_type2tb(mspct, tb = NULL, col.names = "Tfr.type", idx = "spct.idx")

Rfr_type2tb(mspct, tb = NULL, col.names = "Rfr.type", idx = "spct.idx")

time_unit2tb(mspct, tb = NULL, col.names = "time.unit", idx = "spct.idx")

comment2tb(mspct, tb = NULL, col.names = "comment", idx = "spct.idx")

multiple_wl2tb(mspct, tb = NULL, col.names = "multiple.wl", idx = "spct.idx")
}
\arguments{
\item{tb}{tibble or \code{data.frame} to which to add the data (optional).}

\item{mspct}{generic_mspct or generic_spct Any collection of spectra or one
or more spectra in long form.}

\item{col.names}{named \code{character} vector Name(s) of metadata attributes
to copy. If named, the names provide the name for the columns.}

\item{idx}{character Name of the column with the names of the members of the
collection of spectra.}

\item{unnest}{logical Flag controlling if metadata attributes that are lists
of values should be returned in a list column or in separate columns.}
}
\value{
A \code{data.frame} or a \code{tibble} With the metadata attributes
  in separate new variables.
}
\description{
Copy metadata attributes from members of a \code{generic_mspct} object into
a \code{data.frame} or a \code{tibble}.
}
\details{
Each attribute is by default copied to a column in a \code{tibble}
  or a \code{data.frame}. If the argument for \code{tb} is \code{NULL}, as by
  default, a new \code{tibble} will be created. If an existing
  \code{data.frame} or \code{tibble} is passed as argument, new columns are
  added to it. However, the number of rows in the argument passed to
  \code{tb} must match the number of spectra in the argument passed to
  \code{mspct}. Only in the case of methods \code{add_attr2tb()} and
  \code{spct_metadata()} if the argument to \code{col.names} is a named
  vector, the names of members are used as names for the columns created.
  This permits setting any valid name for the new columns. If the members of
  the vector passed to \code{col.names} have no names, then the value is
  interpreted as the name of the attributes to add, and also used as name for
  the new column.

  Valid values accepted as argument to \code{col.names} are \code{NULL}, or a
  vector containing one or more of the following \code{character} strings:
  \code{"lon"}, \code{"lat"}, \code{"address"}, \code{"geocode"},
  \code{"where.measured"}, \code{"when.measured"}, \code{"what.measured"},
  \code{"how.measured"}, \code{"comment"}, \code{"normalised"},
  \code{"normalized"}, \code{"scaled"}, \code{"bswf.used"},
  \code{"instr.desc"}, \code{"instr.settings"}, \code{solute.properties},
  \code{"filter.properties"}, \code{"Tfr.type"}, \code{"Rfr.type"},
  \code{"time.unit"}.
}
\note{
The order of the first two arguments is reversed in
  \code{add_attr2tb()}, \code{when_measured2tb()}, \code{what_measured2tb()},
  etc., compared to attribute query functions, such as \code{spct_metadata},
  \code{when_measured()}, \code{what_measured()}, \code{how_measured()}, etc.
  This is to allow the use of \code{add_attr2tb()} in 'pipes' to add metadata
  to summaries computed at earlier steps in the pipe.
}
\examples{
# Add attributes to irradiance
## from collection of spectra
e_irrad(sun_evening.mspct) |>
  add_attr2tb(sun_evening.mspct,
              c(when.measured = "time"))

## from spectra in long form
e_irrad(sun_evening.spct) |>
  add_attr2tb(sun_evening.spct,
              c(when.measured = "time"))

# Add attributes to transmittance
## from collection of spectra
transmittance(two_filters.mspct) |>
  add_attr2tb(two_filters.mspct, col.names = "what.measured")

transmittance(two_filters.mspct) |>
  add_attr2tb(two_filters.mspct,
              col.names = c("filter.properties", "what.measured"),
              unnest = TRUE)

# Create a new data frame
add_attr2tb(mspct = two_filters.mspct,
            idx = "filter",
            col.names = c("filter.properties", "what.measured"),
            unnest = TRUE)

}
\seealso{
Other measurement metadata functions: 
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
\code{\link{isValidInstrSettings}()},
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
