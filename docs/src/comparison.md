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
    <td rowspan=1>
      <a href="https://docs.astropy.org/en/stable/nddata/index.html"><code>astropy.nddata</code></a>
   </td>
  </tr>

</table>
```