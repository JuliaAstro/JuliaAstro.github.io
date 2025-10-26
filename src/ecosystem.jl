const ECOSYSTEM_HEADER = """
# [Package Ecosystem](@id eco)

The joy of our community is the many astronomy and astrophysics packages available for wide use. Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development. This page serves as the index of packages available in the dropdown navigation menus above.

---

""";

function page_ecosystem(ecosystem)
    fpath = joinpath(dirname(@__DIR__), "docs", "src", "ecosystem.md")
    open(fpath, "w") do io
        write(io, ECOSYSTEM_HEADER)
        for (highlevel, sublevels) in ecosystem
            write(io, "## ", highlevel, "\n\n")
            for (sublevel, packages) in sublevels
                write(io, "### ", sublevel, "\n\n")
                for p in packages
                    org_name = split(p.repo, '/')[4]
                    write(io, "#### ", p.name, "\n\n")
                    write(io, "[💻 Repository](", p.repo, ") | ")
                    write(io, "[📘 Documentation](", p.doc, ")")
                    write(io, " | `", org_name, "`\n\n")
                    write(io, "**", p.tagline, "**", "\n\n")
                    write(io, p.descr, "\n\n")
                end
                write(io, "---\n\n")
            end
        end
    end
end
