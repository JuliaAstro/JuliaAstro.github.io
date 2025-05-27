# [Ecosystem](@id eco)

The joy of our community is the many astronomy and astrophysics packages available for wide use. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development.

---

## Domain

### EphemerisSources.jl

[💻 Repository](https://github.com/JuliaAstro/EphemerisSources.jl) | [📘 Documentation](https://juliaastro.org/EphemerisSources.jl/docs)

**Meta package for accessing JPL HORIZONS and SPICE sources**

- Calculate positions and velocities of solar system bodies


### PerezHz/HORIZONS.jl

[💻 Repository](https://github.com/PerezHz/HORIZONS.jl) | [📘 Documentation](https://github.com/PerezHz/HORIZONS.jl?tab=readme-ov-file#horizonsjl)

**An interface to NASA-JPL HORIZONS system and other Solar System Dynamics APIs in Julia**

- Calculate positions and velocities of solar system bodies


### JuliaSpace/SatelliteToolbox.jl

[💻 Repository](https://github.com/JuliaSpace/SatelliteToolbox.jl) | [📘 Documentation](https://juliaspace.github.io/SatelliteToolbox.jl/stable/)

**Perform analysis and build simulations related to satellites**

- Atmospheric, gravitational, and geomagnetic field models
- Orbit propagators

See also:
- [ReferenceFrameRotations.jl](https://github.com/JuliaSpace/ReferenceFrameRotations.jl)


### SPICE.jl

[💻 Repository](https://github.com/JuliaAstro/SPICE.jl) | [📘 Documentation](https://juliaastro.org/SPICE/stable/)

**SPICE data retrieval and usage**

- Wrapper for [CSPICE](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/index.html)
- Read SPICE data files and compute derived observation geometry such as altitude, latitude/longitude and lighting angles


---

### JuliaHCI/ADI.jl

[💻 Repository](https://github.com/JuliaHCI/ADI.jl) | [📘 Documentation](http://JuliaHCI.github.io/ADI.jl/stable/)

**Angular Differential Imaging (ADI) routines in Julia**

- PCA, NMF, LLSG, LOCI, etc.
- Apply algorithms framewise or in spectral differential imaging (SDI) using Julia's multiple dispatch
- Provide an interface for using these algorithms in other tools
- Common HCI metrics including S/N maps, contrast curves, throughput curves (from PSF injection), STIM, etc.


### JuliaHCI/HCIToolbox.jl

[💻 Repository](https://github.com/JuliaHCI/HCIToolbox.jl) | [📘 Documentation](http://JuliaHCI.github.io/HCIToolbox.jl/stable/)

**Common utilities for high-contrast imaging (HCI) processing**

- Morphological operations (rotation, stacking, shifting)
- Masking routines (circles, annulus, series of annuli)
- Spectral scaling and descaling


### sefffal/PlanetOrbits.jl

[💻 Repository](https://github.com/sefffal/PlanetOrbits.jl) | [📘 Documentation](https://sefffal.github.io/PlanetOrbits.jl/dev/)

**Tools for displaying and solving Keplerian orbits in the context of direct imaging**



### Transits.jl

[💻 Repository](https://github.com/JuliaAstro/Transits.jl) | [📘 Documentation](https://juliaastro.org/Transits/stable/)

**Flexible photometric transit curves with limb darkening**

- Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
- Includes Keplerian orbits and generic orbits
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)


---

### Cosmology.jl

[💻 Repository](https://github.com/JuliaAstro/Cosmology.jl) | [📘 Documentation](https://juliaastro.org/Cosmology/stable/)

**Distances in the universe**

- ``\Lambda``-CDM and ``w_0``-``w_a`` cosmologies
- Open, closed, and flat variants
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)


### DustExtinction.jl

[💻 Repository](https://github.com/JuliaAstro/DustExtinction.jl) | [📘 Documentation](https://juliaastro.org/DustExtinction/stable/)

**Dust extinction laws and maps**

- Various empirical extinction models
- SFD (1998) galactic dust map
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)


### EHTJulia/ScatteringOptics.jl

[💻 Repository](https://github.com/EHTJulia/ScatteringOptics.jl) | [📘 Documentation](https://ehtjulia.github.io/ScatteringOptics.jl/stable/)

**A Julia package to simulate and model interstellar scattering in strong regime**

- Analyze interstellar scintillation observed at radio wavelengths
- Implements physical models for the anisotropic scattering of radio waves
- Modeling, analyze, and interpret the images of the Galactic Center's supermassive black hole, Sagittarius A*, especially with the Event Horizon Telescope


---

## Techniques

### CCDReduction.jl

[💻 Repository](https://github.com/JuliaAstro/CCDReduction.jl) | [📘 Documentation](https://juliaastro.org/CCDReduction/stable/)

**Common CCD image processing routines**

- Creation of calibration files
- Dark subtraction, flat normalization, bias subtraction, cropping
- Specialized iterator for processing directories of FITS files using a table built from the FITS headers.


### LACosmic.jl

[💻 Repository](https://github.com/JuliaAstro/LACosmic.jl) | [📘 Documentation](https://juliaastro.org/LACosmic/stable/)

**Cosmic-ray rejection by Laplacian edge detection**

- Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
- Returns bad pixel masks and cleaned data


### Photometry.jl

[💻 Repository](https://github.com/JuliaAstro/Photometry.jl) | [📘 Documentation](https://juliaastro.org/Photometry/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry


### PSFModels.jl

[💻 Repository](https://github.com/JuliaAstro/PSFModels.jl) | [📘 Documentation](https://juliaastro.org/PSFModels/stable/)

**Analytical, allocation-free point-spread-functions (PSF)**

- Lazy representation allows fast allocation-free calculations
- Gaussian (Normal), Moffat, and Airy disk.


### SAOImageDS9.jl

[💻 Repository](https://github.com/JuliaAstro/SAOImageDS9.jl) | [📘 Documentation](https://juliaastro.org/SAOImageDS9/stable/)

**Interface with the DS9 image viewer**

- Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
- Easily display images in DS9 and add features like circles and lines
- Low-level API accessible with `set` and `get`


---

### barrettp/Astrometry.jl

[💻 Repository](https://github.com/barrettp/Astrometry.jl) | [📘 Documentation](https://barrettp.github.io/Astrometry/dev)

**Set of IAU standard algorithms for calculating the time and position of celestial objects**

- More information can be found on the official website of the [Standards of Fundamental Astronomy](http://www.iausofa.org/).


### AstroTime.jl

[💻 Repository](https://github.com/JuliaAstro/AstroTime.jl) | [📘 Documentation](https://juliaastro.org/AstroTime/stable/)

**Astronomical time keeping**

- High-precision, time-scale aware, DateTime-like data type
- Support all commonly used astronomical time scales


### EarthOrientation.jl

[💻 Repository](https://github.com/JuliaAstro/EarthOrientation.jl) | [📘 Documentation](https://juliaastro.org/EarthOrientation/stable/)

**Earth orientation parameters**

- Calculate Earth orientation parameters from IERS tables


### ERFA.jl

[💻 Repository](https://github.com/JuliaAstro/ERFA.jl) | [📘 Documentation](https://juliaastro.github.io/ERFA.jl/stable)

**Time systems conversions**

- Low-level wrapper for [liberfa](https://github.com/liberfa/erfa)


### ziotom78/Healpix.jl

[💻 Repository](https://github.com/ziotom78/Healpix.jl) | [📘 Documentation](https://ziotom78.github.io/Healpix.jl/stable/)

**Implementation of Healpix spherical tesselation scheme in pure Julia**

- pixel functions, query functions, map functions
- power spectrum support
- plotting support


### Reproject.jl

[💻 Repository](https://github.com/JuliaAstro/Reproject.jl) | [📘 Documentation](https://juliaastro.org/Reproject.jl/dev/)

**Astronomical image reprojection**

- Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images


### SkyCoords.jl

[💻 Repository](https://github.com/JuliaAstro/SkyCoords.jl) | [📘 Documentation](https://juliaastro.org/SkyCoords/stable/)

**Astronomical coordinate systems**

- Supports ICRS, galactic, and FK5 coordinate systems
- Fast conversion of coordinates between different systems


### WCS.jl

[💻 Repository](https://github.com/JuliaAstro/WCS.jl) | [📘 Documentation](https://juliaastro.org/WCS/stable/)

**World Coordinate System transformations**

- Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)


---

### ajwheeler/Korg.jl

[💻 Repository](https://github.com/ajwheeler/Korg.jl) | [📘 Documentation](https://ajwheeler.github.io/Korg.jl/stable/)

**Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE**



### Spectra.jl

[💻 Repository](https://github.com/JuliaAstro/Spectra.jl) | [📘 Documentation](https://juliaastro.org/Spectra/stable)

**Utilities for interfacing with astronomical spectra and synthetic spectra libraries**

- Utilities for interfacing with astronomical spectra and synthetic spectra libraries


### fjebaker/SpectralFitting.jl

[💻 Repository](https://github.com/fjebaker/SpectralFitting.jl) | [📘 Documentation](https://fjebaker.github.io/SpectralFitting.jl/dev/)

**✨🛰 Fast and flexible spectral fitting in Julia**

- Spectral fitting routines and models with a focus on X-ray astronomy
- This project is an attempt to modernise the field with new advancements in computational methods and statistical methods
- SpectralFitting.jl aims to be extensible and reproducible, such that fits may be easily tailored to novel and specific problems, and easily verified by others


---

### JuliaDSP/DSP.jl

[💻 Repository](https://github.com/JuliaDSP/DSP.jl) | [📘 Documentation](https://docs.juliadsp.org/stable/)

**Filter design, periodograms, window functions, and other digital signal processing functionality**

- DSP.jl provides a number of common [digital signal processing](https://en.wikipedia.org/wiki/Digital_signal_processing) routines in Julia


### LombScargle.jl

[💻 Repository](https://github.com/JuliaAstro/LombScargle.jl) | [📘 Documentation](https://juliaastro.org/LombScargle/stable/)

**Compute Lomb-Scargle periodogram**

- Create periodograms from unevenly sampled periodic signals
- Supports multi-threading


### JuliaStats/TimeSeries.jl

[💻 Repository](https://github.com/JuliaStats/TimeSeries.jl) | [📘 Documentation](https://juliastats.github.io/TimeSeries.jl/stable)

**Time series toolkit for Julia**

- TimeSeries aims to provide a lightweight framework for working with time series data in Julia


---

### ptiede/Comrade.jl

[💻 Repository](https://github.com/ptiede/Comrade.jl) | [📘 Documentation](https://ptiede.github.io/Comrade.jl/stable/)

**Composable Modeling of Radio Emission**

- A Bayesian differentiable modular modeling package for very long baseline interferometry


### JuliaAPlavin/Difmap.jl

[💻 Repository](https://github.com/JuliaAPlavin/Difmap.jl) | [📘 Documentation](https://aplavin.github.io/Difmap.jl/test/examples.html)

**Wrapper for the Difmap program used in synthesis imaging**

- Execute [Difmap](http://www.ascl.net/1103.001) scripts, handle inputs/outputs and logs
- Display images and plots from Difmap in interactive Julia environments


### emmt/OIFITS.jl

[💻 Repository](https://github.com/emmt/OIFITS.jl) | [📘 Documentation](https://github.com/emmt/OIFITS.jl?tab=readme-ov-file#support-for-oi-fits-data-in-julia)

**Support for OI-FITS**

- Read and write OI-FITS optical interferometry data format


### fabienbaron/OITOOLS.jl

[💻 Repository](https://github.com/fabienbaron/OITOOLS.jl) | [📘 Documentation](https://fabienbaron.github.io/OITOOLS.jl/dev)

**A collection of tools to load, visualize, model-fit and image optical interferometry data coming from CHARA, NPOI and VLTI**

- OITOOLS is a Julia package to read, plot, model-fit and image optical interferometric data coming from astronomical arrays such as CHARA, VLTI, and NPOI
- Note that despite having the same name as [JMMC's oitools](https://github.com/JMMC-OpenDev/oitools), they are completely unrelated and were developed independently


### EHTJulia/PolarizedTypes.jl

[💻 Repository](https://github.com/EHTJulia/PolarizedTypes.jl) | [📘 Documentation](https://ehtjulia.github.io/PolarizedTypes.jl/stable/)

**Basic Polarized types for interferometry**

- This defines the basic for polarized types for use in VLBI, including
    - `StokesParams` for the stokes parameters
    - `CoherencyMatrix` for coherency matrices in arbitrary bases, including a mixed basis


### JuliaAPlavin/VLBIData.jl

[💻 Repository](https://github.com/JuliaAPlavin/VLBIData.jl) | [📘 Documentation](https://aplavin.github.io/VLBIData.jl/test/examples.html)

**Work with data formats common in very long baseline interferometry (VLBI)**

- Read interferometric visibilities (`uvfits`), images (`fits`), and source models
- Minimal writing support for source models


### EHTJulia/VLBISkyModels.jl

[💻 Repository](https://github.com/EHTJulia/VLBISkyModels.jl) | [📘 Documentation](https://ehtjulia.github.io/VLBISkyModels.jl/stable/)

**Just the Comrade Models**

- `VLBISkyModels` provides an interface and library for of models that can be used to describe the on-sky emission seen by VLBI interferometers


---

## Statistics

### JuliaPhysics/Measurements.jl

[💻 Repository](https://github.com/JuliaPhysics/Measurements.jl) | [📘 Documentation](https://juliaphysics.github.io/Measurements.jl/stable/)

**Error propagation calculator and library for physical measurements. It supports real and complex numbers with uncertainty, arbitrary precision calculations, operations with arrays, and numerical integration**

-  [Measurements.jl](https://github.com/JuliaPhysics/Measurements.jl) relieves you from the hassle of propagating uncertainties coming from physical measurements, when performing mathematical operations involving them
- The [linear error propagation theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty#Linear_combinations) is employed to propagate the errors


### MonteCarloMeasurements.jl

[💻 Repository](https://github.com/baggepinnen/MonteCarloMeasurements.jl) | [📘 Documentation](https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/)

**Propagation of distributions by Monte-Carlo sampling: Real number types with uncertainty represented by samples**

-  This package facilitates working with probability distributions by means of Monte-Carlo methods, in a way that allows for propagation of probability distributions through functions


### JuliaAPlavin/Uncertain.jl

[💻 Repository](https://github.com/JuliaAPlavin/Uncertain.jl) | [📘 Documentation](https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/)

**Handle uncertain values with ease and performance!**

-  The ultimate goal of Uncertain.jl is to support arbitrary uncertainty specifications – asymmetric errors, intervals, more complex distributions, and go beyond plain numbers. All within a single uniform interface


---

### BoxLeastSquares.jl

[💻 Repository](https://github.com/JuliaAstro/BoxLeastSquares.jl) | [📘 Documentation](https://juliaastro.org/BoxLeastSquares/stable/)

**Compute box-least-squares periodogram**

- Fit BLS periodograms to time-series data
- Extract best-fitting transit parameters from the BLS periodogram
- Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)


### jump-dev/JuMP.jl

[💻 Repository](https://github.com/jump-dev/JuMP.jl) | [📘 Documentation](http://jump.dev/JuMP.jl/)

**Modeling language for Mathematical Optimization (linear, mixed-integer, conic, semidefinite, nonlinear)**

- JuMP is a domain-specific modeling language for [mathematical optimization](https://en.wikipedia.org/wiki/Mathematical_optimization) embedded in [Julia](https://julialang.org/)


### SciML/NonlinearSolve.jl

[💻 Repository](https://github.com/SciML/NonlinearSolve.jl) | [📘 Documentation](https://docs.sciml.ai/NonlinearSolve/stable/)

**High-performance and differentiation-enabled nonlinear solvers (Newton methods), bracketed rootfinding (bisection, Falsi), with sparsity and Newton-Krylov support**

- Fast implementations of root finding algorithms in Julia that satisfy the SciML common interface


### SciML/Optimization.jl

[💻 Repository](https://github.com/SciML/Optimization.jl) | [📘 Documentation](https://docs.sciml.ai/Optimization/stable/)

**Mathematical Optimization in Julia. Local, global, gradient-based and derivative-free. Linear, Quadratic, Convex, Mixed-Integer, and Nonlinear Optimization in one simple, fast, and differentiable interface**

- Optimization.jl seeks to bring together all of the optimization packages it can find, local and global, into one unified Julia interface
- This means, you learn one package and you learn them all!


---

### AstroLib.jl

[💻 Repository](https://github.com/JuliaAstro/astrolib.jl) | [📘 Documentation](https://juliaastro.org/AstroLib/stable/)

**Collection of generic astronomical and astrophysical functions**

- Translation of many IDL AstroLib procedures


### mileslucas/BiweightStats.jl

[💻 Repository](https://github.com/mileslucas/BiweightStats.jl) | [📘 Documentation](http://mileslucas.com/BiweightStats.jl/stable/)

**Robust statistics based on the biweight transform**

- Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics


### JuliaStats

[💻 Repository](https://github.com/JuliaStats) | [📘 Documentation](https://juliastats.org/)

**Statistics and Machine Learning made easy in Julia**

- Easy to use tools for statistics and machine learning


### JuliaStats/Distributions.jl

[💻 Repository](https://github.com/JuliaStats/Distributions.jl) | [📘 Documentation](https://juliastats.github.io/Distributions.jl/stable/)

**A Julia package for probability distributions and associated functions**

- A Julia package for probability distributions and associated functions


### EHTJulia/FastHartleyTransform.jl

[💻 Repository](https://github.com/EHTJulia/FastHartleyTransform.jl) | [📘 Documentation](https://ehtjulia.github.io/FastHartleyTransform.jl/stable/)

**A Julia implementation of the Fast Hartley Transform (FHT)**

- This package provides a Julia implementation of the Fast Hartley Transform (FHT)
- It supports both CPUs and NVIDIA CUDA GPUs


---

## Utilities

### eschnett/ASDF2.jl

[💻 Repository](https://github.com/eschnett/ASDF2.jl) | [📘 Documentation](https://eschnett.github.io/ASDF2.jl/dev/)

**ASDF, the Advanced Scientific Data Format**

- A new [Advanced Scientific Data Format (ASDF)](https://asdf-standard.readthedocs.io/en/latest/index.html) package, written in Julia


### AstroImages.jl

[💻 Repository](https://github.com/JuliaAstro/AstroImages.jl) | [📘 Documentation](https://juliaastro.org/AstroImages/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface


### CFITSIO.jl

[💻 Repository](https://github.com/JuliaAstro/CFITSIO.jl) | [📘 Documentation](https://juliaastro.org/CFITSIO/stable/)

**Reading and writing FITS files**

- Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
- The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)


### emmt/EasyFITS.jl

[💻 Repository](https://github.com/emmt/EasyFITS.jl) | [📘 Documentation](https://emmt.github.io/EasyFITS.jl/dev)

**Using FITS files made easier for Julia**

- EasyFITS is a [Julia](https://julialang.org/) package designed to make it easier to read and write data in [FITS](https://fits.gsfc.nasa.gov/fits_standard.html) format without sacrificing performances, flexibility, or readability.


### barrettp/FITS.jl

[💻 Repository](https://github.com/barrettp/FITS.jl) | [📘 Documentation](https://barrettp.github.io/FITS.jl/)

**A Julia Flexible Image Transport System (FITS) file IO package**

- A Julia Flexible Image Transport System (FITS) file IO package


### FITSIO.jl

[💻 Repository](https://github.com/JuliaAstro/FITSIO.jl) | [📘 Documentation](https://juliaastro.org/FITSIO/stable/)

**Reading and writing FITS files**

- Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
- FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.


### FixedWidthTables.jl

[💻 Repository](https://github.com/JuliaAPlavin/FixedWidthTables.jl) | [📘 Documentation](https://github.com/JuliaAPlavin/FixedWidthTables.jl?tab=readme-ov-file#fixedwidthtablesjl)

**Read fixed width (so-called ASCII) tables**

- Read fixed width (so-called ASCII) tables. A wide range of format specification options, including autodetection


### JuliaAPlavin/SkyImages.jl

[💻 Repository](https://github.com/JuliaAPlavin/SkyImages.jl) | [📘 Documentation](https://aplavin.github.io/SkyImages.jl/test/notebook.html)

**Load astronomical images of the sky and process them with convenient, general, and composable functions.**

- FITS WCS and Healpix images
- Uniform interface and Makie plotting
- Use original data as-is or project onto a rectangular grid


### JuliaAPlavin/VirtualObservatory.jl

[💻 Repository](https://github.com/JuliaAPlavin/VirtualObservatory.jl) | [📘 Documentation](https://github.com/JuliaAPlavin/VirtualObservatory.jl?tab=readme-ov-file#virtualobservatoryjl)

**Access remote data and services that follow VO protocols**

- Access remote data and services that follow Virtual Observatory (VO, <https://www.ivoa.net/>) protocols
- Currently supports the Table Access Protocol (TAP), and a few key features specific to the VizieR database


### JuliaAPlavin/VOTables.jl

[💻 Repository](https://github.com/JuliaAPlavin/VOTables.jl) | [📘 Documentation](https://github.com/JuliaAPlavin/VOTables.jl)

**Read and write VOTable files**

- Text and binary VOTables support
- Read Unitful numbers and column metadata


---

### torrance/Casacore.jl

[💻 Repository](https://github.com/torrance/Casacore.jl) | [📘 Documentation](https://github.com/torrance/Casacore.jl?tab=readme-ov-file#casacorejl)

**A high level Julia interface to Casacore**

- Wrapper for [CasaCore](http://casacore.github.io/casacore/)
- Uses [casacorecxx](https://github.com/torrance/casacorecxx) which uses [CxxWrap](https://github.com/JuliaInterop/CxxWrap.jl) to wrap the C++ Casacore codebase. These raw objects and methods are available in `Casacore.LibCasacore`


### JuliaData/DataFrames.jl

[💻 Repository](https://github.com/JuliaData/DataFrames.jl) | [📘 Documentation](https://dataframes.juliadata.org/stable/)

**In-memory tabular data in Julia**

- Tools for working with tabular data in Julia


### rafaqz/DimensionalData.jl

[💻 Repository](https://github.com/rafaqz/DimensionalData.jl) | [📘 Documentation](https://rafaqz.github.io/DimensionalData.jl/stable/)

**Named dimensions and indexing for julia arrays and other data**

- DimensionalData.jl provides tools and abstractions for working with datasets that have named dimensions, and optionally a lookup index
- It provides no-cost abstractions for named indexing, and fast index lookups


### JuliaAPlavin/FlexiJoins.jl

[💻 Repository](https://github.com/JuliaAPlavin/FlexiJoins.jl) | [📘 Documentation](https://aplavin.github.io/FlexiJoins.jl/test/examples.html)

**`FlexiJoins.jl` is a fresh take on joining tabular or non-tabular datasets in Julia.**

- From simple joins by key, to asof joins, to merging catalogs of terrestrial or celestial coordinates – `FlexiJoins` supports any usecase


### gcalderone/SortMerge.jl

[💻 Repository](https://github.com/gcalderone/SortMerge.jl) | [📘 Documentation](https://github.com/gcalderone/SortMerge.jl?tab=readme-ov-file#sortmerge)

**A Julia implementation of the Sort-merge join algorithm**

- The [Sort-merge join ](https://en.wikipedia.org/wiki/Sort-merge_join) algorithm allows to **quickly** find the matching pairs in two separate arrays or collections
- The best performances are obtained when the input data are already sorted, but the package is able to sort the data if they are not


---

### AstroImages.jl

[💻 Repository](https://github.com/JuliaAstro/AstroImages.jl) | [📘 Documentation](https://juliaastro.org/AstroImages/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface


### JuliaImages/ImageFiltering.jl

[💻 Repository](https://github.com/JuliaImages/ImageFiltering.jl) | [📘 Documentation](https://juliaimages.github.io/ImageFiltering.jl/stable)

**ulia implementations of multidimensional array convolution and nonlinear stencil operations**

- ImageFiltering implements blurring, sharpening, gradient computation, and other linear filtering operations, as well nonlinear filters like min/max


### ManuelBehrendt/Mera.jl

[💻 Repository](https://github.com/ManuelBehrendt/Mera.jl) | [📘 Documentation](https://manuelbehrendt.github.io/Mera.jl/stable/)

**Working with large hydrodynamical simulation data**

- Loading, writing, analysing 3D AMR/uniform-grid and N-body data sets
- Memory lightweight data processing within a database framework
- Many predefined functions and examples


### sefffal/PairPlots.jl

[💻 Repository](https://github.com/sefffal/PairPlots.jl) | [📘 Documentation](https://sefffal.github.io/PairPlots.jl/dev/)

**Beautiful and flexible visualizations of high dimensional data**

- Corner plots or scatter plot matrices. Both Julia and Python are supported (PairPlots.jl and [pairplots.py](https://pypi.org/project/pairplots/))
- Inspired by [corner.py](https://corner.readthedocs.io/en/latest/index.html) and [chainconsumer.py](https://samreay.github.io/ChainConsumer/usage.html)

See also:
- [ReferenceFrameRotations.jl](https://github.com/JuliaSpace/ReferenceFrameRotations.jl)


### JuliaAPlavin/SkyImages.jl

[💻 Repository](https://github.com/JuliaAPlavin/SkyImages.jl) | [📘 Documentation](https://aplavin.github.io/SkyImages.jl/test/notebook.html)

**Load astronomical images of the sky and process them with convenient, general, and composable functions.**

- FITS WCS and Healpix images
- Uniform interface and Makie plotting
- Use original data as-is or project onto a rectangular grid


---

### AstroAngles.jl

[💻 Repository](https://github.com/JuliaAstro/AstroAngles.jl) | [📘 Documentation](https://juliaastro.org/AstroAngles/stable/)

**String parsing and representation of angles**

- Parse and represent sexagesimal angles with a variety of delimiters
- Methods for converting to hour-minute-second angles from degrees and radians, and vice-versa


### SymbolicML/DynamicQuantities.jl

[💻 Repository](https://github.com/SymbolicML/DynamicQuantities.jl) | [📘 Documentation](https://symbolicml.org/DynamicQuantities.jl/stable/)

**Efficient and type-stable physical quantities in Julia**

- Defines a simple statically-typed `Quantity` type for Julia
- Physical dimensions are stored as a value, as opposed to a parametric type, as in [Unitful.jl](https://github.com/PainterQubits/Unitful.jl)


### JuliaPhysics/PhysicalConstants.jl

[💻 Repository](https://github.com/JuliaPhysics/PhysicalConstants.jl) | [📘 Documentation](https://juliaphysics.github.io/PhysicalConstants.jl/stable/)

**Collection of fundamental physical constants with uncertainties**

- `PhysicalConstants.jl` provides common physical constants
- They are defined as instances of the new `Constant` type, which is subtype of `AbstractQuantity` (from [`Unitful.jl`](https://github.com/PainterQubits/Unitful.jl) package) and can also be turned into `Measurement` objects (from [`Measurements.jl`](https://github.com/JuliaPhysics/Measurements.jl) package) at request


### PainterQubits/Unitful.jl

[💻 Repository](https://github.com/PainterQubits/Unitful.jl) | [📘 Documentation](https://painterqubits.github.io/Unitful.jl/stable)

**Physical quantities with arbitrary units**

- Unitful is a Julia package for physical units
- We want to support not only SI units but also any other unit system


### UnitfulAstro.jl

[💻 Repository](https://github.com/JuliaAstro/UnitfulAstro.jl) | [📘 Documentation](https://juliaastro.org/UnitfulAstro/stable/)

**Astronomical units and things**

- Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)


---

