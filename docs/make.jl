using Revise, MultiDocumenter, Documenter, DocumenterInterLinks
using LibGit2, Pkg, TOML, UUIDs, Downloads

Revise.revise()

import JuliaAstroDocs

# Prefer online docs, use local as fallback
links = InterLinks(
    "AstroImages" => (
        "https://juliaastro.org/AstroImages/dev/",
        "https://juliaastro.org/AstroImages/dev/objects.inv",
        joinpath(@__DIR__, "clones", "AstroImages", "dev", "objects.inv"),
    ),
    "AstroLib" => (
        "https://juliaastro.org/AstroLib/stable/",
        "https://juliaastro.org/AstroLib/stable/objects.inv",
        joinpath(@__DIR__, "clones", "AstroLib", "dev", "objects.inv"),
    )
)

# This make file compiles the documentation for the JuliaAstro website.
# It consists of the usual documenter structure, but also follows the approach
# of the SciML docs page https://github.com/SciML/SciMLDocs/blob/main/docs/make.jl
# by generating nested documentation for packages under the JuliaAstro organization.
# That way, docs for all packages are browsable and searchable in one place!

clonedir = ("--temp" in ARGS) ? mktempdir(; cleanup=false) : joinpath(@__DIR__, "clones")
outpath =  ("--temp" in ARGS) ? mktempdir(; cleanup=false) : joinpath(@__DIR__, "build")

@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

@info "Building MultiDocumenter site for JuliaAstro"
mathengine = MathJax3(Dict(
    :loader => Dict("load" => ["[tex]/require", "[tex]/mathtools"]),
    :tex => Dict(
        "inlineMath" => [["\$", "\$"], ["\\(", "\\)"]],
        "packages" => ["base", "ams", "autoload", "mathtools", "require"],
    ),
))

makedocs(
    sitename = "JuliaAstro",
    authors = "Julia Astro Contributors",
    clean = true,
    doctest = false,
    format = Documenter.HTML(;
        mathengine,
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://JuliaAstro.org/",
        assets = String[
            "assets/styles.css",
            "assets/favicon.ico",
        ],
        inventory_version = "",
        edit_link = "source",
    ),
    pages = [
        "Home" => "index.md",
        "Tutorials" => [
            "tutorials/index.md",
            "General" => [
                "tutorials/jwst-image-scale-bar.md",
                "tutorials/tabular-data.md",
                "tutorials/curve-fit.md",
            ],
        ],
        "Ecosystem" => "ecosystem.md",
        "Comparison with Astropy" => "comparison.md",
    ],
    warnonly = [:missing_docs],
    plugins = [links],
)

@info "Building aggregate JuliaAstro site"
function generate_multidoc_refs(p; clonedir=joinpath(@__DIR__, "clones"))
    package_name = string(chopsuffix(p.name, ".jl"))
    multidoc_type = if any(occursin.(("stable", "dev"), p.doc)) && startswith(p.doc, "https://juliaastro")
            "MultiDocRef"
        else
            "Link"
        end

    if multidoc_type == "MultiDocRef"
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, package_name),
            path = package_name,
            name = package_name,
            giturl = p.repo,
        )
    else
        MultiDocumenter.Link(
            package_name,
            p.doc,
        )
    end
end

docs = [
    # We also add JuliaAstro's own generated pages
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build"),
        path = "home",
        name = "Home",
        fix_canonical_url = false,
    ),
    map(pairs(JuliaAstroDocs.ecosystem)) do (highlevel, packages)
        MultiDocumenter.DropdownNav(
            highlevel,
            collect(generate_multidoc_refs.(packages))
        )
    end...
]

MultiDocumenter.make(
    outpath,
    docs;
    assets_dir = "docs/src/assets",
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    ),
    rootpath = "/",
    canonical_domain = "https://JuliaAstro.org/",
    brand_image = MultiDocumenter.BrandImage(".", joinpath("assets", "logo.svg")),
    sitemap = true,
)
@info "Aggregate build done"

# Download logo
# assets_dir = joinpath(outpath, "assets")
# mkpath(assets_dir)
# Downloads.download(
#     "https://raw.githubusercontent.com/JuliaAstro/JuliaAstro.github.io/refs/heads/source/docs/src/assets/logo.svg",
#     joinpath(assets_dir, "logo.svg");
#     verbose = true,
# )

@info "Deploying docs"
deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source",
    devurl = "home",
    cname = "juliaastro.org",
    versions = nothing,
)
@info "Deploy complete"
