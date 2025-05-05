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
      <td rowspan="4">
        <a href="https://docs.astropy.org/en/stable/constants/index.html"><code>astropy.constants</code></a>
      </td>

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


    <tr>
      <td rowspan="4">
        <a href="https://docs.astropy.org/en/stable/units/index.html"><code>astropy.units</code></a>
      </td>

      <td><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">SymbolicML/DynamicQuantities.jl</a></td>
      <td>Efficient and type-stable physical quantities in Julia.</td>
    </tr>
    <tr>
      <td><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">JuliaPhysics/PhysicalConstants.jl</a></td>
      <td>Common constants used in physics.</td>
    </tr>
    <tr>
      <td><a href="https://painterqubits.github.io/Unitful.jl/stable/">Unitful.jl</a></td>
      <td>Generic units.</td>
    </tr>
    <tr>
      <td><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></td>
      <td>Astronomy specific units.</td>
    </tr>


    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
      </td>
      <td></td>
      <td></td>
    </tr>


    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/table/index.html"><code>astropy.table</code></a>
      </td>

      <td><a href="https://juliadata.github.io/DataFrames.jl/stable/">JuliaData/DataFrames.jl</a></td>
      <td>In-memory tabular data in Julia.</td>
    </tr>


    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/time/index.html"><code>astropy.time</code></a>
      </td>

      <td><a href="https://juliaastro.org/AstroTime/stable/">AstroTime.jl</a></td>
      <td>Astronomical time keeping in Julia.</td>
    </tr>


    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/timeseries/index.html"><code>astropy.timeseries</code></a>
      </td>

      <td><a href="https://juliastats.org/TimeSeries.jl/stable/">JuliaStats/TimeSeries.jl</a></td>
      <td>Time series toolkit for Julia.</td>
    </tr>


    <tr>
      <td rowspan="4">
        <a href="https://docs.astropy.org/en/stable/coordinates/index.html"><code>astropy.coordinates</code></a>
      </td>

      <td><a href="https://juliaastro.org/EphemerisSources.jl/docs">EphemerisSources.jl</a></td>
      <td>Meta package for accessing JPL HORIZONS and SPICE sources.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/JuliaAPlavin/FlexiJoins.jl">JuliaAPlavin/FlexiJoins.jl</a></td>
      <td>A fresh take on joining datasets.</td>
    </tr>
    <tr>
      <td><a href="https://juliaastro.org/SkyCoords/stable/">SkyCoords.jl</a></td>
      <td>Astronomical coordinate systems in Julia.</td>
    </tr>
    <tr>
      <td><a href="https://juliaastro.org/SPICE/stable/">SPICE.jl</a></td>
      <td>SPICE data retrieval and usage.</td>
    </tr>


    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/wcs/index.html"><code>astropy.wcs</code></a>
      </td>

      <td><a href="https://juliaastro.org/WCS/stable/">WCS.jl</a></td>
      <td>Astronomical World Coordinate Systems library for Julia.</td>
    </tr>


    <tr>
      <td rowspan="3">
        <a href="https://docs.astropy.org/en/stable/modeling/index.html"><code>astropy.modeling</code></a>
      </td>

      <td><a href="http://jump.dev/JuMP.jl/">jump-dev/JuMP.jl</a></td>
      <td>Modeling language for Mathematical Optimization.</td>
    </tr>
    <tr>
      <td><a href="https://docs.sciml.ai/NonlinearSolve/stable/">SciML/NonlinearSolve.jl</a></td>
      <td>High-performance and differentiation-enabled nonlinear solvers.</td>
    </tr>
    <tr>
      <td><a href="https://docs.sciml.ai/Optimization/stable/">SciML/Optimization.jl</a></td>
      <td>Mathematical Optimization in Julia.</td>
    </tr>

    <tr>
      <td rowspan="4">
        <a href="https://docs.astropy.org/en/stable/uncertainty/index.html"><code>astropy.uncertainty</code></a>
      </td>

      <td><a href="https://juliastats.github.io/Distributions.jl/stable/">JuliaStats/Distributions.jl</a></td>
      <td>A Julia package for probability distributions and associated functions.</td>
    </tr>
    <tr>
      <td><a href="https://juliaphysics.github.io/Measurements.jl/stable/">JuliaPhysics/Measurements.jl</a></td>
      <td>Error propagation calculator and library for physical measurements.</td>
    </tr>
    <tr>
      <td><a href="https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/">baggepinnen/MonteCarloMeasurements.jl</a></td>
      <td>Propagation of distributions by Monte-Carlo sampling.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/JuliaAPlavin/Uncertain.jl">JuliaAPlavin/Uncertain.jl</a></td>
      <td>Handle uncertain values with ease and performance!</td>
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
      <td rowspan="3">
        <a href="https://docs.astropy.org/en/stable/io/fits/index.html"><code>astropy.io.fits</code></a>
      </td>

      <td><a href="https://emmt.github.io/EasyFITS.jl/dev">emmt/EasyFITS.jl</a></td>
      <td>Using FITS files made easier for Julia.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/barrettp/FITS.jl">barrettp/FITS.jl</a></td>
      <td>A Julia Flexible Image Transport System (FITS) file IO package.</td>
    </tr>
    <tr>
      <td><a href="https://juliaastro.org/FITSIO/stable/">FITSIO.jl</a></td>
      <td>Flexible Image Transport System (FITS) file support for Julia.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/io/ascii/index.html"><code>astropy.io.ascii</code></a>
      </td>

      <td><a href="https://github.com/JuliaAPlavin/FixedWidthTables.jl">JuliaAPlavin/FixedWidthTables.jl</a></td>
      <td>Read fixed width (so-called ASCII) tables.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/io/votable/index.html"><code>astropy.io.votable</code></a>
      </td>

      <td><a href="https://github.com/JuliaAPlavin/VOTables.jl">JuliaAPlavin/VOTables.jl</a></td>
      <td>Support for the VOTable format (Virtual Observatory Table, <a href="https://www.ivoa.net/documents/VOTable/">defined</a> by <a href="https://www.ivoa.net/">IVOA</a>) in Julia.</td>
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
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/cosmology/index.html"><code>astropy.cosmology</code></a>
      </td>

      <td><a href="https://juliaastro.org/Cosmology/stable/">Cosmology.jl</a></td>
      <td>Cosmology library for Julia.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/convolution/index.html"><code>astropy.convolution</code></a>
      </td>

      <td><a href="https://docs.juliadsp.org/stable/">JuliaDSP/DSP.jl</a></td>
      <td>Filter design, periodograms, window functions, and other digital signal processing functionality.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/utils/iers.html"><code>astropy.utils.iers</code></a>
      </td>

      <td><a href="https://juliaastro.org/EarthOrientation/stable/">EarthOrientation.jl</a></td>
      <td>Calculate Earth orientation parameters from IERS tables in Julia.</td>
    </tr>

    <tr>
      <td rowspan="2">
        <a href="https://docs.astropy.org/en/stable/visualization/index.html"><code>astropy.visualization</code></a>
      </td>

      <td><a href="https://juliaastro.org/AstroImages/stable/">AstroImages.jl</a></td>
      <td>Visualization of astronomical images.</td>
    </tr>
    <tr>
      <td><a href="https://sefffal.github.io/PairPlots.jl/dev/">sefffal/PairPlots.jl</a></td>
      <td>Beautiful and flexible vizualizations of high dimensional data.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://docs.astropy.org/en/stable/stats/index.html"><code>astropy.stats</code></a>
      </td>

      <td><a href="https://juliastats.org/">JuliaStats</a></td>
      <td>Statistics and Machine Learning made easy in Julia.</td>
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
      <td rowspan="1">
        <a href="https://asdf-astropy.readthedocs.io/en/latest/"><code>asdf-astropy</code></a>
      </td>

      <td><a href="https://github.com/eschnett/ASDF2.jl">eschnett/ASDF2.jl</a></td>
      <td>A new <a href="https://asdf-standard.readthedocs.io/en/latest/index.html">Advanced Scientific Data Format (ASDF)</a> package, written in Julia.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://astropy-healpix.readthedocs.io/"><code>astropy-healpix</code></a>
      </td>

      <td><a href="https://ziotom78.github.io/Healpix.jl/stable">ziotom78/Healpix.jl</a></td>
      <td>Healpix library written in Julia.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://astroquery.readthedocs.io/"><code>astroquery</code></a>
      </td>

      <td><a href="https://github.com/JuliaAPlavin/VirtualObservatory.jl">JuliaAPlavin/VirtualObservatory.jl</a></td>
      <td>Access remote data and services that follow Virtual Observatory (VO, <a href="https://www.ivoa.net/">https://www.ivoa.net/</a>) protocols.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://ccdproc.readthedocs.io/"><code>ccdproc</code></a>
      </td>

      <td><a href="https://juliaastro.org/CCDReduction/stable/">CCDReduction.jl</a></td>
      <td>A package for performing CCD data reduction.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://photutils.readthedocs.io/"><code>photutils</code></a>
      </td>

      <td><a href="https://juliaastro.org/Photometry/stable">Photometry.jl</a></td>
      <td>Utilities for characterizing sources in astronomical images.</td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://astropy-regions.readthedocs.io/"><code>regions</code></a>
      </td>

      <td></td>
      <td></td>
    </tr>

    <tr>
      <td rowspan="1">
        <a href="https://reproject.readthedocs.io/"><code>reproject</code></a>
      </td>

      <td><a href="https://github.com/JuliaAstro/Reproject.jl">Reproject.jl</a></td>
      <td>Julia-based Astronomical image reprojection.</td>
    </tr>

    <tr>
      <td rowspan="2">
        <a href="https://specreduce.readthedocs.io/"><code>specreduce</code></a>,
        <a href="https://specutils.readthedocs.io/"><code>specutils</code></a>
      </td>

      <td><a href="https://juliaastro.org/Spectra/stable/">Spectra.jl</a></td>
      <td>Utilities for interfacing with astronomical spectra and synthetic spectra libraries.</td>
    </tr>
    <tr>
      <td><a href="https://fjebaker.github.io/SpectralFitting.jl/dev/">fjebaker/SpectralFitting.jl</a></td>
      <td>✨🛰 Fast and flexible spectral fitting in Julia.</td>
    </tr>

  </tbody>
</table>
```
