# Comparison with Astropy

We highlight some of the major packages in Python's `astropy` ecosystem and their corresponding implementations in the Julia ecosystem. This is an actively evolving document, and suggested additions are welcomed.

!!! note "Affiliated/coordinated packages in Julia"
    While there is a clear demarcation between core, coordinated, and affiliated packages in Python, this is not really the case in Julia. Composability is a [main feature](https://julialang.org/) of the language, allowing for interactions between packages to occur fairly naturally. 

## Astropy [core packages](https://docs.astropy.org/en/stable/index_user_docs.html)

### Data structures and transformations

| Python | Julia | Description |
| :----- | :---- | :---------- |
| [`astropy.constants`](https://docs.astropy.org/en/stable/constants/index.html) | [Unitful.jl](https://painterqubits.github.io/Unitful.jl/stable/), [UnitfulAstro.jl](https://juliaastro.org/UnitfulAstro/stable/), [PhysicalConstants.jl](https://juliaphysics.github.io/PhysicalConstants.jl/stable/), [DynamicQuantities.jl](https://ai.damtp.cam.ac.uk/dynamicquantities/stable) | Generic units \| Astronomy specific units \| Common constants used in physics \| Efficient and type-stable physical quantities in Julia |
| [`astropy.units`](https://docs.astropy.org/en/stable/units/index.html) | [Unitful.jl](https://painterqubits.github.io/Unitful.jl/stable/), [UnitfulAstro.jl](https://juliaastro.org/UnitfulAstro/stable/), [PhysicalConstants.jl](https://juliaphysics.github.io/PhysicalConstants.jl/stable/), [DynamicQuantities.jl](https://ai.damtp.cam.ac.uk/dynamicquantities/stable) | Generic units \| Astronomy specific units \| Common constants used in physics \| Efficient and type-stable physical quantities in Julia |
| [`astropy.nddata`](https://docs.astropy.org/en/stable/nddata/index.html) | | |
| [`astropy.table`](https://docs.astropy.org/en/stable/table/index.html) | [DataFrames.jl](https://juliadata.github.io/DataFrames.jl/stable/) | In-memory tabular data in Julia |
| [`astropy.time`](https://docs.astropy.org/en/stable/time/index.html) | [AstroTime.jl](https://juliaastro.org/AstroTime/stable/) | Astronomical time keeping in Julia |
| [`astropy.timeseries`](https://docs.astropy.org/en/stable/timeseries/index.html) | [TimeSeries.jl](https://juliastats.org/TimeSeries.jl/stable/) | Time series toolkit for Julia |
| [`astropy.coordinates`](https://docs.astropy.org/en/stable/coordinates/index.html) | [SkyCoords.jl](https://juliaastro.org/SkyCoords/stable/), [FlexiJoins.jl](https://github.com/JuliaAPlavin/FlexiJoins.jl), [EphemerisSources.jl](https://juliaastro.org/EphemerisSources.jl/docs), [SPICE.jl](https://juliaastro.org/SPICE/stable/) | Astronomical coordinate systems in Julia \| A fresh take on joining datasets \| Meta package for accessing JPL HORIZONS and SPICE sources \| SPICE data retrieval and usage |
| [`astropy.wcs`](https://docs.astropy.org/en/stable/wcs/index.html) | [WCS.jl](https://juliaastro.org/WCS/stable/) | Astronomical World Coordinate Systems library for Julia |
| [`astropy.modeling`](https://docs.astropy.org/en/stable/modeling/index.html) | [NonlinearSolve.jl](https://docs.sciml.ai/NonlinearSolve/stable/), [Optimization.jl](https://docs.sciml.ai/Optimization/stable/), [JuMP.jl](http://jump.dev/JuMP.jl/) | High-performance and differentiation-enabled nonlinear solvers \| Mathematical Optimization in Julia \| Modeling language for Mathematical Optimization |
| [`astropy.uncertainty`](https://docs.astropy.org/en/stable/uncertainty/index.html) | [Measurements.jl](https://juliaphysics.github.io/Measurements.jl/stable/), [Distributions.jl](https://juliastats.github.io/Distributions.jl/stable/), [Uncertain.jl](https://github.com/JuliaAPlavin/Uncertain.jl), [MonteCarloMeasurements.jl](https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/) | Error propagation calculator and library for physical measurements \| A Julia package for probability distributions and associated functions \| Handle uncertain values with ease and performance! \| Propagation of distributions by Monte-Carlo sampling |

### Files, I/O, and Communication

| Python | Julia | Description |
| :----- | :---- | :---------- |
| [`astropy.io.fits`](https://docs.astropy.org/en/stable/io/fits/index.html) | [FITSIO.jl](https://juliaastro.org/FITSIO/stable/), [FITS.jl](https://github.com/barrettp/FITS.jl), [EasyFITS.jl](https://emmt.github.io/EasyFITS.jl/dev) | Flexible Image Transport System (FITS) file support for Julia \| A Julia Flexible Image Transport System (FITS) file IO package \| Using FITS files made easier for Julia |
| [`astropy.io.ascii`](https://docs.astropy.org/en/stable/io/ascii/index.html) | [FixedWidthTables.jl](https://github.com/JuliaAPlavin/FixedWidthTables.jl) | Read fixed width (so-called ASCII) tables |
| [`astropy.io.votable`](https://docs.astropy.org/en/stable/io/votable/index.html) | [VOTables.jl](https://github.com/JuliaAPlavin/VOTables.jl) | Support for the VOTable format (Virtual Observatory Table, [defined](https://www.ivoa.net/documents/VOTable/) by [IVOA](https://www.ivoa.net/)) in Julia |

### Computations and Utilities

| Python | Julia | Description |
| :----- | :---- | :---------- |
| [`astropy.cosmology`](https://docs.astropy.org/en/stable/cosmology/index.html) | [Cosmology.jl](https://juliaastro.org/Cosmology/stable/) | Cosmology library for Julia |
| [`astropy.convolution`](https://docs.astropy.org/en/stable/convolution/index.html) | [DSP.jl](https://docs.juliadsp.org/stable/contents/) | Filter design, periodograms, window functions, and other digital signal processing functionality |
| [`astropy.utils.iers`](https://docs.astropy.org/en/stable/utils/iers.html) | [EarthOrientation.jl](https://juliaastro.github.io/EarthOrientation/stable) | Calculate Earth orientation parameters from IERS tables in Julia |
| [`astropy.visualization`](https://docs.astropy.org/en/stable/visualization/index.html) | [AstroImages.jl](https://juliaastro.org/AstroImages/stable/), [PairPlots.jl](https://sefffal.github.io/PairPlots.jl/dev/) | Visualization of astronomical images \| Beautiful and flexible vizualizations of high dimensional data |
| [`astropy.stats`](https://docs.astropy.org/en/stable/stats/index.html) | [JuliaStats](https://juliastats.org/)| Statistics and Machine Learning made easy in Julia |

## Astropy [coordinated packages](https://www.astropy.org/affiliated/#coordinated-package-list)

| Python | Julia | Description |
| :----- | :---- | :---------- |
| [`asdf-astropy`](https://asdf-astropy.readthedocs.io/en/latest/) | [ASDF2.jl](https://github.com/eschnett/ASDF2.jl) | A new [Advanced Scientific Data Format (ASDF)](https://asdf-standard.readthedocs.io/en/latest/index.html) package, written in Julia |
| [`astropy-healpix`](https://astropy-healpix.readthedocs.io/) | [Healpix.jl](https://ziotom78.github.io/Healpix.jl/stable) | Healpix library written in Julia |
| [`astroquery`](https://astroquery.readthedocs.io/) | [VirtualObservatory.jl](https://github.com/JuliaAPlavin/VirtualObservatory.jl) | Access remote data and services that follow Virtual Observatory (VO, [https://www.ivoa.net/](https://www.ivoa.net/)) protocols |
| [`ccdproc`](https://ccdproc.readthedocs.io/) | [CCDReduction.jl](https://juliaastro.github.io/CCDReduction/stable) | A package for performing CCD data reduction |
| [`photutils`](https://photutils.readthedocs.io/) | [Photometry.jl](https://juliaastro.github.io/Photometry/stable) | Utilities for characterizing sources in astronomical images |
| [`regions`](https://astropy-regions.readthedocs.io/) | | |
| [`reproject`](https://reproject.readthedocs.io/) | [Reproject.jl](https://github.com/JuliaAstro/Reproject.jl) | Julia-based Astronomical image reprojection |
| [`specreduce`](https://specreduce.readthedocs.io/) | [Spectra.jl](https://github.com/JuliaAstro/Spectra.jl) | Utilities for interfacing with astronomical spectra and synthetic spectra libraries |
| [`specutils`](https://specutils.readthedocs.io/) | [Spectra.jl](https://github.com/JuliaAstro/Spectra.jl) | Utilities for interfacing with astronomical spectra and synthetic spectra libraries |
