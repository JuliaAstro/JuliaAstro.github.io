module JuliaAstroDocs

using TypedTables

stake! = String ∘ take!

ecosystem() = (
    "Domain" => (
        "Solar System" => (
            (
                name = "CALCEPH.jl",
                repo = "https://github.com/JuliaAstro/CALCEPH.jl",
                doc = "https://juliaastro.org/CALCEPH/stable/",
                tagline = "A wrapper to CALCEPH: IMCCE planetary ephemeris access library",
                descr = """
                - This is a julia wrapper for [CALCEPH](https://www.imcce.fr/inpop/calceph/) a C library for reading planetary ephemeris files, such as [INPOPxx](https://www.imcce.fr/inpop), JPL DExxx and SPICE ephemeris files
                - [CALCEPH](https://www.imcce.fr/inpop/calceph/) C library is developped by [IMCCE](https://www.imcce.fr/)
                """,
                astropy = ["astropy.coordinates"],
            ),
            (
                name = "EphemerisSources.jl",
                repo = "https://github.com/JuliaAstro/EphemerisSources.jl",
                doc = "https://juliaastro.org/EphemerisSources.jl",
                tagline = "Meta package for accessing JPL HORIZONS and SPICE sources",
                descr = """
                - Calculate positions and velocities of solar system bodies
                """,
                astropy = ["astropy.coordinates"],
            ),
            (
                name = "GeneralAstrodynamics.jl",
                repo = "https://github.com/JuliaAstro/GeneralAstrodynamics.jl",
                doc = "https://juliaastro.org/GeneralAstrodynamics.jl",
                tagline = "Astrodynamics with units! Provides common astrodynamics calculations, plotting, and iterative Halo, Kepler, and Lambert solvers.",
                descr = """
                - Common astrodynamics calculations, with hooks into the SciML ecosystem.
                """,
                astropy = [],
            ),
            (
                name = "HORIZONS.jl",
                repo = "https://github.com/PerezHz/HORIZONS.jl",
                doc = "https://github.com/PerezHz/HORIZONS.jl?tab=readme-ov-file#horizonsjl",
                tagline = "An interface to NASA-JPL HORIZONS system and other Solar System Dynamics APIs in Julia",
                descr = """
                - Calculate positions and velocities of solar system bodies
                """,
                astropy = ["astropy.coordinates"],
            ),
            (
                name = "SatelliteToolbox.jl",
                repo = "https://github.com/JuliaSpace/SatelliteToolbox.jl",
                doc = "https://juliaspace.github.io/SatelliteToolbox.jl/stable/",
                tagline = "Perform analysis and build simulations related to satellites",
                descr = """
                - Atmospheric, gravitational, and geomagnetic field models
                - Orbit propagators

                See also:
                - [ReferenceFrameRotations.jl](https://github.com/JuliaSpace/ReferenceFrameRotations.jl)
                """,
                astropy = [],
            ),
            (
                name = "SPICE.jl",
                repo = "https://github.com/JuliaAstro/SPICE.jl",
                doc = "https://juliaastro.org/SPICE/stable/",
                tagline = "SPICE data retrieval and usage",
                descr = """
                - Wrapper for [CSPICE](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/index.html)
                - Read SPICE data files and compute derived observation geometry such as altitude, latitude/longitude and lighting angles
                """,
                astropy = ["astropy.coordinates"],
            ),
        ),
        "Exoplanets" => (
            (
                name = "ADI.jl",
                repo = "https://github.com/JuliaHCI/ADI.jl",
                doc = "http://JuliaHCI.github.io/ADI.jl/stable/",
                tagline = "Angular Differential Imaging (ADI) routines in Julia",
                descr = """
                - PCA, NMF, LLSG, LOCI, etc.
                - Apply algorithms framewise or in spectral differential imaging (SDI) using Julia's multiple dispatch
                - Provide an interface for using these algorithms in other tools
                - Common HCI metrics including S/N maps, contrast curves, throughput curves (from PSF injection), STIM, etc.
                """,
                astropy = [],
            ),
            (
                name = "HCIToolbox.jl",
                repo = "https://github.com/JuliaHCI/HCIToolbox.jl",
                doc = "http://JuliaHCI.github.io/HCIToolbox.jl/stable/",
                tagline = "Common utilities for high-contrast imaging (HCI) processing",
                descr = """
                - Morphological operations (rotation, stacking, shifting)
                - Masking routines (circles, annulus, series of annuli)
                - Spectral scaling and descaling
                """,
                astropy = [],
            ),
            (
                name = "Orbits.jl",
                repo = "https://github.com/JuliaAstro/Orbits.jl",
                doc = "https://juliaastro.org/Orbits/stable/",
                tagline = "Flexible and fast astronomical orbits",
                descr = """
                The goals of this package are, in this order:
                
                * have a simple interface with high composability
                * be flexible with respect to numeric types and application
                * be fully compatible with [ChainRules.jl](https://github.com/juliadiff/ChainRules.jl) automatic differentiation (AD) system to leverage the derived analytical gradients
                * provide a codebase that is well-organized, instructive, and easy to extend
                * maintain high performance: at least as fast as similar tools
                """,
                astropy = [],
            ),
            (
                name = "PlanetOrbits.jl",
                repo = "https://github.com/sefffal/PlanetOrbits.jl",
                doc = "https://sefffal.github.io/PlanetOrbits.jl/dev/",
                tagline = "Tools for displaying and solving Keplerian orbits in the context of direct imaging",
                descr = """
                """,
                astropy = [],
            ),
            (
                name = "Transits.jl",
                repo = "https://github.com/JuliaAstro/Transits.jl",
                doc = "https://juliaastro.org/Transits/stable/",
                tagline = "Flexible photometric transit curves with limb darkening",
                descr = """
                - Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
                - Includes Keplerian orbits and generic orbits
                - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
                """,
                astropy = [],
            ),
        ),
        "Stars" => (
            (
                name = "BolometricCorrections.jl",
                repo = "https://github.com/cgarling/BolometricCorrections.jl",
                doc = "https://cgarling.github.io/BolometricCorrections.jl/stable/",
                tagline = "Interfaces to libraries of astrophysical bolometric correction",
                descr = """
                - Access to and interpolation of pre-computed grids of bolometric corrections
                """,
                astropy = [],
            ),
            (
                name = "InitialMassFunctions.jl",
                repo = "https://github.com/cgarling/InitialMassFunctions.jl",
                doc = "https://cgarling.github.io/InitialMassFunctions.jl/stable/",
                tagline = "Evaluation of and sampling from stellar initial mass functions",
                descr = """
                - Provides a framework to evaluate and sample from stellar initial mass functions, including common literature models
                """,
                astropy = [],
            ),
            (
                name = "StarFormationHistories.jl",
                repo = "https://github.com/cgarling/StarFormationHistories.jl",
                doc = "https://cgarling.github.io/StarFormationHistories.jl/stable/",
                tagline = "Fitting astrophysical star formation histories via CMD modeling",
                descr = """
                - Implements methods for modeling observed Hess diagrams (i.e., binned color-magnitude diagrams) and using them to fit astrophysical star formation histories (SFHs)
                - Provides utilities for simulating CMDs given input SFHs and photometric error and completeness functions, which can be useful for planning observations and writing proposals
                """,
                astropy = [],
            ),
        ),
        "Galaxies and Cosmology" => (
            (
                name = "Cosmology.jl",
                repo = "https://github.com/JuliaAstro/Cosmology.jl",
                doc = "https://juliaastro.org/Cosmology/stable/",
                tagline = "Distances in the universe",
                descr = """
                - ``\\Lambda``-CDM and ``w_0``-``w_a`` cosmologies
                - Open, closed, and flat variants
                - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
                """,
                astropy = ["astropy.cosmology"],
            ),
            (
                name = "DustExtinction.jl",
                repo = "https://github.com/JuliaAstro/DustExtinction.jl",
                doc = "https://juliaastro.org/DustExtinction/stable/",
                tagline = "Dust extinction laws and maps",
                descr = """
                - Various empirical extinction models
                - SFD (1998) galactic dust map
                - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
                """,
                astropy = [],
            ),
            (
                name = "ScatteringOptics.jl",
                repo = "https://github.com/EHTJulia/ScatteringOptics.jl",
                doc = "https://ehtjulia.github.io/ScatteringOptics.jl/stable/",
                tagline = "A Julia package to simulate and model interstellar scattering in strong regime",
                descr = """
                - Analyze interstellar scintillation observed at radio wavelengths
                - Implements physical models for the anisotropic scattering of radio waves
                - Modeling, analyze, and interpret the images of the Galactic Center's supermassive black hole, Sagittarius A*, especially with the Event Horizon Telescope
                """,
                astropy = [],
            ),
        ),
    ),
    "Techniques" => (
        "Photometry" => (
            (
                name = "CCDReduction.jl",
                repo = "https://github.com/JuliaAstro/CCDReduction.jl",
                doc = "https://juliaastro.org/CCDReduction/stable/",
                tagline = "Common CCD image processing routines",
                descr = """
                - Creation of calibration files
                - Dark subtraction, flat normalization, bias subtraction, cropping
                - Specialized iterator for processing directories of FITS files using a table built from the FITS headers.
                """,
                astropy = ["ccdproc"],
            ),
            (
                name = "LACosmic.jl",
                repo = "https://github.com/JuliaAstro/LACosmic.jl",
                doc = "https://juliaastro.org/LACosmic/stable/",
                tagline = "Cosmic-ray rejection by Laplacian edge detection",
                descr = """
                - Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
                - Returns bad pixel masks and cleaned data
                """,
                astropy = [],
            ),
            (
                name = "Photometry.jl",
                repo = "https://github.com/JuliaAstro/Photometry.jl",
                doc = "https://juliaastro.org/Photometry/stable/",
                tagline = "Aperture photometry",
                descr = """
                - Background estimation and source extraction
                - Fast and precise aperture photometry
                """,
                astropy = ["photutils", "regions"],
            ),
            (
                name = "PSFModels.jl",
                repo = "https://github.com/JuliaAstro/PSFModels.jl",
                doc = "https://juliaastro.org/PSFModels/stable/",
                tagline = "Analytical, allocation-free point-spread-functions (PSF)",
                descr = """
                - Lazy representation allows fast allocation-free calculations
                - Gaussian (Normal), Moffat, and Airy disk.
                """,
                astropy = [],
            ),
            (
                name = "SAOImageDS9.jl",
                repo = "https://github.com/JuliaAstro/SAOImageDS9.jl",
                doc = "https://juliaastro.org/SAOImageDS9/stable/",
                tagline = "Interface with the DS9 image viewer",
                descr = """
                - Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
                - Easily display images in DS9 and add features like circles and lines
                - Low-level API accessible with `set` and `get`
                """,
                astropy = [],
            ),
        ),
        "Astrometry" => (
            (
                name = "Astrometry.jl",
                repo = "https://github.com/barrettp/Astrometry.jl",
                doc = "https://barrettp.github.io/Astrometry/dev",
                tagline = "Set of IAU standard algorithms for calculating the time and position of celestial objects",
                descr = """
                - More information can be found on the official website of the [Standards of Fundamental Astronomy](http://www.iausofa.org/).
                """,
                astropy = [],
            ),
            (
                name = "AstroTime.jl",
                repo = "https://github.com/JuliaAstro/AstroTime.jl",
                doc = "https://juliaastro.org/AstroTime/stable/",
                tagline = "Astronomical time keeping",
                descr = """
                - High-precision, time-scale aware, DateTime-like data type
                - Support all commonly used astronomical time scales
                """,
                astropy = ["astropy.time"],
            ),
            (
                name = "EarthOrientation.jl",
                repo = "https://github.com/JuliaAstro/EarthOrientation.jl",
                doc = "https://juliaastro.org/EarthOrientation/stable/",
                tagline = "Earth orientation parameters",
                descr = """
                - Calculate Earth orientation parameters from IERS tables
                """,
                astropy = ["astropy.utils.iers"],
            ),
            (
                name = "ERFA.jl",
                repo = "https://github.com/JuliaAstro/ERFA.jl",
                doc = "https://juliaastro.github.io/ERFA.jl/stable",
                tagline = "Time systems conversions",
                descr = """
                - Low-level wrapper for [liberfa](https://github.com/liberfa/erfa)
                """,
                astropy = [],
            ),
            (
                name = "Healpix.jl",
                repo = "https://github.com/JuliaAstro/Healpix.jl",
                doc = "https://juliaastro.org/Healpix/stable/",
                tagline = "Implementation of Healpix spherical tesselation scheme in pure Julia",
                descr = """
                - pixel functions, query functions, map functions
                - power spectrum support
                - plotting support
                """,
                astropy = ["astropy-healpix"],
            ),
            (
                name = "Reproject.jl",
                repo = "https://github.com/JuliaAstro/Reproject.jl",
                doc = "https://juliaastro.org/Reproject/stable/",
                tagline = "Astronomical image reprojection",
                descr = """
                - Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images
                """,
                astropy = ["reproject"],
            ),
            (
                name = "SkyCoords.jl",
                repo = "https://github.com/JuliaAstro/SkyCoords.jl",
                doc = "https://juliaastro.org/SkyCoords/stable/",
                tagline = "Astronomical coordinate systems",
                descr = """
                - Supports ICRS, galactic, and FK5 coordinate systems
                - Fast conversion of coordinates between different systems
                """,
                astropy = ["astropy.coordinates"],
            ),
            (
                name = "WCS.jl",
                repo = "https://github.com/JuliaAstro/WCS.jl",
                doc = "https://juliaastro.org/WCS/stable/",
                tagline = "World Coordinate System transformations",
                descr = """
                - Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)
                """,
                astropy = ["astropy.wcs"],
            ),
        ),
        "Spectroscopy" => (
            (
                name = "Korg.jl",
                repo = "https://github.com/ajwheeler/Korg.jl",
                doc = "https://ajwheeler.github.io/Korg.jl/stable/",
                tagline = "Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE",
                descr = """
                """,
                astropy = ["specreduce", "specutils"],
            ),
            (
                name = "Spectra.jl",
                repo = "https://github.com/JuliaAstro/Spectra.jl",
                doc = "https://juliaastro.org/Spectra/stable",
                tagline = "Utilities for interfacing with astronomical spectra and synthetic spectra libraries",
                descr = """
                - Utilities for interfacing with astronomical spectra and synthetic spectra libraries
                """,
                astropy = ["specreduce", "specutils"],
            ),
            (
                name = "SpectralFitting.jl",
                repo = "https://github.com/fjebaker/SpectralFitting.jl",
                doc = "https://fjebaker.github.io/SpectralFitting.jl/dev/",
                tagline = "✨🛰 Fast and flexible spectral fitting in Julia",
                descr = """
                - Spectral fitting routines and models with a focus on X-ray astronomy
                - This project is an attempt to modernise the field with new advancements in computational methods and statistical methods
                - SpectralFitting.jl aims to be extensible and reproducible, such that fits may be easily tailored to novel and specific problems, and easily verified by others
                """,
                astropy = ["specreduce", "specutils"],
            ),
        ),
        "Time Series Analysis" => (
            (
                name = "DSP.jl",
                repo = "https://github.com/JuliaDSP/DSP.jl",
                doc = "https://docs.juliadsp.org/stable/",
                tagline = "Filter design, periodograms, window functions, and other digital signal processing functionality",
                descr = """
                - DSP.jl provides a number of common [digital signal processing](https://en.wikipedia.org/wiki/Digital_signal_processing) routines in Julia
                """,
                astropy = ["astropy.convolution", "astropy.timeseries"],
            ),
            (
                name = "LombScargle.jl",
                repo = "https://github.com/JuliaAstro/LombScargle.jl",
                doc = "https://juliaastro.org/LombScargle/stable/",
                tagline = "Compute Lomb-Scargle periodogram",
                descr = """
                - Create periodograms from unevenly sampled periodic signals
                - Supports multi-threading
                """,
                astropy = ["astropy.timeseries"],
            ),
            (
                name = "TimeSeries.jl",
                repo = "https://github.com/JuliaStats/TimeSeries.jl",
                doc = "https://juliastats.github.io/TimeSeries.jl/stable",
                tagline = "Time series toolkit for Julia",
                descr = """
                - TimeSeries aims to provide a lightweight framework for working with time series data in Julia
                """,
                astropy = ["astropy.timeseries"],
            ),
        ),
        "Interferometry" => (
            (
                name = "Comrade.jl",
                repo = "https://github.com/ptiede/Comrade.jl",
                doc = "https://ptiede.github.io/Comrade.jl/stable/",
                tagline = "Composable Modeling of Radio Emission",
                descr = """
                - A Bayesian differentiable modular modeling package for very long baseline interferometry
                """,
                astropy = [],
            ),
            (
                name = "Difmap.jl",
                repo = "https://github.com/JuliaAPlavin/Difmap.jl",
                doc = "https://aplavin.github.io/Difmap.jl/test/examples.html",
                tagline = "Wrapper for the Difmap program used in synthesis imaging",
                descr = """
                - Execute [Difmap](http://www.ascl.net/1103.001) scripts, handle inputs/outputs and logs
                - Display images and plots from Difmap in interactive Julia environments
                """,
                astropy = [],
            ),
            (
                name = "OIFITS.jl",
                repo = "https://github.com/emmt/OIFITS.jl",
                doc = "https://github.com/emmt/OIFITS.jl?tab=readme-ov-file#support-for-oi-fits-data-in-julia",
                tagline = "Support for OI-FITS",
                descr = """
                - Read and write OI-FITS optical interferometry data format
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "OITOOLS.jl",
                repo = "https://github.com/fabienbaron/OITOOLS.jl",
                doc = "https://fabienbaron.github.io/OITOOLS.jl/dev",
                tagline = "A collection of tools to load, visualize, model-fit and image optical interferometry data coming from CHARA, NPOI and VLTI",
                descr = """
                - OITOOLS is a Julia package to read, plot, model-fit and image optical interferometric data coming from astronomical arrays such as CHARA, VLTI, and NPOI
                - Note that despite having the same name as [JMMC's oitools](https://github.com/JMMC-OpenDev/oitools), they are completely unrelated and were developed independently
                """,
                astropy = [],
            ),
            (
                name = "PolarizedTypes.jl",
                repo = "https://github.com/EHTJulia/PolarizedTypes.jl",
                doc = "https://ehtjulia.github.io/PolarizedTypes.jl/stable/",
                tagline = "Basic Polarized types for interferometry",
                descr = """
                - This defines the basic for polarized types for use in VLBI, including
                    - `StokesParams` for the stokes parameters
                    - `CoherencyMatrix` for coherency matrices in arbitrary bases, including a mixed basis
                """,
                astropy = [],
            ),
            (
                name = "VLBIData.jl",
                repo = "https://github.com/JuliaAPlavin/VLBIData.jl",
                doc = "https://aplavin.github.io/VLBIData.jl/test/examples.html",
                tagline = "Work with data formats common in very long baseline interferometry (VLBI)",
                descr = """
                - Read interferometric visibilities (`uvfits`), images (`fits`), and source models
                - Minimal writing support for source models
                """,
                astropy = ["astropy.io.votable"],
            ),
            (
                name = "VLBISkyModels.jl",
                repo = "https://github.com/EHTJulia/VLBISkyModels.jl",
                doc = "https://ehtjulia.github.io/VLBISkyModels.jl/stable/",
                tagline = "Just the Comrade Models",
                descr = """
                - `VLBISkyModels` provides an interface and library for of models that can be used to describe the on-sky emission seen by VLBI interferometers
                """,
                astropy = [],
            ),
        ),
    ),
    "Statistics" => (
        "Uncertainty" => (
            (
                name = "Measurements.jl",
                repo = "https://github.com/JuliaPhysics/Measurements.jl",
                doc = "https://juliaphysics.github.io/Measurements.jl/stable/",
                tagline = "Error propagation calculator and library for physical measurements. It supports real and complex numbers with uncertainty, arbitrary precision calculations, operations with arrays, and numerical integration",
                descr = """
                -  [Measurements.jl](https://github.com/JuliaPhysics/Measurements.jl) relieves you from the hassle of propagating uncertainties coming from physical measurements, when performing mathematical operations involving them
                - The [linear error propagation theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty#Linear_combinations) is employed to propagate the errors
                """,
                astropy = ["astropy.uncertainty"],
            ),
            (
                name = "MonteCarloMeasurements.jl",
                repo = "https://github.com/baggepinnen/MonteCarloMeasurements.jl",
                doc = "https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/",
                tagline = "Propagation of distributions by Monte-Carlo sampling: Real number types with uncertainty represented by samples",
                descr = """
                -  This package facilitates working with probability distributions by means of Monte-Carlo methods, in a way that allows for propagation of probability distributions through functions
                """,
                astropy = ["astropy.uncertainty"],
            ),
            (
                name = "Uncertain.jl",
                repo = "https://github.com/JuliaAPlavin/Uncertain.jl",
                doc = "https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/",
                tagline = "Handle uncertain values with ease and performance!",
                descr = """
                -  The ultimate goal of Uncertain.jl is to support arbitrary uncertainty specifications – asymmetric errors, intervals, more complex distributions, and go beyond plain numbers. All within a single uniform interface
                """,
                astropy = ["astropy.uncertainty"],
            ),
        ),
        "Optimization" => (
            (
                name = "BoxLeastSquares.jl",
                repo = "https://github.com/JuliaAstro/BoxLeastSquares.jl",
                doc = "https://juliaastro.org/BoxLeastSquares/stable/",
                tagline = "Compute box-least-squares periodogram",
                descr = """
                - Fit BLS periodograms to time-series data
                - Extract best-fitting transit parameters from the BLS periodogram
                - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
                """,
                astropy = ["astropy.timeseries"],
            ),
            (
                name = "JuMP.jl",
                repo = "https://github.com/jump-dev/JuMP.jl",
                doc = "http://jump.dev/JuMP.jl/",
                tagline = "Modeling language for Mathematical Optimization (linear, mixed-integer, conic, semidefinite, nonlinear)",
                descr = """
                - JuMP is a domain-specific modeling language for [mathematical optimization](https://en.wikipedia.org/wiki/Mathematical_optimization) embedded in [Julia](https://julialang.org/)
                """,
                astropy = ["astropy.modeling"],
            ),
            (
                name = "NonlinearSolve.jl",
                repo = "https://github.com/SciML/NonlinearSolve.jl",
                doc = "https://docs.sciml.ai/NonlinearSolve/stable/",
                tagline = "High-performance and differentiation-enabled nonlinear solvers (Newton methods), bracketed rootfinding (bisection, Falsi), with sparsity and Newton-Krylov support",
                descr = """
                - Fast implementations of root finding algorithms in Julia that satisfy the SciML common interface
                """,
                astropy = ["astropy.modeling"],
            ),
            (
                name = "Optimization.jl",
                repo = "https://github.com/SciML/Optimization.jl",
                doc = "https://docs.sciml.ai/Optimization/stable/",
                tagline = "Mathematical Optimization in Julia. Local, global, gradient-based and derivative-free. Linear, Quadratic, Convex, Mixed-Integer, and Nonlinear Optimization in one simple, fast, and differentiable interface",
                descr = """
                - Optimization.jl seeks to bring together all of the optimization packages it can find, local and global, into one unified Julia interface
                - This means, you learn one package and you learn them all!
                """,
                astropy = ["astropy.modeling"],
            ),
        ),
        "General" => (
            (
                name = "AstroLib.jl",
                repo = "https://github.com/JuliaAstro/astrolib.jl",
                doc = "https://juliaastro.org/AstroLib/stable/",
                tagline = "Collection of generic astronomical and astrophysical functions",
                descr = """
                - Translation of many IDL AstroLib procedures
                """,
                astropy = [],
            ),
            (
                name = "BiweightStats.jl",
                repo = "https://github.com/mileslucas/BiweightStats.jl",
                doc = "http://mileslucas.com/BiweightStats.jl/stable/",
                tagline = "Robust statistics based on the biweight transform",
                descr = """
                - Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics
                """,
                astropy = ["astropy.stats"],
            ),
            (
                name = "Celeste.jl",
                repo = "https://github.com/jeff-regier/Celeste.jl",
                doc = "https://github.com/jeff-regier/Celeste.jl/wiki/",
                tagline = "Scalable inference for a generative model of astronomical images",
                descr = """
                - Find and characterize stars and galaxies in astronomical images via approximate Bayesian inference
                """,
                astropy = [],
            ),
            (
                name = "JuliaStats",
                repo = "https://github.com/JuliaStats",
                doc = "https://juliastats.org/",
                tagline = "Statistics and Machine Learning made easy in Julia",
                descr = """
                - Easy to use tools for statistics and machine learning
                """,
                astropy = ["astropy.stats"],
            ),
            (
                name = "Distributions.jl",
                repo = "https://github.com/JuliaStats/Distributions.jl",
                doc = "https://juliastats.github.io/Distributions.jl/stable/",
                tagline = "A Julia package for probability distributions and associated functions",
                descr = """
                - A Julia package for probability distributions and associated functions
                """,
                astropy = ["astropy.uncertainty"],
            ),
            (
                name = "FastHartleyTransform.jl",
                repo = "https://github.com/EHTJulia/FastHartleyTransform.jl",
                doc = "https://ehtjulia.github.io/FastHartleyTransform.jl/stable/",
                tagline = "A Julia implementation of the Fast Hartley Transform (FHT)",
                descr = """
                - This package provides a Julia implementation of the Fast Hartley Transform (FHT)
                - It supports both CPUs and NVIDIA CUDA GPUs
                """,
                astropy = [],
            ),
            (
                name = "Octofitter.jl",
                repo = "https://github.com/sefffal/Octofitter.jl",
                doc = "https://sefffal.github.io/Octofitter.jl/dev",
                tagline = "Octofitter is a Julia package for performing Bayesian inference against a wide variety of exoplanet and binary star data",
                descr = """
                - You can also use Octofitter from Python using [octofitterpy](https://github.com/sefffal/octofitterpy)
                """,
                astropy = [],
            ),
        ),
    ),
    "Utilities" => (
        "Data I/O" => (
            (
                name = "ASDF2.jl",
                repo = "https://github.com/JuliaAstro/ASDF2.jl",
                doc = "https://juliaastro.org/ASDF2.jl/dev/",
                tagline = "ASDF, the Advanced Scientific Data Format",
                descr = """
                - A new [Advanced Scientific Data Format (ASDF)](https://asdf-standard.readthedocs.io/en/latest/index.html) package, written in Julia
                """,
                astropy = ["asdf-astropy"],
            ),
            (
                name = "AstroImages.jl",
                repo = "https://github.com/JuliaAstro/AstroImages.jl",
                doc = "https://juliaastro.org/AstroImages/stable/",
                tagline = "Load, manipulate, and visualize astronomical images",
                descr = """
                - Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "CFITSIO.jl",
                repo = "https://github.com/JuliaAstro/CFITSIO.jl",
                doc = "https://juliaastro.org/CFITSIO/stable/",
                tagline = "Reading and writing FITS files",
                descr = """
                - Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
                - The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "EasyFITS.jl",
                repo = "https://github.com/emmt/EasyFITS.jl",
                doc = "https://emmt.github.io/EasyFITS.jl/dev",
                tagline = "Using FITS files made easier for Julia",
                descr = """
                - EasyFITS is a [Julia](https://julialang.org/) package designed to make it easier to read and write data in [FITS](https://fits.gsfc.nasa.gov/fits_standard.html) format without sacrificing performances, flexibility, or readability.
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "FITSFiles.jl",
                repo = "https://github.com/barrettp/FITSFiles.jl",
                doc = "https://barrettp.github.io/FITSFiles.jl/",
                tagline = "A Julia Flexible Image Transport System (FITS) file IO package",
                descr = """
                - A Julia Flexible Image Transport System (FITS) file IO package
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "FITSIO.jl",
                repo = "https://github.com/JuliaAstro/FITSIO.jl",
                doc = "https://juliaastro.org/FITSIO/stable/",
                tagline = "Reading and writing FITS files",
                descr = """
                - Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
                - FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "FixedWidthTables.jl",
                repo = "https://github.com/JuliaAPlavin/FixedWidthTables.jl",
                doc = "https://github.com/JuliaAPlavin/FixedWidthTables.jl?tab=readme-ov-file#fixedwidthtablesjl",
                tagline = "Read fixed width (so-called ASCII) tables",
                descr = """
                - Read fixed width (so-called ASCII) tables. A wide range of format specification options, including autodetection
                """,
                astropy = ["astropy.io.ascii"],
            ),
            (
                name = "SkyImages.jl",
                repo = "https://github.com/JuliaAPlavin/SkyImages.jl",
                doc = "https://aplavin.github.io/SkyImages.jl/test/notebook.html",
                tagline = "Load astronomical images of the sky and process them with convenient, general, and composable functions.",
                descr = """
                - FITS WCS and Healpix images
                - Uniform interface and Makie plotting
                - Use original data as-is or project onto a rectangular grid
                """,
                astropy = ["astropy.io.fits"],
            ),
            (
                name = "VirtualObservatory.jl",
                repo = "https://github.com/JuliaAPlavin/VirtualObservatory.jl",
                doc = "https://github.com/JuliaAPlavin/VirtualObservatory.jl?tab=readme-ov-file#virtualobservatoryjl",
                tagline = "Access remote data and services that follow VO protocols",
                descr = """
                - Access remote data and services that follow Virtual Observatory (VO, <https://www.ivoa.net/>) protocols
                - Currently supports the Table Access Protocol (TAP), and a few key features specific to the VizieR database
                """,
                astropy = ["astropy.io.votable", "astroquery"],
            ),
            (
                name = "VOTables.jl",
                repo = "https://github.com/JuliaAPlavin/VOTables.jl",
                doc = "https://github.com/JuliaAPlavin/VOTables.jl",
                tagline = "Read and write VOTable files",
                descr = """
                - Text and binary VOTables support
                - Read Unitful numbers and column metadata
                """,
                astropy = ["astropy.io.votable"],
            ),
            (
                name = "XPA.jl",
                repo = "https://github.com/JuliaAstro/XPA.jl",
                doc = "https://juliaastro.org/XPA/stable/",
                tagline = "A Julia interface to the XPA Messaging System",
                descr = """
                - Seamless communication between many kinds of Unix/Windows programs, including X programs and Tcl/Tk programs
                - Used for some popular astronomical tools such as [SAOImage-DS9](http://ds9.si.edu/site/Home.html)
                """,
                astropy = [],
            ),
        ),
        "Data processing" => (
            (
                name = "Astroalign.jl",
                repo = "https://github.com/JuliaAstro/Astroalign.jl",
                doc = "https://juliaastro.org/Astroalign/stable/",
                tagline = "An experimental reimplementation of astroalign.py",
                descr = """
                - An experimental reimplementation of [astroalign](https://github.com/quatrope/astroalign) in Julia
                """,
                astropy = ["astroalign"],
            ),
            (
                name = "Casacore.jl",
                repo = "https://github.com/torrance/Casacore.jl",
                doc = "https://github.com/torrance/Casacore.jl?tab=readme-ov-file#casacorejl",
                tagline = "A high level Julia interface to Casacore",
                descr = """
                - Wrapper for [CasaCore](http://casacore.github.io/casacore/)
                - Uses [casacorecxx](https://github.com/torrance/casacorecxx) which uses [CxxWrap](https://github.com/JuliaInterop/CxxWrap.jl) to wrap the C++ Casacore codebase. These raw objects and methods are available in `Casacore.LibCasacore`
                """,
                astropy = [],
            ),
            (
                name = "DataFrames.jl",
                repo = "https://github.com/JuliaData/DataFrames.jl",
                doc = "https://dataframes.juliadata.org/stable/",
                tagline = "In-memory tabular data in Julia",
                descr = """
                - Tools for working with tabular data in Julia
                """,
                astropy = ["astropy.table"],
            ),
            (
                name = "DimensionalData.jl",
                repo = "https://github.com/rafaqz/DimensionalData.jl",
                doc = "https://rafaqz.github.io/DimensionalData.jl/stable/",
                tagline = "Named dimensions and indexing for julia arrays and other data",
                descr = """
                - DimensionalData.jl provides tools and abstractions for working with datasets that have named dimensions, and optionally a lookup index
                - It provides no-cost abstractions for named indexing, and fast index lookups
                """,
                astropy = ["astropy.nddata"],
            ),
            (
                name = "FlexiJoins.jl",
                repo = "https://github.com/JuliaAPlavin/FlexiJoins.jl",
                doc = "https://aplavin.github.io/FlexiJoins.jl/test/examples.html",
                tagline = "`FlexiJoins.jl` is a fresh take on joining tabular or non-tabular datasets in Julia.",
                descr = """
                - From simple joins by key, to asof joins, to merging catalogs of terrestrial or celestial coordinates – `FlexiJoins` supports any usecase
                """,
                astropy = ["astropy.table"],
            ),
            (
                name = "SortMerge.jl",
                repo = "https://github.com/gcalderone/SortMerge.jl",
                doc = "https://github.com/gcalderone/SortMerge.jl?tab=readme-ov-file#sortmerge",
                tagline = "A Julia implementation of the Sort-merge join algorithm",
                descr = """
                - The [Sort-merge join ](https://en.wikipedia.org/wiki/Sort-merge_join) algorithm allows to **quickly** find the matching pairs in two separate arrays or collections
                - The best performances are obtained when the input data are already sorted, but the package is able to sort the data if they are not
                """,
                astropy = ["astropy.table"],
            ),
        ),
        "Data Viz" => (
            (
                name = "AstroImages.jl",
                repo = "https://github.com/JuliaAstro/AstroImages.jl",
                doc = "https://juliaastro.org/AstroImages/stable/",
                tagline = "Load, manipulate, and visualize astronomical images",
                descr = """
                - Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
                """,
                astropy = ["astropy.visualization"],
            ),
            (
                name = "ImageFiltering.jl",
                repo = "https://github.com/JuliaImages/ImageFiltering.jl",
                doc = "https://juliaimages.github.io/ImageFiltering.jl/stable",
                tagline = "ulia implementations of multidimensional array convolution and nonlinear stencil operations",
                descr = """
                - ImageFiltering implements blurring, sharpening, gradient computation, and other linear filtering operations, as well nonlinear filters like min/max
                """,
                astropy = ["astropy.convolution"],
            ),
            (
                name = "Mera.jl",
                repo = "https://github.com/ManuelBehrendt/Mera.jl",
                doc = "https://manuelbehrendt.github.io/Mera.jl/stable/",
                tagline = "Working with large hydrodynamical simulation data",
                descr = """
                - Loading, writing, analysing 3D AMR/uniform-grid and N-body data sets
                - Memory lightweight data processing within a database framework
                - Many predefined functions and examples
                """,
                astropy = [],
            ),
            (
                name = "PairPlots.jl",
                repo = "https://github.com/sefffal/PairPlots.jl",
                doc = "https://sefffal.github.io/PairPlots.jl/dev/",
                tagline = "Beautiful and flexible visualizations of high dimensional data",
                descr = """
                - Corner plots or scatter plot matrices. Both Julia and Python are supported (PairPlots.jl and [pairplots.py](https://pypi.org/project/pairplots/))
                - Inspired by [corner.py](https://corner.readthedocs.io/en/latest/index.html) and [chainconsumer.py](https://samreay.github.io/ChainConsumer/usage.html)

                See also:
                - [ReferenceFrameRotations.jl](https://github.com/JuliaSpace/ReferenceFrameRotations.jl)
                """,
                astropy = ["astropy.visualization"],
            ),
            (
                name = "SkyImages.jl",
                repo = "https://github.com/JuliaAPlavin/SkyImages.jl",
                doc = "https://aplavin.github.io/SkyImages.jl/test/notebook.html",
                tagline = "Load astronomical images of the sky and process them with convenient, general, and composable functions.",
                descr = """
                - FITS WCS and Healpix images
                - Uniform interface and Makie plotting
                - Use original data as-is or project onto a rectangular grid
                """,
                astropy = ["astropy.visualization"],
            ),
        ),
        "Units/Constants" => (
            (
                name = "AstroAngles.jl",
                repo = "https://github.com/JuliaAstro/AstroAngles.jl",
                doc = "https://juliaastro.org/AstroAngles/stable/",
                tagline = "String parsing and representation of angles",
                descr = """
                - Parse and represent sexagesimal angles with a variety of delimiters
                - Methods for converting to hour-minute-second angles from degrees and radians, and vice-versa
                """,
                astropy = [],
            ),
            (
                name = "DynamicQuantities.jl",
                repo = "https://github.com/SymbolicML/DynamicQuantities.jl",
                doc = "https://symbolicml.org/DynamicQuantities.jl/stable/",
                tagline = "Efficient and type-stable physical quantities in Julia",
                descr = """
                - Defines a simple statically-typed `Quantity` type for Julia
                - Physical dimensions are stored as a value, as opposed to a parametric type, as in [Unitful.jl](https://github.com/PainterQubits/Unitful.jl)
                """,
                astropy = ["astropy.constants", "astropy.units"],
            ),
            (
                name = "PhysicalConstants.jl",
                repo = "https://github.com/JuliaPhysics/PhysicalConstants.jl",
                doc = "https://juliaphysics.github.io/PhysicalConstants.jl/stable/",
                tagline = "Collection of fundamental physical constants with uncertainties",
                descr = """
                - `PhysicalConstants.jl` provides common physical constants
                - They are defined as instances of the new `Constant` type, which is subtype of `AbstractQuantity` (from [`Unitful.jl`](https://github.com/PainterQubits/Unitful.jl) package) and can also be turned into `Measurement` objects (from [`Measurements.jl`](https://github.com/JuliaPhysics/Measurements.jl) package) at request
                """,
                astropy = ["astropy.constants", "astropy.units"],
            ),
            (
                name = "Unitful.jl",
                repo = "https://github.com/PainterQubits/Unitful.jl",
                doc = "https://painterqubits.github.io/Unitful.jl/stable",
                tagline = "Physical quantities with arbitrary units",
                descr = """
                - Unitful is a Julia package for physical units
                - We want to support not only SI units but also any other unit system
                """,
                astropy = ["astropy.constants", "astropy.units"],
            ),
            (
                name = "UnitfulAstro.jl",
                repo = "https://github.com/JuliaAstro/UnitfulAstro.jl",
                doc = "https://juliaastro.org/UnitfulAstro/stable/",
                tagline = "Astronomical units and things",
                descr = """
                - Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
                """,
                astropy = ["astropy.constants", "astropy.units"],
            ),
        ),
    ),
)

ecosystem_t() = Table(package
    for (highlevel, sublevels) in ecosystem()
        for (sublevel, packages) in sublevels
            for package in packages
)

include("ecosystem.jl")
include("comparison.jl")

end
