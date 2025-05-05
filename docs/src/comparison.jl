t = JuliaAstroDocs.ecosystem()

package_row(p) = """
<tr>
  <td><a href="$(p.repo)">$(p.name)</a></td>
  <td>$(p.tagline)</td>
</tr>
"""

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

    JuliaAstroDocs.stake!(io)
end

fpath = joinpath(dirname(@__DIR__), "src", "comparison.md")

open(fpath, "w") do io
    write(io, """
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
      <tbody>\n
    """)

    write(io, package_section(t, "astropy.constants", "https://docs.astropy.org/en/stable/constants/index.html"), "\n")

    write(io, package_section(t, "astropy.units", "https://docs.astropy.org/en/stable/units/index.html"), "\n")

    write(io, package_section(t, "astropy.nddata", "https://docs.astropy.org/en/stable/nddata/index.html"), "\n")

    write(io, "</table>", "\n")

    write(io, "```")

    write(io, """
    """)
end
#### Files, I/O, and Communication
#
#```@raw html
#```
#
#### Computations and Utilities
#
#```@raw html
#```
#
### Astropy [coordinated packages](https://www.astropy.org/affiliated/#coordinated-package-list)
#
#```@raw html
#```
#
