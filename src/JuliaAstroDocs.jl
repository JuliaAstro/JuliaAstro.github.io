module JuliaAstroDocs

import Markdown

ecosystem = (
    "Data I/O" => (
        (
            name = "AstroImages.jl",
            repo = "https://github.com/JuliaAstro/AstroImages.jl",
            doc = "https://juliaastro.github.io/AstroImages.jl/stable/",
            tagline = "Load, manipulate, and visualize astronomical images",
            descr = """
            - Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
            """,
        ),
        (
            name = "CFITSIO.jl",
            repo = "https://github.com/JuliaAstro/CFITSIO.jl",
            doc = "https://juliaastro.github.io/FITSIO.jl/stable/",
            tagline = "Reading and writing FITS files",
            descr = """
            - Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
            - The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)
            """,
        ),
        (
            name = "FITSIO.jl",
            repo = "https://github.com/JuliaAstro/FITSIO.jl",
            doc = "https://juliaastro.github.io/FITSIO.jl/stable/",
            tagline = "Reading and writing FITS files",
            descr = """
            - Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
            - FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.
            """,
        ),
        (
            name = "eschnett/ASDF2.jl",
            repo = "https://github.com/eschnett/ASDF2.jl",
            doc = "https://eschnett.github.io/ASDF2.jl/dev/",
            tagline = "Load files in ASDF format, which is the upcoming stadnard for STScI/Roman",
            descr = """
            """,
        ),
        (
            # TODO: Update for Julia v1.11
            # https://github.com/torrance/Casacore.jl/issues/12
            name = "torrance/Casacore.jl",
            repo = "https://github.com/torrance/Casacore.jl",
            doc = "https://github.com/torrance/Casacore.jl?tab=readme-ov-file#casacorejl",
            tagline = "A high level Julia interface to Casacore",
            descr = """
            - Wrapper for [CasaCore](http://casacore.github.io/casacore/)
            - Uses [casacorecxx](https://github.com/torrance/casacorecxx) which uses [CxxWrap](https://github.com/JuliaInterop/CxxWrap.jl) to wrap the C++ Casacore codebase. These raw objects and methods are available in `Casacore.LibCasacore`
            """,
        ),
        (
            name = "JuliaAPlavin/Difmap.jl",
            repo = "https://github.com/JuliaAPlavin/Difmap.jl",
            doc = "https://aplavin.github.io/Difmap.jl/test/examples.html",
            tagline = "Wrapper for the Difmap program used in synthesis imaging",
            descr = """
            - Execute [Difmap](http://www.ascl.net/1103.001) scripts, handle inputs/outputs and logs
            - Display images and plots from Difmap in interactive Julia environments
            """,
        ),
        (
            name = "emmt/EasyFITS.jl",
            repo = "https://github.com/emmt/EasyFITS.jl",
            doc = "https://emmt.github.io/EasyFITS.jl/dev",
            tagline = "Using FITS files made easier for Julia",
            descr = """
            - EasyFITS is a [Julia](https://julialang.org/) package designed to make it easier to read and write data in [FITS](https://fits.gsfc.nasa.gov/fits_standard.html) format without sacrificing performances, flexibility, or readability.
            """,
        ),
        (
            name = "emmt/OIFITS.jl",
            repo = "https://github.com/emmt/OIFITS.jl",
            doc = "https://github.com/emmt/OIFITS.jl?tab=readme-ov-file#support-for-oi-fits-data-in-julia",
            tagline = "Support for OI-FITS",
            descr = """
            - Read and write OI-FITS optical interferometry data format
            """,
        ),
        (
            name = "JuliaAPlavin/VirtualObservatory.jl",
            repo = "https://github.com/JuliaAPlavin/VirtualObservatory.jl",
            doc = "https://github.com/JuliaAPlavin/VirtualObservatory.jl?tab=readme-ov-file#virtualobservatoryjl",
            tagline = "Access remote data and services that follow Virtual Observatory (VO, <https://www.ivoa.net/>) protocols.",
            descr = """
            - Currently supports the Table Access Protocol (TAP), and a few key features specific to the VizieR database
            """,
        ),
        (
            name = "JuliaAPlavin/VLBIData.jl",
            repo = "https://github.com/JuliaAPlavin/VLBIData.jl",
            doc = "https://aplavin.github.io/VLBIData.jl/test/examples.html",
            tagline = "Work with data formats common in very long baseline interferometry (VLBI)",
            descr = """
            - Read interferometric visibilities (`uvfits`), images (`fits`), and source models
            - Minimal writing support for source models
            """,
        ),
    ),
    "Images" => (
        (
            name = "AstroImages.jl",
            repo = "https://github.com/JuliaAstro/AstroImages.jl",
            doc = "https://juliaastro.github.io/AstroImages.jl/stable/",
            tagline = "Load, manipulate, and visualize astronomical images",
            descr = """
            - Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
            """,
        ),
        (
            name = "CCDReduction.jl",
            repo = "https://github.com/JuliaAstro/CCDReduction.jl",
            doc = "https://juliaastro.github.io/CCDReduction.jl/stable/",
            tagline = "Common CCD image processing routines",
            descr = """
            - Creation of calibration files
            - Dark subtraction, flat normalization, bias subtraction, cropping
            - Specialized iterator for processing directories of FITS files using a table built from the FITS headers.
            """,
        ),
        (
            name = "LACosmic.jl",
            repo = "https://github.com/JuliaAstro/LACosmic.jl",
            doc = "https://juliaastro.github.io/LACosmic.jl/stable/",
            tagline = "Cosmic-ray rejection by Laplacian edge detection",
            descr = """
            - Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
            - Returns bad pixel masks and cleaned data
            """,
        ),
        (
            name = "Photometry.jl",
            repo = "https://github.com/JuliaAstro/Photometry.jl",
            doc = "https://juliaastro.github.io/Photometry.jl/stable/",
            tagline = "Aperture photometry",
            descr = """
            - Background estimation and source extraction
            - Fast and precise aperture photometry
            """,
        ),
        (
            name = "PSFModels.jl",
            repo = "https://github.com/JuliaAstro/PSFModels.jl",
            doc = "https://juliaastro.github.io/PSFModels.jl/stable/",
            tagline = "Analytical, allocation-free point-spread-functions (PSF)",
            descr = """
            - Lazy representation allows fast allocation-free calculations
            - Gaussian (Normal), Moffat, and Airy disk.
            """,
        ),
        (
            name = "Reproject.jl",
            repo = "https://github.com/JuliaAstro/Reproject.jl",
            doc = "https://github.com/JuliaAstro/Reproject.jl?tab=readme-ov-file#reproject",
            tagline = "Astronomical image reprojection",
            descr = """
            - Uses [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl) and [WCS.jl](https://github.com/JuliaAstro/WCS.jl) to reproject coordinate systems between FITS images
            """,
        ),
        (
            name = "SAOImageDS9.jl",
            repo = "https://github.com/JuliaAstro/SAOImageDS9.jl",
            doc = "https://juliaastro.github.io/SAOImageDS9.jl/stable/",
            tagline = "Interface with the DS9 image viewer",
            descr = """
            - Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
            - Easily display images in DS9 and add features like circles and lines
            - Low-level API accessible with `set` and `get`
            """,
        ),
        (
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
        ),
        (
            name = "JuliaHCI/HCIToolbox.jl",
            repo = "https://github.com/JuliaHCI/HCIToolbox.jl",
            doc = "http://JuliaHCI.github.io/HCIToolbox.jl/stable/",
            tagline = "Common utilities for high-contrast imaging (HCI) processing",
            descr = """
            - Morphological operations (rotation, stacking, shifting)
            - Masking routines (circles, annulus, series of annuli)
            - Spectral scaling and descaling
            """,
        ),
    ),
    "Time, Coords, Units" => (
        (
            name = "AstroAngles.jl",
            repo = "https://github.com/JuliaAstro/AstroAngles.jl",
            doc = "https://juliaastro.org/AstroAngles.jl/dev/",
            tagline = "String parsing and representation of angles",
            descr = """
            - Parse and represent sexagesimal angles with a variety of delimiters
            - Methods for converting to hour-minute-second angles from degrees and radians, and vice-versa
            """,
        ),
        (
            name = "AstroTime.jl",
            repo = "https://github.com/JuliaAstro/AstroTime.jl",
            doc = "https://juliaastro.github.io/AstroTime.jl/stable/",
            tagline = "Astronomical time keeping",
            descr = """
            - High-precision, time-scale aware, DateTime-like data type
            - Support all commonly used astronomical time scales
            """,
        ),
        (
            name = "ERFA.jl",
            repo = "https://github.com/JuliaAstro/ERFA.jl",
            doc = "https://github.com/JuliaAstro/ERFA.jl?tab=readme-ov-file#erfajl",
            tagline = "Time systems conversions",
            descr = """
            - Low-level wrapper for [liberfa](https://github.com/liberfa/erfa)
            """,
        ),
        (
            name = "SkyCoords.jl",
            repo = "https://github.com/JuliaAstro/SkyCoords.jl",
            doc = "https://juliaastro.org/SkyCoords.jl/stable/",
            tagline = "Astronomical coordinate systems",
            descr = """
            - Supports ICRS, galactic, and FK5 coordinate systems
            - Fast conversion of coordinates between different systems
            """,
        ),
        (
            name = "SPICE.jl",
            repo = "https://github.com/JuliaAstro/SPICE.jl",
            doc = "https://juliaastro.org/SPICE.jl/stable/",
            tagline = "SPICE data retrieval and usage",
            descr = """
            - Wrapper for [CSPICE](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/index.html)
            - Read SPICE data files and compute derived observation geometry such as altitude, latitude/longitude and lighting angles
            """,
        ),
        (
            name = "UnitfulAstro.jl",
            repo = "https://github.com/JuliaAstro/UnitfulAstro.jl",
            doc = "https://juliaastro.github.io/UnitfulAstro.jl/stable/",
            tagline = "Astronomical units",
            descr = """
            - Extension of [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
            """,
        ),
        (
            name = "WCS.jl",
            repo = "https://github.com/JuliaAstro/WCS.jl",
            doc = "https://juliaastro.github.io/WCS.jl/stable/",
            tagline = "World Coordinate System transformations",
            descr = """
            - Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)
            """,
        ),
    ),
    "Orbits" => (
        (
            name = "EarthOrientation.jl",
            repo = "https://github.com/JuliaAstro/EarthOrientation.jl",
            doc = "https://juliaastro.github.io/EarthOrientation.jl/stable/",
            tagline = "Earth orientation parameters",
            descr = """
            - Calculate Earth orientation parameters from IERS tables
            """,
        ),
        (
            name = "Transits.jl",
            repo = "https://github.com/JuliaAstro/Transits.jl",
            doc = "https://juliaastro.github.io/Transits.jl/stable/",
            tagline = "Flexible photometric transit curves with limb darkening",
            descr = """
            - Inspired by [exoplanet](https://github.com/exoplanet-dev/exoplanet)
            - Includes Keplerian orbits and generic orbits
            - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
            """,
        ),
        (
            name = "EphemerisSources.jl",
            repo = "https://github.com/JuliaAstro/EphemerisSources.jl",
            doc = "https://juliaastro.org/EphemerisSources.jl/docs",
            tagline = "Meta package for accessing JPL HORIZONS and SPICE sources",
            descr = """
            - Calculate positions and velocities of solar system bodies
            """,
        ),
        (
            name = "barrettp/Astrometry.jl",
            repo = "https://github.com/barrettp/Astrometry.jl",
            doc = "https://barrettp.github.io/Astrometry/dev",
            tagline = "Set of IAU standard algorithms for calculating the time and position of celestial objects",
            descr = """
            - More information can be found on the official website of the [Standards of Fundamental Astronomy](http://www.iausofa.org/).
            """,
        ),
        (
            name = "PerezHz/HORIZONS.jl",
            repo = "https://github.com/PerezHz/HORIZONS.jl",
            doc = "https://github.com/PerezHz/HORIZONS.jl?tab=readme-ov-file#horizonsjl",
            tagline = "An interface to NASA-JPL HORIZONS system and other Solar System Dynamics APIs in Julia",
            descr = """
            - Calculate positions and velocities of solar system bodies
            """,
        ),
        #(
        #    # TODO: Follow-up on status of this package
        #    # https://github.com/helgee/JPLEphemeris.jl/issues/23
        #    name = "helgee/JPLEphemeris.jl",
        #    repo = "https://github.com/JuliaAstro/JPLEphemeris.jl",
        #    doc = "https://github.com/helgee/JPLEphemeris.jl?tab=readme-ov-file#jplephemerisjl",
        #    tagline = "JPL Development Ephemerides",
        #    descr = """
        #    - Calculate positions and velocities of solar system bodies
        #    """,
        #),
        (
            name = "sefffal/PlanetOrbits.jl",
            repo = "https://github.com/sefffal/PlanetOrbits.jl",
            doc = "https://sefffal.github.io/PlanetOrbits.jl/dev/",
            tagline = "Tools for displaying and solving Keplerian orbits in the context of direct imaging",
            descr = """
            """,
        ),
    ),
    "General" => (
        (
            name = "AstroLib.jl",
            repo = "https://github.com/JuliaAstro/astrolib.jl",
            doc = "https://juliaastro.github.io/AstroLib.jl/stable/",
            tagline = "Collection of generic astronomical and astrophysical functions",
            descr = """
            - Translation of many IDL AstroLib procedures
            """,
        ),
        (
            name = "BoxLeastSquares.jl",
            repo = "https://github.com/JuliaAstro/BoxLeastSquares.jl",
            doc = "https://juliaastro.github.io/BoxLeastSquares.jl/stable/",
            tagline = "Compute box-least-squares periodogram",
            descr = """
            - Fit BLS periodograms to time-series data
            - Extract best-fitting transit parameters from the BLS periodogram
            - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
            """,
        ),
        (
            name = "Cosmology.jl",
            repo = "https://github.com/JuliaAstro/Cosmology.jl",
            doc = "https://juliaastro.github.io/Cosmology.jl/stable/",
            tagline = "Distances in the universe",
            descr = """
            - ``\\Lambda``-CDM and ``w_0``-``w_a`` cosmologies
            - Open, closed, and flat variants
            - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
            """,
        ),
        (
            name = "DustExtinction.jl",
            repo = "https://github.com/JuliaAstro/DustExtinction.jl",
            doc = "https://juliaastro.github.io/DustExtinction.jl/stable/",
            tagline = "Dust extinction laws and maps",
            descr = """
            - Various empirical extinction models
            - SFD (1998) galactic dust map
            - Fully compatible with [Unitful.jl](https://github.com/painterqubits/Unitful.jl)
            """,
        ),
        (
            name = "LombScargle.jl",
            repo = "https://github.com/JuliaAstro/LombScargle.jl",
            doc = "https://juliaastro.github.io/LombScargle.jl/stable/",
            tagline = "Compute Lomb-Scargle periodogram",
            descr = """
            - Create periodograms from unevenly sampled periodic signals
            - Supports multi-threading
            """,
        ),
        (
            name = "Photometry.jl",
            repo = "https://github.com/JuliaAstro/Photometry.jl",
            doc = "https://juliaastro.github.io/Photometry.jl/stable/",
            tagline = "Aperture photometry",
            descr = """
            - Background estimation and source extraction
            - Fast and precise aperture photometry
            """,
        ),
        (
            name = "mileslucas/BiweightStats.jl",
            repo = "https://github.com/mileslucas/BiweightStats.jl",
            doc = "http://mileslucas.com/BiweightStats.jl/stable/",
            tagline = "Robust statistics based on the biweight transform",
            descr = """
            - Implements the location, scale, midvariance, midcovariance, and midcorrelation statistics
            """,
        ),
        (
            name = "ziotom78/Healpix.jl",
            repo = "https://github.com/ziotom78/Healpix.jl",
            doc = "https://ziotom78.github.io/Healpix.jl/stable/",
            tagline = "Implementation of Healpix spherical tesselation scheme in pure Julia",
            descr = """
            - pixel functions, query functions, map functions
            - power spectrum support
            - plotting support
            """,
        ),
        (
            name = "ajwheeler/Korg.jl",
            repo = "https://github.com/ajwheeler/Korg.jl",
            doc = "https://ajwheeler.github.io/Korg.jl/stable/",
            tagline = "Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE",
            descr = """
            """,
        ),
        (
            name = "ManuelBehrendt/Mera.jl",
            repo = "https://github.com/ManuelBehrendt/Mera.jl",
            doc = "https://manuelbehrendt.github.io/Mera.jl/stable/",
            tagline = "Working with large hydrodynamical simulation data",
            descr = """
            - Loading, writing, analysing 3D AMR/uniform-grid and N-body data sets
            - Memory lightweight data processing within a database framework
            - Many predefined functions and examples
            """,
        ),
        (
            name = "fabienbaron/OITOOLS.jl",
            repo = "https://github.com/fabienbaron/OITOOLS.jl",
            doc = "https://fabienbaron.github.io/OITOOLS.jl/dev",
            tagline = "A collection of tools to load, visualize, model-fit and image optical interferometry data coming from CHARA, NPOI and VLTI",
            descr = """
            - OITOOLS is a Julia package to read, plot, model-fit and image optical interferometric data coming from astronomical arrays such as CHARA, VLTI, and NPOI
            - Note that despite having the same name as [JMMC's oitools](https://github.com/JMMC-OpenDev/oitools), they are completely unrelated and were developed independently
            """,
        ),
        (
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
        ),
        (
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
        ),
    ),
)

