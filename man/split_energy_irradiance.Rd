% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split.energy.irradiance.r
\name{split_energy_irradiance}
\alias{split_energy_irradiance}
\title{Energy irradiance for split spectrum regions}
\usage{
split_energy_irradiance(
  w.length,
  s.irrad,
  cut.w.length = range(w.length),
  unit.in = "energy",
  scale = "absolute",
  check.spectrum = TRUE,
  use.cached.mult = FALSE,
  use.hinges = getOption("photobiology.use.hinges", default = NULL)
)
}
\arguments{
\item{w.length}{numeric vector of wavelengths (nm).}

\item{s.irrad}{numeric vector of spectral (energy or photon) irradiance values
(W m-2 nm-1) or (mol s-1 m-2 nm-1).}

\item{cut.w.length}{numeric vector of wavelengths (nm).}

\item{unit.in}{character string with allowed values "energy", and "photon",
or its alias "quantum".}

\item{scale}{character string indicating the scale used for the returned
values ("absolute", "relative", "percent").}

\item{check.spectrum}{logical indicating whether to sanity check input data,
default is TRUE.}

\item{use.cached.mult}{logical Flag indicating whether multiplier values
should be cached between calls.}

\item{use.hinges}{logical Flag indicating whether to insert "hinges" into the
spectral data before integration so as to reduce interpolation errors at
the boundaries of the wavebands.}
}
\value{
a numeric vector of irradiances with no change in scale factor: [W
  m-2 nm-1] -> [W m-2] or [mol s-1 m-2] -> [W m-2] or relative values
  (fraction of one) if scale = "relative" or scale = "percent".
}
\description{
This function returns the energy irradiance for a series of contiguous
wavebands from a radiation-source spectrum. The returned values can be either
absolute or relative to their sum.
}
\note{
The last three parameters control speed optimizations. The defaults
  should be suitable in most cases. If you set \code{check.spectrum=FALSE}
  then you should call \code{\link{check_spectrum}} at least once for your
  spectrum before using any of the other functions. If you will use
  repeatedly the same SWFs on many spectra measured at exactly the same
  wavelengths you may obtain some speed up by setting
  \code{use.cached.mult=TRUE}. However, be aware that you are responsible for
  ensuring that the wavelengths are the same in each call, as the only test
  done is for the length of the \code{w.length} vector.
}
\examples{
with(sun.data,
     split_energy_irradiance(w.length, s.e.irrad,
                             cut.w.length = c(300, 400, 500, 600, 700)))

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
\code{\link{split_photon_irradiance}()},
\code{\link{subt_spectra}()},
\code{\link{sum_spectra}()},
\code{\link{trim_tails}()},
\code{\link{v_insert_hinges}()},
\code{\link{v_replace_hinges}()}
}
\concept{low-level functions operating on numeric vectors.}
