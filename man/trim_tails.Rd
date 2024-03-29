% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trim.tails.r
\name{trim_tails}
\alias{trim_tails}
\title{Trim (or expand) head and/or tail}
\usage{
trim_tails(
  x,
  y,
  low.limit = min(x),
  high.limit = max(x),
  use.hinges = TRUE,
  fill = NULL,
  verbose = TRUE
)
}
\arguments{
\item{x}{numeric vector of wavelengths.}

\item{y}{numeric vector of values for a spectral quantity.}

\item{low.limit}{smallest x-value to be kept (defaults to smallest x-value in
input).}

\item{high.limit}{largest x-value to be kept (defaults to largest x-value in
input).}

\item{use.hinges}{logical Flag indicating whether to insert "hinges" into the
spectral data before integration so as to reduce interpolation errors at
the boundaries of the wavebands.}

\item{fill}{if \code{fill == NULL} then tails are deleted, otherwise tails of
y are filled with the value of \code{fill}.}

\item{verbose}{logical Use to suppress warnings.}
}
\value{
A data.frame with variables \code{x} and \code{y}.
}
\description{
Trim tails of a spectrum based on wavelength limits, interpolating the
values at the boundaries.Trimming is needed for example to remove short
wavelength noise when the measured spectrum extends beyond the known emission
spectrum of the measured light source. Occasionally one may want also to
expand the wavelength range.
}
\note{
When expanding a spectrum, if \code{fill == NULL}, expansion is
  not performed with a warning.
}
\examples{
head(sun.data)
head(with(sun.data,
     trim_tails(w.length, s.e.irrad, low.limit=300)))
head(with(sun.data,
     trim_tails(w.length, s.e.irrad, low.limit=300, fill=NULL)))

}
\seealso{
Other low-level functions operating on numeric vectors.: 
\code{\link{as_energy}()},
\code{\link{as_quantum_mol}()},
\code{\link{calc_multipliers}()},
\code{\link{div_spectra}()},
\code{\link{energy_irradiance}()},
\code{\link{energy_ratio}()},
\code{\link{insert_hinges}()},
\code{\link{integrate_xy}()},
\code{\link{interpolate_spectrum}()},
\code{\link{irradiance}()},
\code{\link{l_insert_hinges}()},
\code{\link{oper_spectra}()},
\code{\link{photon_irradiance}()},
\code{\link{photon_ratio}()},
\code{\link{photons_energy_ratio}()},
\code{\link{prod_spectra}()},
\code{\link{s_e_irrad2rgb}()},
\code{\link{split_energy_irradiance}()},
\code{\link{split_photon_irradiance}()},
\code{\link{subt_spectra}()},
\code{\link{sum_spectra}()},
\code{\link{v_insert_hinges}()},
\code{\link{v_replace_hinges}()}
}
\concept{low-level functions operating on numeric vectors.}
