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
  <td><a href="https://github.com/JuliaAstro/UnitfulAstro.jl">UnitfulAstro.jl</a></td>
  <td>Astronomical units and things</td>
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
  <td>Astronomical units and things</td>
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
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
   </td>
  </tr>
<tr>
  <td><a href="https://github.com/rafaqz/DimensionalData.jl">rafaqz/DimensionalData.jl</a></td>
  <td>Named dimensions and indexing for julia arrays and other data</td>
</tr>

  <tr>
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/table/index.html"><code>astropy.table</code></a>
   </td>
  </tr>
<tr>
  <td><a href="https://github.com/JuliaData/DataFrames.jl">JuliaData/DataFrames.jl</a></td>
  <td>In-memory tabular data in Julia</td>
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
    <td rowspan=2>
      <a href="https://docs.astropy.org/en/stable/timeseries/index.html"><code>astropy.timeseries</code></a>
   </td>
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
  <td><a href="https://github.com/JuliaAstro/SkyCoords.jl">SkyCoords.jl</a></td>
  <td>Astronomical coordinate systems</td>
</tr>
<tr>
  <td><a href="https://github.com/JuliaAstro/SPICE.jl">SPICE.jl</a></td>
  <td>SPICE data retrieval and usage</td>
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
  <td><a href="https://github.com/JuliaStats/Distributions.jl">JuliaStats/Distributions.jl</a></td>
  <td>A Julia package for probability distributions and associated functions</td>
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
  <td></td>
</tr>

</table>
```