const ECOSYSTEM_HEADER = """
# [Package Ecosystem](@id eco)

The joy of our community is the many astronomy and astrophysics packages available for wide use. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development. This page serves as the index of packages available in the dropdown navigation menus above.

---

""";

# Prefix packages outside of JuliaAstro with their org, e.g., JuliaSpace/SatelliteToolbox.jl
function display_name(name, p)
    url_parts = split(p["repo"], '/')
    org_name = url_parts[4]
    # Org-level entries (e.g., https://github.com/JuliaStats) are left as is
    if lowercase(org_name) == "juliaastro" || length(url_parts) < 5
        return name
    end
    return string(org_name, '/', name)
end

function page_ecosystem(ecosystem)
    fpath = joinpath(dirname(@__DIR__), "docs", "src", "ecosystem.md")
    open(fpath, "w") do io
        write(io, ECOSYSTEM_HEADER)
        for (highlevel, sublevels) in ecosystem
            write(io, "## ", highlevel, "\n\n")
            for (sublevel, packages) in sublevels
                write(io, "### ", sublevel, "\n\n")
                for (name, p) in packages
                    write(io, "#### ", display_name(name, p), "\n\n")
                    write(io, "[💻 Repository](", p["repo"], ") | ")
                    write(io, "[📘 Documentation](", p["doc"], ")\n\n")
                    write(io, "**", p["tagline"], "**", "\n\n")
                    write(io, p["descr"], "\n\n")
                end
                write(io, "---\n\n")
            end
        end
    end
end
