% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/insert.hinges.r
\name{v_insert_hinges}
\alias{v_insert_hinges}
\title{Insert spectral data values at new wavelength values.}
\usage{
v_insert_hinges(x, y, h)
}
\arguments{
\item{x}{numeric vector (sorted in increasing order).}

\item{y}{numeric vector.}

\item{h}{a numeric vector giving the wavelengths at which the y values should
be inserted by interpolation, no interpolation is indicated by an empty
numeric vector (\code{numeric(0)}).}
}
\value{
A numeric vector with the numeric values of \code{y}, but longer.
  Unless the hinge values were already present in \code{y}, each inserted
  hinge, expands the vector by two values.
}
\description{
Inserting wavelengths values immediately before and after a discontinuity in
the SWF, greatly reduces the errors caused by interpolating the weighted
irradiance during integration of the effective spectral irradiance. This is
specially true when data have a relatively large wavelength step size and/or
when the weighting function used has discontinuities in its value or slope.
This function differs from \code{insert_hinges()} in that it returns a vector
of \code{y} values instead of a \code{tibble}.
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
\code{\link{trim_tails}()},
\code{\link{v_replace_hinges}()}
}
\concept{low-level functions operating on numeric vectors.}
\keyword{internal.}
