# Comparison with Astropy

We highlight some of the major packages in Python's `astropy` ecosystem and their corresponding implementations in the Julia ecosystem. This is an actively evolving document, and suggested additions are welcomed.

!!! note "Affiliated/coordinated packages in Julia"
    While there is a clear demarcation between core, coordinated, and affiliated packages in Python, this is not really the case in Julia. Composability is a [core feature](https://julialang.org/) of the language, allowing for interactions between packages to occur fairly naturally.

## Astropy [core packages](https://docs.astropy.org/en/stable/index_user_docs.html)

### Data structures and transformations

```@raw html
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
    <td><a href="https://github.com/JuliaAstro/UnitfulAstro.jl">UnitfulAstro.jl</a></td>
    <td>Astronomical units and things</td>
  </tr>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/units/index.html"><code>astropy.units</code></a>
   </td>
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
    <td><a href="https://github.com/JuliaAstro/UnitfulAstro.jl">UnitfulAstro.jl</a></td>
    <td>Astronomical units and things</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/rafaqz/DimensionalData.jl">rafaqz/DimensionalData.jl</a></td>
    <td>Named dimensions and indexing for julia arrays and other data</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://docs.astropy.org/en/stable/table/index.html"><code>astropy.table</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaData/DataFrames.jl">JuliaData/DataFrames.jl</a></td>
    <td>In-memory tabular data in Julia</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/FlexiJoins.jl">JuliaAPlavin/FlexiJoins.jl</a></td>
    <td>`FlexiJoins.jl` is a fresh take on joining tabular or non-tabular datasets in Julia.</td>
  </tr>
  <tr>
    <td><a href="https://github.com/gcalderone/SortMerge.jl">gcalderone/SortMerge.jl</a></td>
    <td>A Julia implementation of the Sort-merge join algorithm</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/time/index.html"><code>astropy.time</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/AstroTime.jl">AstroTime.jl</a></td>
    <td>Astronomical time keeping</td>
  </tr>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/timeseries/index.html"><code>astropy.timeseries</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/BoxLeastSquares.jl">BoxLeastSquares.jl</a></td>
    <td>Compute box-least-squares periodogram</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaDSP/DSP.jl">JuliaDSP/DSP.jl</a></td>
    <td>Filter design, periodograms, window functions, and other digital signal processing functionality</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/LombScargle.jl">LombScargle.jl</a></td>
    <td>Compute Lomb-Scargle periodogram</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaStats/TimeSeries.jl">JuliaStats/TimeSeries.jl</a></td>
    <td>Time series toolkit for Julia</td>
  </tr>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/coordinates/index.html"><code>astropy.coordinates</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/EphemerisSources.jl">EphemerisSources.jl</a></td>
    <td>Meta package for accessing JPL HORIZONS and SPICE sources</td>
  </tr>
  <tr>
    <td><a href="https://github.com/PerezHz/HORIZONS.jl">PerezHz/HORIZONS.jl</a></td>
    <td>An interface to NASA-JPL HORIZONS system and other Solar System Dynamics APIs in Julia</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/SPICE.jl">SPICE.jl</a></td>
    <td>SPICE data retrieval and usage</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/SkyCoords.jl">SkyCoords.jl</a></td>
    <td>Astronomical coordinate systems</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/wcs/index.html"><code>astropy.wcs</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/WCS.jl">WCS.jl</a></td>
    <td>World Coordinate System transformations</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://docs.astropy.org/en/stable/modeling/index.html"><code>astropy.modeling</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/jump-dev/JuMP.jl">jump-dev/JuMP.jl</a></td>
    <td>Modeling language for Mathematical Optimization (linear, mixed-integer, conic, semidefinite, nonlinear)</td>
  </tr>
  <tr>
    <td><a href="https://github.com/SciML/NonlinearSolve.jl">SciML/NonlinearSolve.jl</a></td>
    <td>High-performance and differentiation-enabled nonlinear solvers (Newton methods), bracketed rootfinding (bisection, Falsi), with sparsity and Newton-Krylov support</td>
  </tr>
  <tr>
    <td><a href="https://github.com/SciML/Optimization.jl">SciML/Optimization.jl</a></td>
    <td>Mathematical Optimization in Julia. Local, global, gradient-based and derivative-free. Linear, Quadratic, Convex, Mixed-Integer, and Nonlinear Optimization in one simple, fast, and differentiable interface</td>
  </tr>

  <tr>
    <td rowspan=5>
      <a href="https://docs.astropy.org/en/stable/uncertainty/index.html"><code>astropy.uncertainty</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaPhysics/Measurements.jl">JuliaPhysics/Measurements.jl</a></td>
    <td>Error propagation calculator and library for physical measurements. It supports real and complex numbers with uncertainty, arbitrary precision calculations, operations with arrays, and numerical integration</td>
  </tr>
  <tr>
    <td><a href="https://github.com/baggepinnen/MonteCarloMeasurements.jl">MonteCarloMeasurements.jl</a></td>
    <td>Propagation of distributions by Monte-Carlo sampling: Real number types with uncertainty represented by samples</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/Uncertain.jl">JuliaAPlavin/Uncertain.jl</a></td>
    <td>Handle uncertain values with ease and performance!</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaStats/Distributions.jl">JuliaStats/Distributions.jl</a></td>
    <td>A Julia package for probability distributions and associated functions</td>
  </tr>

  </tbody>
</table>
```

### Files, I/O, and Communication

```@raw html
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
    <td rowspan=8>
      <a href="https://docs.astropy.org/en/stable/io/fits/index.html"><code>astropy.io.fits</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/emmt/OIFITS.jl">emmt/OIFITS.jl</a></td>
    <td>Support for OI-FITS</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/CFITSIO.jl">CFITSIO.jl</a></td>
    <td>Reading and writing FITS files</td>
  </tr>
  <tr>
    <td><a href="https://github.com/emmt/EasyFITS.jl">emmt/EasyFITS.jl</a></td>
    <td>Using FITS files made easier for Julia</td>
  </tr>
  <tr>
    <td><a href="https://github.com/barrettp/FITS.jl">barrettp/FITS.jl</a></td>
    <td>Using FITS files made easier for Julia</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/FITSIO.jl">FITSIO.jl</a></td>
    <td>Reading and writing FITS files</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/SkyImages.jl">JuliaAPlavin/SkyImages.jl</a></td>
    <td>Load astronomical images of the sky and process them with convenient, general, and composable functions.</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/AstroImages.jl">AstroImages.jl</a></td>
    <td>Load, manipulate, and visualize astronomical images</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/io/ascii/index.html"><code>astropy.io.ascii</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/FixedWidthTables.jl">FixedWidthTables.jl</a></td>
    <td>Read fixed width (so-called ASCII) tables</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://docs.astropy.org/en/stable/io/votable/index.html"><code>astropy.io.votable</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/VLBIData.jl">JuliaAPlavin/VLBIData.jl</a></td>
    <td>Work with data formats common in very long baseline interferometry (VLBI)</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/VirtualObservatory.jl">JuliaAPlavin/VirtualObservatory.jl</a></td>
    <td>Access remote data and services that follow VO protocols</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/VOTables.jl">JuliaAPlavin/VOTables.jl</a></td>
    <td>Read and write VOTable files</td>
  </tr>

  </tbody>
</table>
```

### Computations and Utilities

```@raw html
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
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/cosmology/index.html"><code>astropy.cosmology</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Cosmology.jl">Cosmology.jl</a></td>
    <td>Distances in the universe</td>
  </tr>

  <tr>
    <td rowspan=3>
      <a href="https://docs.astropy.org/en/stable/convolution/index.html"><code>astropy.convolution</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaImages/ImageFiltering.jl">JuliaImages/ImageFiltering.jl</a></td>
    <td>ulia implementations of multidimensional array convolution and nonlinear stencil operations</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaDSP/DSP.jl">JuliaDSP/DSP.jl</a></td>
    <td>Filter design, periodograms, window functions, and other digital signal processing functionality</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/utils/iers.html"><code>astropy.utils.iers</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/EarthOrientation.jl">EarthOrientation.jl</a></td>
    <td>Earth orientation parameters</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://docs.astropy.org/en/stable/visualization/index.html"><code>astropy.visualization</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/AstroImages.jl">AstroImages.jl</a></td>
    <td>Load, manipulate, and visualize astronomical images</td>
  </tr>
  <tr>
    <td><a href="https://github.com/sefffal/PairPlots.jl">sefffal/PairPlots.jl</a></td>
    <td>Beautiful and flexible visualizations of high dimensional data</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/SkyImages.jl">JuliaAPlavin/SkyImages.jl</a></td>
    <td>Load astronomical images of the sky and process them with convenient, general, and composable functions.</td>
  </tr>

  <tr>
    <td rowspan=3>
      <a href="https://docs.astropy.org/en/stable/stats/index.html"><code>astropy.stats</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/mileslucas/BiweightStats.jl">mileslucas/BiweightStats.jl</a></td>
    <td>Robust statistics based on the biweight transform</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaStats">JuliaStats</a></td>
    <td>Statistics and Machine Learning made easy in Julia</td>
  </tr>

  </tbody>
</table>
```

## Astropy [coordinated packages](https://www.astropy.org/affiliated/#coordinated-package-list)

```@raw html
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
    <td rowspan=2>
      <a href="https://asdf-astropy.readthedocs.io/en/latest/"><code>asdf-astropy</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/eschnett/ASDF2.jl">eschnett/ASDF2.jl</a></td>
    <td>ASDF, the Advanced Scientific Data Format</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://astropy-healpix.readthedocs.io/"><code>astropy-healpix</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/ziotom78/Healpix.jl">ziotom78/Healpix.jl</a></td>
    <td>Implementation of Healpix spherical tesselation scheme in pure Julia</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://astroquery.readthedocs.io/"><code>astroquery</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAPlavin/VirtualObservatory.jl">JuliaAPlavin/VirtualObservatory.jl</a></td>
    <td>Access remote data and services that follow VO protocols</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://ccdproc.readthedocs.io/"><code>ccdproc</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/CCDReduction.jl">CCDReduction.jl</a></td>
    <td>Common CCD image processing routines</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://photutils.readthedocs.io/"><code>photutils</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Photometry.jl">Photometry.jl</a></td>
    <td>Aperture photometry</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://astropy-regions.readthedocs.io/"><code>regions</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Photometry.jl">Photometry.jl</a></td>
    <td>Aperture photometry</td>
  </tr>

  <tr>
    <td rowspan=2>
      <a href="https://reproject.readthedocs.io/"><code>reproject</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Reproject.jl">Reproject.jl</a></td>
    <td>Astronomical image reprojection</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://specreduce.readthedocs.io/"><code>specreduce</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/ajwheeler/Korg.jl">ajwheeler/Korg.jl</a></td>
    <td>Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Spectra.jl">Spectra.jl</a></td>
    <td>Utilities for interfacing with astronomical spectra and synthetic spectra libraries</td>
  </tr>
  <tr>
    <td><a href="https://github.com/fjebaker/SpectralFitting.jl">fjebaker/SpectralFitting.jl</a></td>
    <td>✨🛰 Fast and flexible spectral fitting in Julia</td>
  </tr>

  <tr>
    <td rowspan=4>
      <a href="https://specutils.readthedocs.io/"><code>specutils</code></a>
   </td>
  </tr>
  <tr>
    <td><a href="https://github.com/ajwheeler/Korg.jl">ajwheeler/Korg.jl</a></td>
    <td>Theoretical stellar spectra from 1D model atmospheres and linelists, assuming LTE</td>
  </tr>
  <tr>
    <td><a href="https://github.com/JuliaAstro/Spectra.jl">Spectra.jl</a></td>
    <td>Utilities for interfacing with astronomical spectra and synthetic spectra libraries</td>
  </tr>
  <tr>
    <td><a href="https://github.com/fjebaker/SpectralFitting.jl">fjebaker/SpectralFitting.jl</a></td>
    <td>✨🛰 Fast and flexible spectral fitting in Julia</td>
  </tr>

  </tbody>
</table>
```
