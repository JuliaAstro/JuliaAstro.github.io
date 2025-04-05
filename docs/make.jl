using MultiDocumenter, Documenter
using LibGit2, Pkg, TOML, UUIDs, Downloads

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

include("pages.jl")
mathengine = MathJax3(Dict(
    :loader => Dict("load" => ["[tex]/require", "[tex]/mathtools"]),
    :tex => Dict(
        "inlineMath" => [["\$", "\$"], ["\\(", "\\)"]],
        "packages" => ["base", "ams", "autoload", "mathtools", "require"],
    ),
))

makedocs(
    sitename="JuliaAstro",
    authors = "Julia Astro Contributors",
    clean=true,
    doctest=false,
    format=Documenter.HTML(
        mathengine=mathengine,
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://juliaastro.org/",
        assets = String[
            "assets/styles.css",
            "assets/favicon.ico",
        ],
    ),
    pages=fullpages,
    warnonly=[:missing_docs],
)

@info "Building aggregate JuliaAstro site"
docs = [
    # We also add JuliaAstro's own generated pages
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build"),
        path = "docs",
        name = "JuliaAstro",
        fix_canonical_url = false,
    ),
    MultiDocumenter.DropdownNav(
        "Time, Coordinates, & Units",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroAngles"),
                path = "AstroAngles",
                name = "AstroAngles",
                giturl = "https://github.com/JuliaAstro/AstroAngles.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroTime"),
                path = "AstroTime",
                name = "AstroTime",
                giturl = "https://github.com/JuliaAstro/AstroTime.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "ERFA"),
                path = "ERFA",
                name = "ERFA",
                giturl = "https://github.com/JuliaAstro/ERFA.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "SkyCoords"),
                path = "SkyCoords",
                name = "SkyCoords",
                giturl = "https://github.com/JuliaAstro/SkyCoords.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "UnitfulAstro"),
                path = "UnitfulAstro",
                name = "UnitfulAstro",
                giturl = "https://github.com/JuliaAstro/UnitfulAstro.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "WCS"),
                path = "WCS",
                name = "WCS",
                giturl = "https://github.com/JuliaAstro/WCS.jl.git",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Images",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroImages"),
                path = "AstroImages",
                name = "AstroImages",
                giturl = "https://github.com/JuliaAstro/AstroImages.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "SAOImagesDS9"),
                path = "SAOImagesDS9",
                name = "SAOImagesDS9",
                giturl = "https://github.com/JuliaAstro/SAOImageDS9.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "Photometry"),
                path = "Photometry",
                name = "Photometry",
                giturl = "https://github.com/juliaastro/Photometry.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "PSFModels"),
                path = "PSFModels",
                name = "PSFModels",
                giturl = "https://github.com/juliaastro/PSFModels.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "LACosmic"),
                path = "LACosmic",
                name = "LACosmic",
                giturl = "https://github.com/juliaastro/LACosmic.jl.git",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Data I/O",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroImages"),
                path = "AstroImages",
                name = "AstroImages",
                giturl = "https://github.com/JuliaAstro/AstroImages.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "FITSIO"),
                path = "FITSIO",
                name = "FITSIO",
                giturl = "https://github.com/JuliaAstro/FITSIO.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "CFITSIO"),
                path = "CFITSIO",
                name = "CFITSIO",
                giturl = "https://github.com/JuliaAstro/CFITSIO.jl.git",
            ),
            MultiDocumenter.Link(
                "mweastwood/CasaCore",
                "http://mweastwood.info/CasaCore.jl/stable/",
            ),
            MultiDocumenter.Link(
                "emmt/OIFITS",
                "https://github.com/emmt/OIFITS.jl",
            ),
            MultiDocumenter.Link(
                "aplavin/VLBIData",
                "https://github.com/JuliaAPlavin/VLBIData.jl",
            ),
            MultiDocumenter.Link(
                "aplavin/Difmap",
                "https://github.com/JuliaAPlavin/Difmap.jl",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Cosmology",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "Cosmology"),
                path = "Cosmology",
                name = "Cosmology",
                giturl = "https://github.com/JuliaAstro/Cosmology.jl.git",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Orbits & Ephemerides",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "Transits"),
                path = "Transits",
                name = "Transits",
                giturl = "https://github.com/JuliaAstro/Transits.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "sefffal/PlanetOrbits"),
                path = "sefffal/PlanetOrbits",
                name = "sefffal/PlanetOrbits",
                giturl = "https://github.com/sefffal/PlanetOrbits.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "EarthOrientation"),
                path = "EarthOrientation",
                name = "EarthOrientation",
                giturl = "https://github.com/JuliaAstro/EarthOrientation.jl.git",
            ),
            MultiDocumenter.Link(
                "JPLEphemeris",
                "https://github.com/JuliaAstro/JPLEphemeris.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroLib"),
                path = "AstroLib",
                name = "AstroLib",
                giturl = "https://github.com/JuliaAstro/AstroLib.jl.git",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Numerical Utilities",
        [
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "BoxLeastSquares"),
                path = "BoxLeastSquares",
                name = "BoxLeastSquares",
                giturl = "https://github.com/JuliaAstro/BoxLeastSquares.jl.git",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "LombScargle"),
                path = "LombScargle",
                name = "LombScargle",
                giturl = "https://github.com/JuliaAstro/LombScargle.jl.git",
            ),
        ]
    ),
    MultiDocumenter.DropdownNav(
        "Statistics",
        [
            MultiDocumenter.Link(
                "sefffal/PairPlots",
                "https://sefffal.github.io/PairPlots.jl/dev",
            ),
        ]
    ),
]

