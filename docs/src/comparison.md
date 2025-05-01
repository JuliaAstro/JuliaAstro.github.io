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
      <td>
        <a href="https://docs.astropy.org/en/stable/constants/index.html"><code>astropy.constants</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">SymbolicML/DynamicQuantities.jl</a></li>
          <li><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">JuliaPhysics/PhysicalConstants.jl</a></li>
          <li><a href="https://painterqubits.github.io/Unitful.jl/stable/">PainterQubits/Unitful.jl</a></li>
          <li><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Efficient and type-stable physical quantities in Julia.</li>
          <li>Common constants used in physics.</li>
          <li>Generic units.</li>
          <li>Astronomy specific units.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/units/index.html"><code>astropy.units</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">SymbolicML/DynamicQuantities.jl</a></li>
          <li><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">JuliaPhysics/PhysicalConstants.jl</a></li>
          <li><a href="https://painterqubits.github.io/Unitful.jl/stable/">Unitful.jl</a></li>
          <li><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Efficient and type-stable physical quantities in Julia.</li>
          <li>Common constants used in physics.</li>
          <li>Generic units.</li>
          <li>Astronomy specific units.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
      </td>
      <td>
        <ol>
          <li></li>
        </ol>
      </td>
      <td>
        <ol>
          <li></li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/table/index.html"><code>astropy.table</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliadata.github.io/DataFrames.jl/stable/">JuliaData/DataFrames.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>In-memory tabular data in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/time/index.html"><code>astropy.time</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/AstroTime/stable/">AstroTime.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Astronomical time keeping in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/timeseries/index.html"><code>astropy.timeseries</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliastats.org/TimeSeries.jl/stable/">JuliaStats/TimeSeries.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Time series toolkit for Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/coordinates/index.html"><code>astropy.coordinates</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/EphemerisSources.jl/docs">EphemerisSources.jl</a></li>
          <li><a href="https://github.com/JuliaAPlavin/FlexiJoins.jl">JuliaAPlavin/FlexiJoins.jl</a></li>
          <li><a href="https://juliaastro.org/SkyCoords/stable/">SkyCoords.jl</a></li>
          <li><a href="https://juliaastro.org/SPICE/stable/">SPICE.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Meta package for accessing JPL HORIZONS and SPICE sources.</li>
          <li>A fresh take on joining datasets.</li>
          <li>Astronomical coordinate systems in Julia.</li>
          <li>SPICE data retrieval and usage.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/wcs/index.html"><code>astropy.wcs</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/WCS/stable/">WCS.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Astronomical World Coordinate Systems library for Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/modeling/index.html"><code>astropy.modeling</code></a>
      </td>
      <td>
        <ol>
          <li><a href="http://jump.dev/JuMP.jl/">jump-dev/JuMP.jl</a></li>
          <li><a href="https://docs.sciml.ai/NonlinearSolve/stable/">SciML/NonlinearSolve.jl</a></li>
          <li><a href="https://docs.sciml.ai/Optimization/stable/">SciML/Optimization.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Modeling language for Mathematical Optimization.</li>
          <li>High-performance and differentiation-enabled nonlinear solvers.</li>
          <li>Mathematical Optimization in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/uncertainty/index.html"><code>astropy.uncertainty</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliastats.github.io/Distributions.jl/stable/">JuliaStats/Distributions.jl</a></li>
          <li><a href="https://juliaphysics.github.io/Measurements.jl/stable/">JuliaPhysics/Measurements.jl</a></li>
          <li><a href="https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/">baggepinnen/MonteCarloMeasurements.jl</a></li>
          <li><a href="https://github.com/JuliaAPlavin/Uncertain.jl">JuliaAPlavin/Uncertain.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>A Julia package for probability distributions and associated functions.</li>
          <li>Error propagation calculator and library for physical measurements.</li>
          <li>Propagation of distributions by Monte-Carlo sampling.</li>
          <li>Handle uncertain values with ease and performance!</li>
        </ol>
      </td>
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
      <td>
        <a href="https://docs.astropy.org/en/stable/io/fits/index.html"><code>astropy.io.fits</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://emmt.github.io/EasyFITS.jl/dev">emmt/EasyFITS.jl</a></li>
          <li><a href="https://github.com/barrettp/FITS.jl">barrettp/FITS.jl</a></li>
          <li><a href="https://juliaastro.org/FITSIO/stable/">FITSIO.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Using FITS files made easier for Julia.</li>
          <li>A Julia Flexible Image Transport System (FITS) file IO package.</li>
          <li>Flexible Image Transport System (FITS) file support for Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/io/ascii/index.html"><code>astropy.io.ascii</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://github.com/JuliaAPlavin/FixedWidthTables.jl">JuliaAPlavin/FixedWidthTables.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Read fixed width (so-called ASCII) tables.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/io/votable/index.html"><code>astropy.io.votable</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://github.com/JuliaAPlavin/VOTables.jl">JuliaAPlavin/VOTables.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Support for the VOTable format (Virtual Observatory Table, <a href="https://www.ivoa.net/documents/VOTable/">defined</a> by <a href="https://www.ivoa.net/">IVOA</a>) in Julia.</li>
        </ol>
      </td>
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
      <td>
        <a href="https://docs.astropy.org/en/stable/cosmology/index.html"><code>astropy.cosmology</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/Cosmology/stable/">Cosmology.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Cosmology library for Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/convolution/index.html"><code>astropy.convolution</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://docs.juliadsp.org/stable/">JuliaDSP/DSP.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Filter design, periodograms, window functions, and other digital signal processing functionality.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/utils/iers.html"><code>astropy.utils.iers</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/EarthOrientation/stable/">EarthOrientation.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Calculate Earth orientation parameters from IERS tables in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/visualization/index.html"><code>astropy.visualization</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/AstroImages/stable/">AstroImages.jl</a></li>
          <li><a href="https://sefffal.github.io/PairPlots.jl/dev/">/sefffal/PairPlots.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Visualization of astronomical images.</li>
          <li>Beautiful and flexible vizualizations of high dimensional data.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://docs.astropy.org/en/stable/stats/index.html"><code>astropy.stats</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliastats.org/">JuliaStats</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Statistics and Machine Learning made easy in Julia.</li>
        </ol>
      </td>
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
      <td>
        <a href="https://asdf-astropy.readthedocs.io/en/latest/"><code>asdf-astropy</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://github.com/eschnett/ASDF2.jl">eschnett/ASDF2.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>A new <a href="https://asdf-standard.readthedocs.io/en/latest/index.html">Advanced Scientific Data Format (ASDF)</a> package, written in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://astropy-healpix.readthedocs.io/"><code>astropy-healpix</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://ziotom78.github.io/Healpix.jl/stable">ziotom78/Healpix.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Healpix library written in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://astroquery.readthedocs.io/"><code>astroquery</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://github.com/JuliaAPlavin/VirtualObservatory.jl">JuliaAPlavin/VirtualObservatory.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Access remote data and services that follow Virtual Observatory (VO, <a href="https://www.ivoa.net/">https://www.ivoa.net/</a>) protocols.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://ccdproc.readthedocs.io/"><code>ccdproc</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/CCDReduction/stable/">CCDReduction.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>A package for performing CCD data reduction.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://photutils.readthedocs.io/"><code>photutils</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/Photometry/stable">Photometry.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Utilities for characterizing sources in astronomical images.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://astropy-regions.readthedocs.io/"><code>regions</code></a>
      </td>
      <td>
        <ol>
          <li></li>
        </ol>
      </td>
      <td>
        <ol>
          <li></li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://reproject.readthedocs.io/"><code>reproject</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://github.com/JuliaAstro/Reproject.jl">Reproject.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Julia-based Astronomical image reprojection.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://specreduce.readthedocs.io/"><code>specreduce</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/Spectra/stable/">Spectra.jl</a></li>
          <li><a href="https://fjebaker.github.io/SpectralFitting.jl/dev/">fjebaker/SpectralFitting.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Utilities for interfacing with astronomical spectra and synthetic spectra libraries.</li>
          <li>✨🛰 Fast and flexible spectral fitting in Julia.</li>
        </ol>
      </td>
    </tr>

    <tr>
      <td>
        <a href="https://specutils.readthedocs.io/"><code>specutils</code></a>
      </td>
      <td>
        <ol>
          <li><a href="https://juliaastro.org/Spectra/stable/">Spectra.jl</a></li>
          <li><a href="https://fjebaker.github.io/SpectralFitting.jl/dev/">fjebaker/SpectralFitting.jl</a></li>
        </ol>
      </td>
      <td>
        <ol>
          <li>Utilities for interfacing with astronomical spectra and synthetic spectra libraries.</li>
          <li>✨🛰 Fast and flexible spectral fitting in Julia.</li>
        </ol>
      </td>
    </tr>

  </tbody>
</table>
```
