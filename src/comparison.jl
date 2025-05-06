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

function page_compare(t)
    fpath = joinpath(dirname(@__DIR__), "docs", "src", "comparison.md")

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
        write(io, package_section(t, "astropy.table", "https://docs.astropy.org/en/stable/table/index.html"), "\n")
        write(io, package_section(t, "astropy.time", "https://docs.astropy.org/en/stable/time/index.html"), "\n")
        write(io, package_section(t, "astropy.timeseries", "https://docs.astropy.org/en/stable/timeseries/index.html"), "\n")
        write(io, package_section(t, "astropy.coordinates", "https://docs.astropy.org/en/stable/coordinates/index.html"), "\n")
        write(io, package_section(t, "astropy.wcs", "https://docs.astropy.org/en/stable/wcs/index.html"), "\n")
        write(io, package_section(t, "astropy.modeling", "https://docs.astropy.org/en/stable/modeling/index.html"), "\n")
        write(io, package_section(t, "astropy.uncertainty", "https://docs.astropy.org/en/stable/uncertainty/index.html"), "\n")

        write(io, "</table>", "\n")

        write(io, "```", "\n")

        write(io, """
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
          <tbody>\n
        """)

        write(io, package_section(t, "astropy.io.fits", "https://docs.astropy.org/en/stable/io/fits/index.html"), "\n")
        write(io, package_section(t, "astropy.io.ascii", "https://docs.astropy.org/en/stable/io/ascii/index.html"), "\n")
        write(io, package_section(t, "astropy.io.votable", "https://docs.astropy.org/en/stable/io/votable/index.html"), "\n")

        write(io, "</table>", "\n")

        write(io, "```", "\n")

        write(io, """
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
          <tbody>\n
        """)

        write(io, package_section(t, "astropy.cosmology", "https://docs.astropy.org/en/stable/cosmology/index.html"), "\n")
        write(io, package_section(t, "astropy.convolution", "https://docs.astropy.org/en/stable/convolution/index.html"), "\n")
        write(io, package_section(t, "astropy.utils.iers", "https://docs.astropy.org/en/stable/utils/iers.html"), "\n")
        write(io, package_section(t, "astropy.visualization", "https://docs.astropy.org/en/stable/visualization/index.html"), "\n")
        write(io, package_section(t, "astropy.stats", "https://docs.astropy.org/en/stable/stats/index.html"), "\n")

        write(io, "</table>", "\n")

        write(io, "```", "\n")

        write(io, """
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
          <tbody>\n
        """)

        write(io, package_section(t, "asdf-astropy", "https://asdf-astropy.readthedocs.io/en/latest/"), "\n")
        write(io, package_section(t, "astropy-healpix", "https://astropy-healpix.readthedocs.io/"), "\n")
        write(io, package_section(t, "astroquery", "https://astroquery.readthedocs.io/"), "\n")
        write(io, package_section(t, "ccdproc", "https://ccdproc.readthedocs.io/"), "\n")
        write(io, package_section(t, "photutils", "https://photutils.readthedocs.io/"), "\n")
        write(io, package_section(t, "regions", "https://astropy-regions.readthedocs.io/"), "\n")
        write(io, package_section(t, "reproject", "https://reproject.readthedocs.io/"), "\n")
        write(io, package_section(t, "specreduce", "https://specreduce.readthedocs.io/"), "\n")
        write(io, package_section(t, "specutils", "https://specutils.readthedocs.io/"), "\n")

        write(io, "</table>", "\n")

        write(io, "```", "\n")
    end
end