function write_ecosystem()
    fpath = joinpath(@__DIR__, "..", "docs", "src", "ecosystem.md")
    @info "Writing to:" fpath
    open(fpath, "w") do io
        write(io,
            """
            # [Ecosystem](@id eco)

            The joy of our community is the many astronomy and astrophysics packages available for wide use. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development.

            ---

            """
        )
        n_highlevels = length(ecosystem)
        for (i, (highlevel, packages)) in enumerate(ecosystem)
            write(io, "## ", highlevel, "\n\n")
            n_packages = length(packages)
            for (j, p) in enumerate(packages)
                write(io, "### ", p.name, "\n\n")
                write(io,
                    "[![curly braces](assets/code.png) Repository](",
                    p.repo,
                    ")\n\n",
                )
                write(io,
                    "[![book icon](assets/book.png) Documentation](",
                    p.doc,
                    ")\n\n",
                )
                write(io, "**", p.tagline, "**", "\n\n")
                if j < n_packages
                    write(io, p.descr, "\n\n")
                else
                    write(io, p.descr)
                end
            end
            if i < n_highlevels
                write(io, "\n---\n\n")
            end
        end
    end
end

function __init__()
    # Generate ../docs/src/ecosystem.md on startup
    # Note: loops twice if trying to run LiveServer.jl:
    #     once from ./docs/make.jl, and
    #     once from ./test/runtests.jl
    # so this is commented out by default and just run once, manually
    # write_ecosystem()
end

end
