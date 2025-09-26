using Revise, MultiDocumenter, Documenter, DocumenterInterLinks, DemoCards
using LibGit2, Pkg, TOML, UUIDs, Downloads, Glob

Revise.revise()

import JuliaAstroDocs

ecosystem = JuliaAstroDocs.ecosystem()
ecosystem_t = JuliaAstroDocs.ecosystem_t()

# Sync ecosystem.md
JuliaAstroDocs.page_ecosystem(ecosystem)

# Sync comparison.md
JuliaAstroDocs.page_compare(ecosystem_t)

# Aggregate documentation location
clonedir = ("--temp" in ARGS) ? mktempdir(; cleanup=false) : joinpath(@__DIR__, "clones")
# Build location
outpath =  ("--temp" in ARGS) ? mktempdir(; cleanup=false) : joinpath(@__DIR__, "build")

# Prefer online docs, use local as fallback
links = InterLinks(
    "AstroImages" => (
        "https://juliaastro.org/AstroImages/stable/",
        "https://juliaastro.org/AstroImages/stable/objects.inv",
        joinpath(clonedir, "AstroImages", "stable", "objects.inv"),
    ),
    "AstroLib" => (
        "https://juliaastro.org/AstroLib/stable/",
        "https://juliaastro.org/AstroLib/stable/objects.inv",
        joinpath(clonedir, "AstroLib", "stable", "objects.inv"),
    )
)

# Case studies
case_studies, postprocess_cb, case_studies_assets = makedemos("case_studies")

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

@info "Beginning main build for JuliaAstro MultiDocumenter site"
makedocs(
    sitename = "JuliaAstro",
    authors = "Julia Astro Contributors",
    clean = true,
    doctest = false,
    format = Documenter.HTML(;
        mathengine,
        prettyurls = true,
        canonical = "https://JuliaAstro.org/",
        assets = String[
            "assets/styles.css",
            "assets/favicon.ico",
            case_studies_assets,
        ],
        inventory_version = "",
        edit_link = "main",
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
        "Package Ecosystem" => "ecosystem.md",
        case_studies,
        "Comparison with Astropy" => "comparison.md",
        "Community" => [
            "community/juliaastro_community.md",
            "community/governance.md",
        ],
    ],
    warnonly = [:missing_docs],
    plugins = [links],
)
@info "Initial build complete"

postprocess_cb()

# Differentiate between pure Julia and wrapper packages
wrapper_packages = [
    "torrance/Casacore",
    "CFITSIO",
    "JuliaAPlavin/Difmap",
    "emmt/EasyFITS",
    "ERFA",
    "FITSIO",
    "emmt/OIFITS",
    "WCS",
]

function generate_multidoc_refs(p; clonedir=clonedir)
    package_path = string(chopsuffix(p.name, ".jl"))
    package_name = if package_path in wrapper_packages
        "◯ " * package_path
    else
        "⬤ " * package_path
    end
    multidoc_type = if any(occursin.(("stable", "dev"), p.doc)) && startswith(p.doc, "https://juliaastro")
            "MultiDocRef"
        else
            "Link"
        end

    if multidoc_type == "MultiDocRef"
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, package_path),
            path = package_path,
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
    # JuliaAstro's own generated pages
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build"),
        path = "home",
        name = "Home",
        fix_canonical_url = false,
    ),
    # MultiDocumenter pages
    map(ecosystem) do (highlevel, sublevels)
        MultiDocumenter.MegaDropdownNav(highlevel,
            map(sublevels) do (sublevel, packages)
                MultiDocumenter.Column(sublevel, collect(generate_multidoc_refs.(packages)))
            end |> collect
        )
    end...,
]

# This make file compiles the documentation for the JuliaAstro website.
# It consists of the usual documenter structure, but also follows the approach
# of the SciML docs page https://github.com/SciML/SciMLDocs/blob/main/docs/make.jl
# by generating nested documentation for packages under the JuliaAstro organization.
# That way, docs for all packages are browsable and searchable in one place!

@info "Beginning aggregate build for JuliaAstro site"
@info """
Documentation clone directory: $(clonedir)
Build directory: $(outpath)
"""
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
@info "Aggregate build complete"

# Remove dev/latest docs from JuliaAstro site
rm.(glob(joinpath("*", "dev"), outpath); recursive=true)
rm.(glob(joinpath("*", "latest"), outpath); recursive=true)

# Download logo
# assets_dir = joinpath(outpath, "assets")
# mkpath(assets_dir)
# Downloads.download(
#     "https://raw.githubusercontent.com/JuliaAstro/JuliaAstro.github.io/refs/heads/main/docs/src/assets/logo.svg",
#     joinpath(assets_dir, "logo.svg");
#     verbose = true,
# )

@info "Deploying docs"
deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "gh-pages",
    devbranch = "main",
    devurl = "home",
    cname = "juliaastro.org",
    versions = nothing,
)
@info "Deploy complete"
