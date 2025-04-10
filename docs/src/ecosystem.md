# [Ecosystem](@id eco)

The joy of our community is the many astronomy and astrophysics packages available for wide use. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development.

---

## Data I/O

### AstroImages.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/AstroImages.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface

### CFITSIO.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/CFITSIO.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
- The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)

### FITSIO.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/FITSIO.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
- FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.

### eschnett/ASDF2.jl

[![curly braces](assets/code.png) Repository](https://github.com/eschnett/ASDF2.jl)

[![book icon](assets/book.png) Documentation](https://eschnett.github.io/ASDF2.jl/dev/)

**Load files in ASDF format, which is the upcoming stadnard for STScI/Roman**

### mweastwood/CasaCore.jl

[![curly braces](assets/code.png) Repository](https://github.com/mweastwood/CasaCore.jl)

[![book icon](assets/book.png) Documentation](http://mweastwood.info/CasaCore.jl/stable/)

**Tables and measurement sets for radio astronomy**

- Wrapper for [CasaCore](http://casacore.github.io/casacore/)
- Interface for CASA tables and measures

### JuliaAPlavin/Difmap.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAPlavin/Difmap.jl)

[![book icon](assets/book.png) Documentation](https://aplavin.github.io/Difmap.jl/test/examples.html)

**Wrapper for the Difmap program used in synthesis imaging**

- Execute [Difmap](http://www.ascl.net/1103.001) scripts, handle inputs/outputs and logs
- Display images and plots from Difmap in interactive Julia environments

### emmt/OIFITS.jl

[![curly braces](assets/code.png) Repository](https://github.com/emmt/OIFITS.jl)

[![book icon](assets/book.png) Documentation](https://github.com/emmt/OIFITS.jl?tab=readme-ov-file#support-for-oi-fits-data-in-julia)

**Support for OI-FITS**

- Read and write OI-FITS optical interferometry data format

### JuliaAPlavin/VLBIData.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAPlavin/VLBIData.jl)

[![book icon](assets/book.png) Documentation](https://aplavin.github.io/VLBIData.jl/test/examples.html)

**Work with data formats common in very long baseline interferometry (VLBI)**

- Read interferometric visibilities (`uvfits`), images (`fits`), and source models
- Minimal writing support for source models

---

## Image Processing

### AstroImages.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/AstroImages.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
- Automatic visualizations are directly integrated into many environments like [VSCode](https://code.visualstudio.com/), [Pluto.jl](https://github.com/fonsp/Pluto.jl), and [IJulia.jl](https://github.com/JuliaLang/IJulia.jl)
- Includes recipes for plotting with [Plots.jl](https://github.com/JuliaPlots/Plots.jl)

### CCDReduction.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/CCDReduction.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/CCDReduction.jl/stable/)

**Common CCD image processing routines**

- Creation of calibration files
- Dark subtraction, flat normalization, bias subtraction, cropping
- Specialized iterator for processing directories of FITS files using a table built from the FITS headers.

### LACosmic.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/LACosmic.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/LACosmic.jl/stable/)

**Cosmic-ray rejection by Laplacian edge detection**

- Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
- Returns bad pixel masks and cleaned data

### Photometry.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/Photometry.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/Photometry.jl/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry

### PSFModels.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/PSFModels.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/PSFModels.jl/stable/)

**Analytical, allocation-free point-spread-functions (PSF)**

- Lazy representation allows fast allocation-free calculations
- Gaussian (Normal), Moffat, and Airy disk.

### Reproject.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/Reproject.jl)

[![book icon](assets/book.png) Documentation](https://github.com/JuliaAstro/Reproject.jl?tab=readme-ov-file#reproject)

**Astronomical image reprojection**

- Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images

### SAOImageDS9.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/SAOImageDS9.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/SAOImageDS9.jl/stable/)

**Interface with the DS9 image viewer**

- Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
- Easily display images in DS9 and add features like circles and lines
- Low-level API accessible with `set` and `get`

### JuliaHCI/ADI.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaHCI/ADI.jl)

[![book icon](assets/book.png) Documentation](http://JuliaHCI.github.io/ADI.jl/stable/)

**Angular Differential Imaging (ADI) routines in Julia**

- PCA, NMF, LLSG, LOCI, etc.
- Apply algorithms framewise or in spectral differential imaging (SDI) using Julia's multiple dispatch
- Provide an interface for using these algorithms in other tools
- Common HCI metrics including S/N maps, contrast curves, throughput curves (from PSF injection), STIM, etc.

### JuliaHCI/HCIToolbox.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaHCI/HCIToolbox.jl)

[![book icon](assets/book.png) Documentation](http://JuliaHCI.github.io/HCIToolbox.jl/stable/)

**Common utilities for high-contrast imaging (HCI) processing**

- Morphological operations (rotation, stacking, shifting)
- Masking routines (circles, annulus, series of annuli)
- Spectral scaling and descaling

### JuliaHCI/SubpixelRegistration.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaHCI/SubpixelRegistration.jl)

[![book icon](assets/book.png) Documentation](http://JuliaHCI.github.io/SubpixelRegistration.jl/stable/)

**Sub-pixel registration using discrete Fourier transforms**

- Uses FFTs to register images, with arbitrary precision
- Includes methods for Fourier based image-translation (phase-shifting)

---

## Time, Coordinates, Units

### AstroAngles.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/AstroAngles.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.org/AstroAngles.jl/dev/)

**String parsing and representation of angles**

- Parse and represent sexagesimal angles with a variety of delimiters
- Methods for converting to hour-minute-second angles from degrees and radians, and vice-versa

### AstroTime.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/AstroTime.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/AstroTime.jl/stable/)

**Astronomical time keeping**

- High-precision, time-scale aware, DateTime-like data type
- Support all commonly used astronomical time scales

### ERFA.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/ERFA.jl)

[![book icon](assets/book.png) Documentation](https://github.com/JuliaAstro/ERFA.jl?tab=readme-ov-file#erfajl)

**Time systems conversions**

- Low-level wrapper for [liberfa](https://github.com/liberfa/erfa)

### SkyCoords.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/SkyCoords.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.org/SkyCoords.jl/stable/)

**Astronomical coordinate systems**

- Supports ICRS, galactic, and FK5 coordinate systems
- Fast conversion of coordinates between different systems

### SPICE.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/SPICE.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.org/SPICE.jl/stable/)

**SPICE data retrieval and usage**

- Wrapper for [CSPICE](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/index.html)
- Read SPICE data files and compute derived observation geometry such as altitude, latitude/longitude and lighting angles

### UnitfulAstro.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/UnitfulAstro.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/UnitfulAstro.jl/stable/)

**Astronomical units**

- Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### WCS.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/WCS.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/WCS.jl/stable/)

**World Coordinate System transformations**

- Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)

---

## Orbits and Ephemerides

### EarthOrientation.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/EarthOrientation.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/EarthOrientation.jl/stable/)

**Earth orientation parameters**

- Calculate Earth orientation parameters from IERS tables

### Transits.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/Transits.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/Transits.jl/stable/)

**Flexible photometric transit curves with limb darkening**

- Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
- Includes Keplerian orbits and generic orbits
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### helgee/JPLEphemeris.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/JPLEphemeris.jl)

[![book icon](assets/book.png) Documentation](https://github.com/helgee/JPLEphemeris.jl?tab=readme-ov-file#jplephemerisjl)

**JPL Development Ephemerides**

- Calculate positions and velocities of solar system bodies

### sefffal/PlanetOrbits.jl

[![curly braces](assets/code.png) Repository](https://github.com/sefffal/PlanetOrbits.jl)

[![book icon](assets/book.png) Documentation](https://sefffal.github.io/PlanetOrbits.jl/stable/)

**Tools for displaying and solving Keplerian orbits in the context of direct imaging**

---

## General

### AstroLib.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/astrolib.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/AstroLib.jl/stable/)

**Collection of generic astronomical and astrophysical functions**

- Translation of many IDL AstroLib procedures

### BoxLeastSquares.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/BoxLeastSquares.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/BoxLeastSquares.jl/stable/)

**Compute box-least-squares periodogram**

- Fit BLS periodograms to time-series data
- Extract best-fitting transit parameters from the BLS periodogram
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### Cosmology.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/Cosmology.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/Cosmology.jl/stable/)

**Distances in the universe**

- ``\Lambda``-CDM and ``w_0``-``w_a`` cosmologies
- Open, closed, and flat variants
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### DustExtinction.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/DustExtinction.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/DustExtinction.jl/stable/)

**Dust extinction laws and maps**

- Various empirical extinction models
- SFD (1998) galactic dust map
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)

### LombScargle.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/LombScargle.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/LombScargle.jl/stable/)

**Compute Lomb-Scargle periodogram**

- Create periodograms from unevenly sampled periodic signals
- Supports multi-threading

### Photometry.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaAstro/Photometry.jl)

[![book icon](assets/book.png) Documentation](https://juliaastro.github.io/Photometry.jl/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry

### mileslucas/BiweightStats.jl

[![curly braces](assets/code.png) Repository](https://github.com/mileslucas/BiweightStats.jl)

[![book icon](assets/book.png) Documentation](http://mileslucas.com/BiweightStats.jl/stable/)

**Robust statistics based on the biweight transform**

- Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics

### ziotom78/Healpix.jl

[![curly braces](assets/code.png) Repository](https://github.com/ziotom78/Healpix.jl)

[![book icon](assets/book.png) Documentation](https://ziotom78.github.io/Healpix.jl/stable/)

**Implementation of Healpix spherical tesselation scheme in pure Julia**

- pixel functions, query functions, map functions
- power spectrum support
- plotting support

See also:
- [HealpixMPI.jl](https://github.com/LeeoBianchi/HealpixMPI.jl)

### ajwheeler/Korg.jl

[![curly braces](assets/code.png) Repository](https://github.com/ajwheeler/Korg.jl)

[![book icon](assets/book.png) Documentation](https://ajwheeler.github.io/Korg.jl/stable/)

**Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE**

### ManuelBehrendt/Mera.jl

[![curly braces](assets/code.png) Repository](https://github.com/ManuelBehrendt/Mera.jl)

[![book icon](assets/book.png) Documentation](https://manuelbehrendt.github.io/Mera.jl/stable/)

**Working with large hydrodynamical simulation data**

- Loading, writing, analysing 3D AMR/uniform-grid and N-body data sets
- Memory lightweight data processing within a database framework
- Many predefined functions and examples

### JuliaSpace/SatelliteToolbox.jl

[![curly braces](assets/code.png) Repository](https://github.com/JuliaSpace/SatelliteToolbox.jl)

[![book icon](assets/book.png) Documentation](https://juliaspace.github.io/SatelliteToolbox.jl/stable/)

**Perform analysis and build simulations related to satellites**

- Atmospheric, gravitational, and geomagnetic field models
- Orbit propagators

See also:
- [ReferenceFrameRotations.jl](https://github.com/JuliaSpace/ReferenceFrameRotations.jl)