MultiDocumenter.make(
    outpath,
    docs;
    assets_dir = "docs/src/assets",
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    ),
    rootpath = "/JuliaAstro.org/",
    canonical_domain = "https://JuliaAstro.org/",
    brand_image = MultiDocumenter.BrandImage(".", joinpath("assets", "logo.svg"))
    #sitemap = true,
)
@info "Aggregate build done"

# Download logo
assets_dir = joinpath(outpath, "assets")
mkpath(assets_dir)
Downloads.download(
    "https://raw.githubusercontent.com/JuliaAstro/JuliaAstro.github.io/refs/heads/source/docs/src/assets/logo.svg",
    joinpath(assets_dir, "logo.svg");
    verbose = true,
)
@info "Final build done"

@info "Deployng docs"
#if "--deploy" in ARGS
#    @warn "Deploying to GitHub" ARGS
#    gitroot = normpath(joinpath(@__DIR__, ".."))
#    run(`git pull`)
#    outbranch = "master"
#    has_outbranch = true
#    if !success(`git checkout $outbranch`)
#        has_outbranch = false
#        if !success(`git switch --orphan $outbranch`)
#            @error "Cannot create new orphaned branch $outbranch."
#            exit(1)
#        end
#    end
#    for file in readdir(gitroot; join = true)
#        (endswith(file, ".git") || (basename(file) == "CNAME")) && continue
#        rm(file; force = true, recursive = true)
#    end
#    for file in readdir(outpath)
#        cp(joinpath(outpath, file), joinpath(gitroot, file))
#    end
#    run(`git add .`)
#    if success(`git commit -m 'Aggregate documentation'`)
#        @info "Pushing updated documentation."
#        if has_outbranch
#            run(`git push`)
#        else
#            run(`git push -u origin $outbranch`)
#        end
#        run(`git checkout source`)
#    else
#        @info "No changes to aggregated documentation."
#    end
#else
#    @info "Skipping deployment, 'deploy' not passed. Generated files in docs/$(outpath)." ARGS
#    cp(outpath, joinpath(@__DIR__, "build"), force = true)
#end

deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "multidocumenter",
    versions = nothing,
)
@info "Deploy complete"
