% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/integrate.xy.r
\name{integrate_xy}
\alias{integrate_xy}
\title{Gives irradiance from spectral irradiance.}
\usage{
integrate_xy(x, y)
}
\arguments{
\item{x}{numeric vector.}

\item{y}{numeric vector.}
}
\value{
a single numeric value with no change in scale factor: e.g. [W m-2
  nm-1] -> [W m-2]
}
\description{
This function gives the result of integrating spectral irradiance over
wavelengths.
}
\examples{
with(sun.data, integrate_xy(w.length, s.e.irrad))

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
\code{\link{trim_tails}()},
\code{\link{v_insert_hinges}()},
\code{\link{v_replace_hinges}()}
}
\concept{low-level functions operating on numeric vectors.}
