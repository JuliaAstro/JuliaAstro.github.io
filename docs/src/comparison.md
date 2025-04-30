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
| [`photutils`](https://photutils.readthedocs.io/) | [Photometry.jl](https://juliaastro.org/Photometry/stable) | Utilities for characterizing sources in astronomical images |
| [`regions`](https://astropy-regions.readthedocs.io/) | | |
| [`reproject`](https://reproject.readthedocs.io/) | [Reproject.jl](https://github.com/JuliaAstro/Reproject.jl) | Julia-based Astronomical image reprojection |
| [`specreduce`](https://specreduce.readthedocs.io/) | [Spectra.jl](https://github.com/JuliaAstro/Spectra.jl) | Utilities for interfacing with astronomical spectra and synthetic spectra libraries |
| [`specutils`](https://specutils.readthedocs.io/) | [Spectra.jl](https://github.com/JuliaAstro/Spectra.jl) | Utilities for interfacing with astronomical spectra and synthetic spectra libraries |
