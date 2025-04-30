# Comparison with Astropy

We highlight some of the major packages in Python's `astropy` ecosystem and their corresponding implementations in the Julia ecosystem. This is an actively evolving document, and suggested additions are welcomed.

!!! note "Affiliated/coordinated packages in Julia"
    While there is a clear demarcation between core, coordinated, and affiliated packages in Python, this is not really the case in Julia. Composability is a [main feature](https://julialang.org/) of the language, allowing for interactions between packages to occur fairly naturally. 

## Astropy [core packages](https://docs.astropy.org/en/stable/index_user_docs.html)

### Data structures and transformations

```@raw html
<table class="compare"><thead><tr><th align="left">Python</th><th align="left">Julia</th><th align="left">Description</th></tr></thead>
<tbody>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/constants/index.html"><code>astropy.constants</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://painterqubits.github.io/Unitful.jl/stable/">Unitful.jl</a></li>
<li><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></li>
<li><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">PhysicalConstants.jl</a></li>
<li><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">DynamicQuantities.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Generic units.</li>
<li>Astronomy specific units.</li>
<li>Common constants used in physics.</li>
<li>Efficient and type-stable physical quantities in Julia.</li>
</ol>
</span></td>
</tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/units/index.html"><code>astropy.units</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://painterqubits.github.io/Unitful.jl/stable/">Unitful.jl</a></li>
<li><a href="https://juliaastro.org/UnitfulAstro/stable/">UnitfulAstro.jl</a></li>
<li><a href="https://juliaphysics.github.io/PhysicalConstants.jl/stable/">PhysicalConstants.jl</a></li>
<li><a href="https://ai.damtp.cam.ac.uk/dynamicquantities/stable">DynamicQuantities.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Generic units.</li>
<li>Astronomy specific units.</li>
<li>Common constants used in physics.</li>
<li>Efficient and type-stable physical quantities in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a></p>
</span></td><td align="left"><span class="julia-value">
</span></td><td align="left"><span class="julia-value">
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/table/index.html"><code>astropy.table</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliadata.github.io/DataFrames.jl/stable/">DataFrames.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>In-memory tabular data in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/time/index.html"><code>astropy.time</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/AstroTime/stable/">AstroTime.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Astronomical time keeping in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/timeseries/index.html"><code>astropy.timeseries</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliastats.org/TimeSeries.jl/stable/">TimeSeries.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Time series toolkit for Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/coordinates/index.html"><code>astropy.coordinates</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/SkyCoords/stable/">SkyCoords.jl</a></li>
<li><a href="https://github.com/JuliaAPlavin/FlexiJoins.jl">FlexiJoins.jl</a></li>
<li><a href="https://juliaastro.org/EphemerisSources.jl/docs">EphemerisSources.jl</a></li>
<li><a href="https://juliaastro.org/SPICE/stable/">SPICE.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Astronomical coordinate systems in Julia.</li>
<li>A fresh take on joining datasets.</li>
<li>Meta package for accessing JPL HORIZONS and SPICE sources.</li>
<li>SPICE data retrieval and usage.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/wcs/index.html"><code>astropy.wcs</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/WCS/stable/">WCS.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Astronomical World Coordinate Systems library for Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/modeling/index.html"><code>astropy.modeling</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://docs.sciml.ai/NonlinearSolve/stable/">NonlinearSolve.jl</a></li>
<li><a href="https://docs.sciml.ai/Optimization/stable/">Optimization.jl</a></li>
<li><a href="http://jump.dev/JuMP.jl/">JuMP.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>High-performance and differentiation-enabled nonlinear solvers.</li>
<li>Mathematical Optimization in Julia.</li>
<li>Modeling language for Mathematical Optimization.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/uncertainty/index.html"><code>astropy.uncertainty</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaphysics.github.io/Measurements.jl/stable/">Measurements.jl</a></li>
<li><a href="https://juliastats.github.io/Distributions.jl/stable/">Distributions.jl</a></li>
<li><a href="https://github.com/JuliaAPlavin/Uncertain.jl">Uncertain.jl</a></li>
<li><a href="https://baggepinnen.github.io/MonteCarloMeasurements.jl/stable/">MonteCarloMeasurements.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Error propagation calculator and library for physical measurements.</li>
<li>A Julia package for probability distributions and associated functions.</li>
<li>Handle uncertain values with ease and performance!.</li>
<li>Propagation of distributions by Monte-Carlo sampling.</li>
</ol>
</span></td></tr>

</tbody></table>
```

### Files, I/O, and Communication

```@raw html
<table class="compare"><thead><tr><th align="left">Python</th><th align="left">Julia</th><th align="left">Description</th></tr></thead>
<tbody>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/io/fits/index.html"><code>astropy.io.fits</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/FITSIO/stable/">FITSIO.jl</a></li>
<li><a href="https://github.com/barrettp/FITS.jl">FITS.jl</a></li>
<li><a href="https://emmt.github.io/EasyFITS.jl/dev">EasyFITS.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Flexible Image Transport System (FITS) file support for Julia.</li>
<li>A Julia Flexible Image Transport System (FITS) file IO package.</li>
<li>Using FITS files made easier for Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/io/ascii/index.html"><code>astropy.io.ascii</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAPlavin/FixedWidthTables.jl">FixedWidthTables.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Read fixed width (so-called ASCII) tables.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/io/votable/index.html"><code>astropy.io.votable</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAPlavin/VOTables.jl">VOTables.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Support for the VOTable format (Virtual Observatory Table, <a href="https://www.ivoa.net/documents/VOTable/">defined</a> by <a href="https://www.ivoa.net/">IVOA</a>) in Julia.</li>
</ol>
</span></td></tr>

</tbody></table>
```

### Computations and Utilities

```@raw html
<table class="compare"><thead><tr><th align="left">Python</th><th align="left">Julia</th><th align="left">Description</th></tr></thead>
<tbody>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/cosmology/index.html"><code>astropy.cosmology</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/Cosmology/stable/">Cosmology.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Cosmology library for Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/convolution/index.html"><code>astropy.convolution</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://docs.juliadsp.org/stable/contents/">DSP.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Filter design, periodograms, window functions, and other digital signal processing functionality.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/utils/iers.html"><code>astropy.utils.iers</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.github.io/EarthOrientation/stable">EarthOrientation.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Calculate Earth orientation parameters from IERS tables in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/visualization/index.html"><code>astropy.visualization</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/AstroImages/stable/">AstroImages.jl</a></li>
<li><a href="https://sefffal.github.io/PairPlots.jl/dev/">PairPlots.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Visualization of astronomical images.</li>
<li>Beautiful and flexible vizualizations of high dimensional data.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://docs.astropy.org/en/stable/stats/index.html"><code>astropy.stats</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliastats.org/">JuliaStats</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Statistics and Machine Learning made easy in Julia.</li>
</ol>
</span></td></tr>

</tbody></table>
```

## Astropy [coordinated packages](https://www.astropy.org/affiliated/#coordinated-package-list)

```@raw html
<table class="compare"><thead><tr><th align="left">Python</th><th align="left">Julia</th><th align="left">Description</th></tr></thead>
<tbody>

<tr><td align="left"><span class="julia-value"><p><a href="https://asdf-astropy.readthedocs.io/en/latest/"><code>asdf-astropy</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/eschnett/ASDF2.jl">ASDF2.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>A new <a href="https://asdf-standard.readthedocs.io/en/latest/index.html">Advanced Scientific Data Format (ASDF)</a> package, written in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://astropy-healpix.readthedocs.io/"><code>astropy-healpix</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://ziotom78.github.io/Healpix.jl/stable">Healpix.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Healpix library written in Julia.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://astroquery.readthedocs.io/"><code>astroquery</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAPlavin/VirtualObservatory.jl">VirtualObservatory.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Access remote data and services that follow Virtual Observatory (VO, <a href="https://www.ivoa.net/">https://www.ivoa.net/</a>) protocols.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://ccdproc.readthedocs.io/"><code>ccdproc</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.github.io/CCDReduction/stable">CCDReduction.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>A package for performing CCD data reduction.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://photutils.readthedocs.io/"><code>photutils</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://juliaastro.org/Photometry/stable">Photometry.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Utilities for characterizing sources in astronomical images.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://astropy-regions.readthedocs.io/"><code>regions</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://reproject.readthedocs.io/"><code>reproject</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAstro/Reproject.jl">Reproject.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Julia-based Astronomical image reprojection.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://specreduce.readthedocs.io/"><code>specreduce</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAstro/Spectra.jl">Spectra.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Utilities for interfacing with astronomical spectra and synthetic spectra libraries.</li>
</ol>
</span></td></tr>

<tr><td align="left"><span class="julia-value"><p><a href="https://specutils.readthedocs.io/"><code>specutils</code></a></p>
</span></td><td align="left"><span class="julia-value"><ol>
<li><a href="https://github.com/JuliaAstro/Spectra.jl">Spectra.jl</a></li>
</ol>
</span></td><td align="left"><span class="julia-value"><ol>
<li>Utilities for interfacing with astronomical spectra and synthetic spectra libraries.</li>
</ol>
</span></td></tr>

</tbody></table>
```
