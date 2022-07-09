# [Ecosystem](@id eco)

The joy of our community are the many packages available for wide use. Community Astronomy and Astrophysics packages for Julia. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development.

## Data I/O

### [AstroImages.jl](https://github.com/JuliaAstro/AstroImages.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface

### [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) [![](assets/book.png)](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
- FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.

### [CFITSIO.jl](https://github.com/JuliaAstro/CFITSIO.jl) [![](assets/book.png)](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
- The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)

### [mweastwood/CasaCore.jl](https://github.com/mweastwood/CasaCore.jl) [![](assets/book.png)](http://mweastwood.info/CasaCore.jl/stable/)

**Tables and measurement sets for radio astronomy**

- Wrapper for [CasaCore](http://casacore.github.io/casacore/)
- Interface for CASA tables and measures

### [emmt/OIFITS.jl](https://github.com/emmt/OIFITS.jl)

**Support for OI-FITS**

- Read and write OI-FITS optical interferometry data format

## Visualization and Plotting

### [AstroImages.jl](https://github.com/JuliaAstro/AstroImages.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
- Automatic visualizations are directly integrated into many environments like [VSCode](https://code.visualstudio.com/), [Pluto.jl](https://github.com/fonsp/Pluto.jl), and [IJulia.jl](https://github.com/JuliaLang/IJulia.jl)
- Includes recipes for plotting with [Plots.jl](https://github.com/JuliaPlots/Plots.jl)

### [SAOImageDS9.jl](https://github.com/JuliaAstro/SAOImageDS9.jl) [![](assets/book.png)](https://juliaastro.github.io/SAOImageDS9.jl/stable/)

**Interface with the DS9 image viewer**

- Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
- Easily display images in DS9 and add features like circles and lines
- Low-level API accessible with `set` and `get`

## Image Processing

### [CCDReduction.jl](https://github.com/JuliaAstro/CCDReduction.jl) [![](assets/book.png)](https://juliaastro.github.io/CCDReduction.jl/stable/)

**Common CCD image processing routines**

- Creation of calibration files
- Dark subtraction, flat normalization, bias subtraction, cropping
- Specialized iterator for processing directories of FITS files using a table built from the FITS headers.

### [LACosmic.jl](https://github.com/JuliaAstro/LACosmic.jl) [![](assets/book.png)](https://juliaastro.github.io/LACosmic.jl/stable/)

**Cosmic-ray rejection by Laplacian edge detection**

- Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
- Clean bad-pixels from cosmic rays or other sources like hot pixels.

### [Photometry.jl](https://github.com/JuliaAstro/Photometry.jl) [![](assets/book.png)](https://juliaastro.github.io/Photometry.jl/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry

### [PSFModels.jl](https://github.com/JuliaAstro/PSFModels.jl) [![](assets/book.png)](https://juliaastro.github.io/PSFModels.jl/stable/)

**Analytical, allocation-free point-spread-functions (PSF)**

- Lazy representation allows fast allocation-free calculations
- Gaussian (Normal), Moffat, and Airy disk.

### [Reproject.jl](https://github.com/JuliaAstro/Reproject.jl) [![](assets/book.png)](https://juliaastro.github.io/Reproject.jl/stable/)

**Astronomical image reprojection**

- Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images

### [JuliaHCI/HCIToolbox.jl](https://github.com/JuliaHCI/HCIToolbox.jl) [![](assets/book.png)](http://JuliaHCI.github.io/HCIToolbox.jl/stable/)

**Common utilities for high-contrast imaging (HCI) processing**

- Morphological operations (rotation, stacking, shifting)
- Masking routines (circles, annulus, series of annuli)
- Spectral scaling and descaling

### [JuliaHCI/SubpixelRegistration.jl](https://github.com/JuliaHCI/SubpixelRegistration.jl) [![](assets/book.png)](http://JuliaHCI.github.io/SubpixelRegistration.jl/stable/)

**Sub-pixel registration using discrete Fourier transforms**

- Uses FFTs to register images, with arbitrary precision
- Includes methods for Fourier based image-translation (phase-shifting)

### [JuliaHCI/ADI.jl](https://github.com/JuliaHCI/ADI.jl) [![](assets/book.png)](http://JuliaHCI.github.io/ADI.jl/stable/)

**Angular Differential Imaging (ADI) routines in Julia**

- PCA, NMF, LLSG, LOCI, etc.
- Apply algorithms framewise or in spectral differential imaging (SDI) using Julia's multiple dispatch
- Provide an interface for using these algorithms in other tools
- HCI metrics including S/N maps, contrast curves, throughput curves (from PSF injection), STIM, etc.

## Statistics

### [mileslucas/BiweightStats.jl](https://github.com/mileslucas/BiweightStats.jl) [![](assets/book.png)](http://mileslucas.com/BiweightStats.jl/stable/)

**Robust statistics based on the biweight transform**

- Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics

### [JuliaHCI/ADI.jl](https://github.com/JuliaHCI/ADI.jl) [![](assets/book.png)](http://JuliaHCI.github.io/ADI.jl/stable/)

**Angular Differential Imaging (ADI) routines in Julia**

- PCA, NMF, LLSG, LOCI, etc.
- Apply algorithms framewise or in spectral differential imaging (SDI) using Julia's multiple dispatch
- Provide an interface for using these algorithms in other tools
- HCI metrics including S/N maps, contrast curves, throughput curves (from PSF injection), STIM, etc.

## Time, Coordinates, Units

### [AstroAngles.jl](https://github.com/JuliaAstro/AstroAngles.jl)

**String parsing and representation of angles**

- Parse and represent sexagesimal angles with a variety of delimiters
- Methods for converting to hour-minute-second angles from degrees and radians, and vice-versa

### [AstroTime.jl](https://github.com/JuliaAstro/AstroTime.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroTime.jl/stable/)

**Astronomical time keeping**

- High-precision, time-scale aware, DateTime-like data type
- Support all commonly used astronomical time scales

### [ERFA.jl](https://github.com/JuliaAstro/ERFA.jl)

**Time systems conversions**

- Low-level ERFA wrapper
- Wrapper for [liberfa](https://github.com/liberfa/erfa)

### [SkyCoords.jl](https://github.com/JuliaAstro/SkyCoords.jl)

**Astronomical coordinate systems**

- Supports ICRS, galactic, and FK5 coordinate systems
- Fast conversion of coordinates between different systems

### [UnitfulAstro.jl](https://github.com/JuliaAstro/UnitfulAstro.jl) [![](assets/book.png)](https://juliaastro.github.io/UnitfulAstro.jl/stable/)

**Astronomical units**

- Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [WCS.jl](https://github.com/JuliaAstro/WCS.jl) [![](assets/book.png)](https://juliaastro.github.io/WCS.jl/stable/)

**World Coordinate System transformations**

- Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)

## Orbits and Ephemerides

### [Transits.jl](https://github.com/JuliaAstro/Transits.jl) [![](assets/book.png)](https://juliaastro.github.io/Transits.jl/stable/)

**Flexible photometric transit curves with limb darkening**

- Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
- Includes Keplerian orbits and generic orbits
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [sefffal/DirectOrbits.jl](https://github.com/sefffal/DirectOrbits.jl) [![](assets/book.png)](https://sefffal.github.io/DirectOrbits.jl/stable/)

**Tools for displaying, solving Keplerian orbits in the context of direct imaging**

### [EarthOrientation.jl](https://github.com/JuliaAstro/EarthOrientation.jl) [![](assets/book.png)](https://juliaastro.github.io/EarthOrientation.jl/stable/)

**Earth orientation parameters**

- Calculate Earth orientation parameters from IERS tables

### [JPLEphemeris.jl](https://github.com/JuliaAstro/JPLEphemeris.jl)

**JPL Development Ephemerides**

- Calculate positions and velocities of solar system bodies

### [AstroLib.jl](https://github.com/JuliaAstro/astrolib.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroLib.jl/stable/)

**Collection of generic astronomical and astrophysical functions**

- Translation of many IDL AstroLib procedures

## General

### [AstroLib.jl](https://github.com/JuliaAstro/astrolib.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroLib.jl/stable/)

**Collection of generic astronomical and astrophysical functions**

- Translation of many IDL AstroLib procedures

### [BoxLeastSquares.jl](https://github.com/JuliaAstro/BoxLeastSquares.jl) [![](assets/book.png)](https://juliaastro.github.io/BoxLeastSquares.jl/stable/)

**Compute box-least-squares periodogram**

- Fit BLS periodograms to time-series data
- Extract best-fitting transit parameters from the BLS periodogram
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [Cosmology.jl](https://github.com/JuliaAstro/Cosmology.jl) [![](assets/book.png)](https://juliaastro.github.io/Cosmology.jl/stable/)

**Distances in the universe**

- ``\Lambda``-CDM and ``w_0``-``w_a`` cosmologies
- Open, closed, and flat variants
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [DustExtinction.jl](https://github.com/JuliaAstro/DustExtinction.jl) [![](assets/book.png)](https://juliaastro.github.io/DustExtinction.jl/stable/)

**Dust extinction laws and maps**

- Various empirical extinction models
- SFD (1998) galactic dust map
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [LombScargle.jl](https://github.com/JuliaAstro/LombScargle.jl) [![](assets/book.png)](https://juliaastro.github.io/LombScargle.jl/stable/)

**Compute Lomb-Scargle periodogram**

- Determine period of unevenly sampled periodic signals
- Supports multi-threading
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### [Photometry.jl](https://github.com/JuliaAstro/Photometry.jl) [![](assets/book.png)](https://juliaastro.github.io/Photometry.jl/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry

### [Transits.jl](https://github.com/JuliaAstro/Transits.jl) [![](assets/book.png)](https://juliaastro.github.io/Transits.jl/stable/)

**Flexible photometric transit curves with limb darkening**

- Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
- Includes Keplerian orbits and generic orbits
- Fast polynomial limb-darkening laws based on [Agol, Luger, Foreman-Mackey (2020)](https://arxiv.org/abs/1908.03222)
- Composable limb-darkening extensions for integrated light curves and secondary light curves.
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
