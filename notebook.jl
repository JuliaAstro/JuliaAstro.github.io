### A Pluto.jl notebook ###
# v0.20.8

using Markdown
using InteractiveUtils

# ╔═╡ 10ca0c38-6c3d-4d8f-8db7-bcfc844b5f58
using TypedTables, SplitApplyCombine

# ╔═╡ 27e444ee-3b56-4a8e-8be4-4f1cc535cad9
using HypertextLiteral

# ╔═╡ a8539a20-29dd-11f0-0f9a-515548f32a90
ecosystem = (
    # Data I/O
    (
        highlevel = "Data I/O",
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
        highlevel = "Data I/O",
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
        highlevel = "Data I/O",
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
        highlevel = "Data I/O",
        name = "eschnett/ASDF2.jl",
        repo = "https://github.com/eschnett/ASDF2.jl",
        doc = "https://eschnett.github.io/ASDF2.jl/dev/",
        tagline = "Load files in ASDF format, which is the upcoming stadnard for STScI/Roman",
        descr = """
        """,
        astropy = ["asdf-astropy"],
    ),
    (
        # TODO: Update for Julia v1.11
        # https://github.com/torrance/Casacore.jl/issues/12
        highlevel = "Data I/O",
        name = "torrance/Casacore.jl",
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
        highlevel = "Data I/O",
        name = "JuliaAPlavin/Difmap.jl",
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
        highlevel = "Data I/O",
        name = "emmt/EasyFITS.jl",
        repo = "https://github.com/emmt/EasyFITS.jl",
        doc = "https://emmt.github.io/EasyFITS.jl/dev",
        tagline = "Using FITS files made easier for Julia",
        descr = """
        - EasyFITS is a [Julia](https://julialang.org/) package designed to make it easier to read and write data in [FITS](https://fits.gsfc.nasa.gov/fits_standard.html) format without sacrificing performances, flexibility, or readability.
        """,
        astropy = ["astropy.io.fits"]
    ),
    (
        highlevel = "Data I/O",
        name = "barrettp/FITS.jl",
        repo = "https://github.com/barrettp/FITS.jl",
        doc = "https://emmt.github.io/EasyFITS.jl/dev",
        tagline = "Using FITS files made easier for Julia",
        descr = """
        - EasyFITS is a [Julia](https://julialang.org/) package designed to make it easier to read and write data in [FITS](https://fits.gsfc.nasa.gov/fits_standard.html) format without sacrificing performances, flexibility, or readability.
        """,
        astropy = ["astropy.io.fits"]
    ),
    (
        highlevel = "Data I/O",
        name = "emmt/OIFITS.jl",
        repo = "https://github.com/emmt/OIFITS.jl",
        doc = "https://github.com/emmt/OIFITS.jl?tab=readme-ov-file#support-for-oi-fits-data-in-julia",
        tagline = "Support for OI-FITS",
        descr = """
        - Read and write OI-FITS optical interferometry data format
        """,
        astropy = ["astropy.io.fits"]
    ),
    (
        highlevel = "Data I/O",
        name = "JuliaAPlavin/VirtualObservatory.jl",
        repo = "https://github.com/JuliaAPlavin/VirtualObservatory.jl",
        doc = "https://github.com/JuliaAPlavin/VirtualObservatory.jl?tab=readme-ov-file#virtualobservatoryjl",
        tagline = "Access remote data and services that follow Virtual Observatory (VO, <https://www.ivoa.net/>) protocols.",
        descr = """
        - Currently supports the Table Access Protocol (TAP), and a few key features specific to the VizieR database
        """,
        astropy = ["astropy.io.votable"]
    ),
    (
        highlevel = "Data I/O",
        name = "JuliaAPlavin/VLBIData.jl",
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
        highlevel = "Data I/O",
        name = "JuliaAPlavin/VOTables.jl",
        repo = "https://github.com/JuliaAPlavin/VOTables.jl",
        doc = "https://github.com/JuliaAPlavin/VOTables.jl",
        tagline = "Read and write VOTable files",
        descr = """
        - Text and binary VOTables support
        - Read Unitful numbers and column metadata
        """,
        astropy = ["astropy.io.votable"],
    ),
    # Images
    (
        highlevel = "Images",
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
        highlevel = "Images",
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
        highlevel = "Images",
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
        highlevel = "Images",
        name = "Photometry.jl",
        repo = "https://github.com/JuliaAstro/Photometry.jl",
        doc = "https://juliaastro.org/Photometry/stable/",
        tagline = "Aperture photometry",
        descr = """
        - Background estimation and source extraction
        - Fast and precise aperture photometry
        """,
        astropy = ["photutils"],
    ),
    (
        highlevel = "Images",
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
        highlevel = "Images",
        name = "Reproject.jl",
        repo = "https://github.com/JuliaAstro/Reproject.jl",
        doc = "https://github.com/JuliaAstro/Reproject.jl?tab=readme-ov-file#reproject",
        tagline = "Astronomical image reprojection",
        descr = """
        - Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images
        """,
        astropy = ["reproject"],
    ),
    (
        highlevel = "Images",
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
    (
        highlevel = "Images",
        name = "JuliaHCI/ADI.jl",
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
        highlevel = "Images",
        name = "JuliaHCI/HCIToolbox.jl",
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
        highlevel = "Images",
        name = "JuliaAPlavin/SkyImages.jl",
        repo = "https://github.com/JuliaAPlavin/SkyImages.jl",
        doc = "https://aplavin.github.io/SkyImages.jl/test/notebook.html",
        tagline = "Load astronomical images of the sky and process them with convenient, general, and composable functions.",
        descr = """
        - FITS WCS and Healpix images
        - Uniform interface and Makie plotting
        - Use original data as-is or project onto a rectangular grid
        """,
        astropy = [],
    ),
    # Time, Coords, Units
    (
        highlevel = "Time, Coords, Units",
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
        highlevel = "Time, Coords, Units",
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
        highlevel = "Time, Coords, Units",
        name = "ERFA.jl",
        repo = "https://github.com/JuliaAstro/ERFA.jl",
        doc = "https://github.com/JuliaAstro/ERFA.jl?tab=readme-ov-file#erfajl",
        tagline = "Time systems conversions",
        descr = """
        - Low-level wrapper for [liberfa](https://github.com/liberfa/erfa)
        """,
        astropy = [],
    ),
    (
        highlevel = "Time, Coords, Units",
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
        highlevel = "Time, Coords, Units",
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
    (
        highlevel = "Time, Coords, Units",
        name = "UnitfulAstro.jl",
        repo = "https://github.com/JuliaAstro/UnitfulAstro.jl",
        doc = "https://juliaastro.org/UnitfulAstro/stable/",
        tagline = "Astronomical units",
        descr = """
        - Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
        """,
        astropy = ["astropy.constants", "astropy.units"],
    ),
    (
        highlevel = "Time, Coords, Units",
        name = "WCS.jl",
        repo = "https://github.com/JuliaAstro/WCS.jl",
        doc = "https://juliaastro.org/WCS/stable/",
        tagline = "World Coordinate System transformations",
        descr = """
        - Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)
        """,
        astropy = ["astropy.wcs"],
    ),
    (
        highlevel = "Time, Coords, Units",
        name = "SymbolicML/DynamicQuantities.jl",
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
        highlevel = "Time, Coords, Units",
        name = "JuliaPhysics/PhysicalConstants.jl",
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
        highlevel = "Time, Coords, Units",
        name = "PainterQubits/Unitful.jl",
        repo = "https://github.com/PainterQubits/Unitful.jl",
        doc = "https://painterqubits.github.io/Unitful.jl/stable",
        tagline = "Physical quantities with arbitrary units",
        descr = """
        - Unitful is a Julia package for physical units
        - We want to support not only SI units but also any other unit system
        """,
        astropy = ["astropy.constants", "astropy.units"],
    ),
    # Orbits
    (
        highlevel = "Orbits",
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
        highlevel = "Orbits",
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
    (
        highlevel = "Orbits",
        name = "EphemerisSources.jl",
        repo = "https://github.com/JuliaAstro/EphemerisSources.jl",
        doc = "https://juliaastro.org/EphemerisSources.jl/docs",
        tagline = "Meta package for accessing JPL HORIZONS and SPICE sources",
        descr = """
        - Calculate positions and velocities of solar system bodies
        """,
        astropy = ["astropy.coordinates"],
    ),
    (
        highlevel = "Orbits",
        name = "barrettp/Astrometry.jl",
        repo = "https://github.com/barrettp/Astrometry.jl",
        doc = "https://barrettp.github.io/Astrometry/dev",
        tagline = "Set of IAU standard algorithms for calculating the time and position of celestial objects",
        descr = """
        - More information can be found on the official website of the [Standards of Fundamental Astronomy](http://www.iausofa.org/).
        """,
        astropy = [],
    ),
    (
        highlevel = "Orbits",
        name = "PerezHz/HORIZONS.jl",
        repo = "https://github.com/PerezHz/HORIZONS.jl",
        doc = "https://github.com/PerezHz/HORIZONS.jl?tab=readme-ov-file#horizonsjl",
        tagline = "An interface to NASA-JPL HORIZONS system and other Solar System Dynamics APIs in Julia",
        descr = """
        - Calculate positions and velocities of solar system bodies
        """,
        astropy = ["astropy.coordinates"],
    ),
    #(
    #    # TODO: Follow-up on status of this package
    #    # https://github.com/helgee/JPLEphemeris.jl/issues/23
    #    highlevel = "Orbits",
    #    name = "helgee/JPLEphemeris.jl",
    #    repo = "https://github.com/JuliaAstro/JPLEphemeris.jl",
    #    doc = "https://github.com/helgee/JPLEphemeris.jl?tab=readme-ov-file#jplephemerisjl",
    #    tagline = "JPL Development Ephemerides",
    #    descr = """
    #    - Calculate positions and velocities of solar system bodies
    #    """,
    #),
    (
        highlevel = "Orbits",
        name = "sefffal/PlanetOrbits.jl",
        repo = "https://github.com/sefffal/PlanetOrbits.jl",
        doc = "https://sefffal.github.io/PlanetOrbits.jl/dev/",
        tagline = "Tools for displaying and solving Keplerian orbits in the context of direct imaging",
        descr = """
        """,
        astropy = [],
    ),
    # General
    (
        highlevel = "General",
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
        highlevel = "General",
        name = "BoxLeastSquares.jl",
        repo = "https://github.com/JuliaAstro/BoxLeastSquares.jl",
        doc = "https://juliaastro.org/BoxLeastSquares/stable/",
        tagline = "Compute box-least-squares periodogram",
        descr = """
        - Fit BLS periodograms to time-series data
        - Extract best-fitting transit parameters from the BLS periodogram
        - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
        """,
        astropy = [],
    ),
    (
        highlevel = "General",
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
        highlevel = "General",
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
        highlevel = "General",
        name = "LombScargle.jl",
        repo = "https://github.com/JuliaAstro/LombScargle.jl",
        doc = "https://juliaastro.org/LombScargle/stable/",
        tagline = "Compute Lomb-Scargle periodogram",
        descr = """
        - Create periodograms from unevenly sampled periodic signals
        - Supports multi-threading
        """,
        astropy = [],
    ),
    (
        highlevel = "General",
        name = "Photometry.jl",
        repo = "https://github.com/JuliaAstro/Photometry.jl",
        doc = "https://juliaastro.org/Photometry/stable/",
        tagline = "Aperture photometry",
        descr = """
        - Background estimation and source extraction
        - Fast and precise aperture photometry
        """,
        astropy = ["photutils"],
    ),
    (
        highlevel = "General",
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
        highlevel = "General",
        name = "mileslucas/BiweightStats.jl",
        repo = "https://github.com/mileslucas/BiweightStats.jl",
        doc = "http://mileslucas.com/BiweightStats.jl/stable/",
        tagline = "Robust statistics based on the biweight transform",
        descr = """
        - Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics
        """,
        astropy = [],
    ),
    (
        highlevel = "General",
        name = "ziotom78/Healpix.jl",
        repo = "https://github.com/ziotom78/Healpix.jl",
        doc = "https://ziotom78.github.io/Healpix.jl/stable/",
        tagline = "Implementation of Healpix spherical tesselation scheme in pure Julia",
        descr = """
        - pixel functions, query functions, map functions
        - power spectrum support
        - plotting support
        """,
        astropy = ["astropy-healpix"],
    ),
    (
        highlevel = "General",
        name = "ajwheeler/Korg.jl",
        repo = "https://github.com/ajwheeler/Korg.jl",
        doc = "https://ajwheeler.github.io/Korg.jl/stable/",
        tagline = "Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE",
        descr = """
        """,
        astropy = [],
    ),
    (
        highlevel = "General",
        name = "ManuelBehrendt/Mera.jl",
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
        highlevel = "General",
        name = "fabienbaron/OITOOLS.jl",
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
        highlevel = "General",
        name = "sefffal/PairPlots.jl",
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
        highlevel = "General",
        name = "JuliaSpace/SatelliteToolbox.jl",
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
        highlevel = "General",
        name = "fjebaker/SpectralFitting.jl",
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
)

# ╔═╡ 8e09606c-b8db-4185-b066-21e479dbd628
t = Table(ecosystem)

# ╔═╡ bdf897df-cacb-40fd-9619-3622ee5c872f
tg = group(t.highlevel, t)

# ╔═╡ 202248a0-a023-458a-a06f-e70493adc996
tg_astropy = group(t.astropy, t)

# ╔═╡ 1b82c328-5baf-4999-b377-2ebc58a6d6e3
stake! = String ∘ take!

# ╔═╡ f5f7d442-01aa-40dc-bf5e-f7fc385d1c57
html"""
<table class="compare">
  <thead>
    <tr>
      <th>Python</th>
      <th>Julia</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>

    <tr>
      <td rowspan=5>
        <a href="https://docs.astropy.org/en/stable/constants/index.html"><code>astropy.constants</code></a>
      </td>
    </tr>
        <tr>
         <td><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">SymbolicML/DynamicQuantities.jl</a></td>
        <td>Efficient and type-stable physical quantities in Julia.</td>
        </tr>
        <tr>
          <td><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">JuliaPhysics/PhysicalConstants.jl</a></td>
          <td>Common constants used in physics.</td>
        </tr>
        <tr>
          <td><a href="https://painterqubits.github.io/Unitful.jl/stable/">PainterQubits/Unitful.jl</a></td>
          <td>Generic units.</td>
        </tr>
        <tr>
          <td><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></td>
          <td>Astronomy specific units.</td>
        </tr>
</table>
"""

# ╔═╡ 4e8bcbaf-5bcd-4704-912f-12f6691c8fb5
package_row(p) = """
<tr>
  <td><a href="$(p.repo)">$(p.name)</a></td>
  <td>$(p.tagline)</td>
</tr>
"""

# ╔═╡ 21b75231-dc54-4043-b091-4bf2f588979a
function package_section(t, astropy_module, astropy_url)
    io = IOBuffer()
    t_astropy = filter(x -> astropy_module in x.astropy, t)
    write(io, """
      <tr>
        <td rowspan=$(length(t_astropy)+1)>
          <a href="$(astropy_url)"><code>$(astropy_module)</code></a>
       </td>
      </tr>
    """)
   
    for p in t_astropy 
      write(io, package_row(p))
    end

    stake!(io)
end

# ╔═╡ ebbd03b5-269c-4813-ad41-a61e551c8cf8
yee = let
    io = IOBuffer()
    write(io, """
    <table class="compare">
      <thead>
        <tr>
          <th>Python</th>
          <th>Julia</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>\n
    """)

    write(io, package_section(t, "astropy.constants", "https://docs.astropy.org/en/stable/constants/index.html"), "\n")

    write(io, package_section(t, "astropy.units", "https://docs.astropy.org/en/stable/units/index.html"), "\n")

    write(io, package_section(t, "astropy.nddata", "https://docs.astropy.org/en/stable/nddata/index.html"), "\n")

    write(io, "</table>")

    stake!(io) |> print
end

# ╔═╡ fa22c537-909f-413a-b773-072ec75a7301
html"""<table class="compare">
  <thead>
    <tr>
      <th>Python</th>
      <th>Julia</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/constants/index.html"><code>astropy.constants</code></a>
   </td>
  </tr>
<tr>
  <td><a href="https://github.com/JuliaAstro/UnitfulAstro.jl">UnitfulAstro.jl</a></td>
  <td>Astronomical units</td>
</tr>
<tr>
  <td><a href="https://github.com/SymbolicML/DynamicQuantities.jl">SymbolicML/DynamicQuantities.jl</a></td>
  <td>Efficient and type-stable physical quantities in Julia</td>
</tr>
<tr>
  <td><a href="https://github.com/JuliaPhysics/PhysicalConstants.jl">JuliaPhysics/PhysicalConstants.jl</a></td>
  <td>Collection of fundamental physical constants with uncertainties</td>
</tr>
<tr>
  <td><a href="https://github.com/PainterQubits/Unitful.jl">PainterQubits/Unitful.jl</a></td>
  <td>Physical quantities with arbitrary units</td>
</tr>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/units/index.html"><code>astropy.units</code></a>
   </td>
  </tr>
<tr>
  <td><a href="https://github.com/JuliaAstro/UnitfulAstro.jl">UnitfulAstro.jl</a></td>
  <td>Astronomical units</td>
</tr>
<tr>
  <td><a href="https://github.com/SymbolicML/DynamicQuantities.jl">SymbolicML/DynamicQuantities.jl</a></td>
  <td>Efficient and type-stable physical quantities in Julia</td>
</tr>
<tr>
  <td><a href="https://github.com/JuliaPhysics/PhysicalConstants.jl">JuliaPhysics/PhysicalConstants.jl</a></td>
  <td>Collection of fundamental physical constants with uncertainties</td>
</tr>
<tr>
  <td><a href="https://github.com/PainterQubits/Unitful.jl">PainterQubits/Unitful.jl</a></td>
  <td>Physical quantities with arbitrary units</td>
</tr>

  <tr>
    <td rowspan=1>
      <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
   </td>
  </tr>

</table>
    """

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
SplitApplyCombine = "03a91e81-4c3e-53e1-a0a4-9c0c8f19dd66"
TypedTables = "9d95f2ec-7b3d-5a63-8d20-e2491e220bb9"

[compat]
HypertextLiteral = "~0.9.5"
SplitApplyCombine = "~1.2.3"
TypedTables = "~1.4.6"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.5"
manifest_format = "2.0"
project_hash = "736e5a2dcae15817febe6188b48a5591e6b48020"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "f7817e2e585aa6d924fd714df1e2a84be7896c60"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "4.3.0"

    [deps.Adapt.extensions]
    AdaptSparseArraysExt = "SparseArrays"
    AdaptStaticArraysExt = "StaticArrays"

    [deps.Adapt.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dictionaries]]
deps = ["Indexing", "Random", "Serialization"]
git-tree-sha1 = "a86af9c4c4f33e16a2b2ff43c2113b2f390081fa"
uuid = "85a47980-9c8c-11e8-2b9f-f7ca1fa99fb4"
version = "0.4.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.Indexing]]
git-tree-sha1 = "ce1566720fd6b19ff3411404d4b977acd4814f9f"
uuid = "313cdc1a-70c2-5d6a-ae34-0150d3930a38"
version = "1.1.1"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "cc4054e898b852042d7b503313f7ad03de99c3dd"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.SplitApplyCombine]]
deps = ["Dictionaries", "Indexing"]
git-tree-sha1 = "c06d695d51cfb2187e6848e98d6252df9101c588"
uuid = "03a91e81-4c3e-53e1-a0a4-9c0c8f19dd66"
version = "1.2.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "598cd7c1f68d1e205689b1c2fe65a9f85846f297"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.0"

[[deps.Tricks]]
git-tree-sha1 = "6cae795a5a9313bbb4f60683f7263318fc7d1505"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.10"

[[deps.TypedTables]]
deps = ["Adapt", "Dictionaries", "Indexing", "SplitApplyCombine", "Tables", "Unicode"]
git-tree-sha1 = "84fd7dadde577e01eb4323b7e7b9cb51c62c60d4"
uuid = "9d95f2ec-7b3d-5a63-8d20-e2491e220bb9"
version = "1.4.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╠═a8539a20-29dd-11f0-0f9a-515548f32a90
# ╠═8e09606c-b8db-4185-b066-21e479dbd628
# ╠═bdf897df-cacb-40fd-9619-3622ee5c872f
# ╠═202248a0-a023-458a-a06f-e70493adc996
# ╠═1b82c328-5baf-4999-b377-2ebc58a6d6e3
# ╠═10ca0c38-6c3d-4d8f-8db7-bcfc844b5f58
# ╠═f5f7d442-01aa-40dc-bf5e-f7fc385d1c57
# ╠═4e8bcbaf-5bcd-4704-912f-12f6691c8fb5
# ╠═21b75231-dc54-4043-b091-4bf2f588979a
# ╠═ebbd03b5-269c-4813-ad41-a61e551c8cf8
# ╠═fa22c537-909f-413a-b773-072ec75a7301
# ╠═27e444ee-3b56-4a8e-8be4-4f1cc535cad9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
