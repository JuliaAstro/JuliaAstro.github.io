using MultiDocumenter, Documenter
using LibGit2, Pkg, TOML, UUIDs, Downloads

# This make file compiles the documentation for the JuliaAstro website.
# It consists of the usual documenter structure, but also follows the approach
# of the SciML docs page https://github.com/SciML/SciMLDocs/blob/main/docs/make.jl
# by generating nested documentation for packages under the JuliaAstro organization.
# That way, docs for all packages are browsable and searchable in one place!

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = joinpath(@__DIR__, "build")
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

@info "Building Documenter site for JuliaAstro"

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
        ],
    ),
    pages=fullpages,
    warnonly=[:missing_docs],
)

@info "Building aggregate JuliaAstro site"
docs = [
     # We also add JuliaAstro's own generated pages
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, outpath),
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
                giturl = "https://github.com/JuliaAstro/AstroAngles.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroTime"),
                path = "AstroTime",
                name = "AstroTime",
                giturl = "https://github.com/JuliaAstro/AstroTime.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "ERFA"),
                path = "ERFA",
                name = "ERFA",
                giturl = "https://github.com/JuliaAstro/ERFA.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "SkyCoords"),
                path = "SkyCoords",
                name = "SkyCoords",
                giturl = "https://github.com/JuliaAstro/SkyCoords.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "UnitfulAstro"),
                path = "UnitfulAstro",
                name = "UnitfulAstro",
                giturl = "https://github.com/JuliaAstro/UnitfulAstro.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "WCS"),
                path = "WCS",
                name = "WCS",
                giturl = "https://github.com/JuliaAstro/WCS.jl",
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
                giturl = "https://github.com/JuliaAstro/AstroImages.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "SAOImagesDS9"),
                path = "SAOImagesDS9",
                name = "SAOImagesDS9",
                giturl = "https://github.com/JuliaAstro/SAOImageDS9.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "Photometry"),
                path = "Photometry",
                name = "Photometry",
                giturl = "https://github.com/juliaastro/Photometry.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "PSFModels"),
                path = "PSFModels",
                name = "PSFModels",
                giturl = "https://github.com/juliaastro/PSFModels.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "LACosmic"),
                path = "LACosmic",
                name = "LACosmic",
                giturl = "https://github.com/juliaastro/LACosmic.jl",
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
                giturl = "https://github.com/JuliaAstro/AstroImages.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "FITSIO"),
                path = "FITSIO",
                name = "FITSIO",
                giturl = "https://github.com/JuliaAstro/FITSIO.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "CFITSIO"),
                path = "CFITSIO",
                name = "CFITSIO",
                giturl = "https://github.com/JuliaAstro/CFITSIO.jl",
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
                giturl = "https://github.com/JuliaAstro/Cosmology.jl",
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
                giturl = "https://github.com/JuliaAstro/Transits.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "sefffal/PlanetOrbits"),
                path = "sefffal/PlanetOrbits",
                name = "sefffal/PlanetOrbits",
                giturl = "https://github.com/sefffal/PlanetOrbits.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "EarthOrientation"),
                path = "EarthOrientation",
                name = "EarthOrientation",
                giturl = "https://github.com/JuliaAstro/EarthOrientation.jl",
            ),
            MultiDocumenter.Link(
                "JPLEphemeris",
                "https://github.com/JuliaAstro/JPLEphemeris.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "AstroLib"),
                path = "AstroLib",
                name = "AstroLib",
                giturl = "https://github.com/JuliaAstro/AstroLib.jl",
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
                giturl = "https://github.com/JuliaAstro/BoxLeastSquares.jl",
            ),
            MultiDocumenter.MultiDocRef(
                upstream = joinpath(clonedir, "LombScargle"),
                path = "LombScargle",
                name = "LombScargle",
                giturl = "https://github.com/JuliaAstro/LombScargle.jl",
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
@info "Aggregate build done"

@info "Final build"
MultiDocumenter.make(
    outpath,
    docs;
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    ),
    rootpath = "/",
    canonical_domain = "https://JuliaAstro.org",
    brand_image = MultiDocumenter.BrandImage(".", joinpath("assets", "logo.svg"))
    #sitemap = true,
)

# Download logo
assets_dir = joinpath(outpath, "assets")
mkpath(assets_dir)
Downloads.download(
    "https://raw.githubusercontent.com/JuliaAstro/JuliaAstro.github.io/refs/heads/source/docs/src/assets/logo.svg",
    joinpath(assets_dir, "logo.svg");
    verbose=true,
)
@info "Final build done"

if "deploy" in ARGS
    @warn "Deploying to GitHub" ARGS
    gitroot = normpath(joinpath(@__DIR__, ".."))
    run(`git pull`)
    outbranch = "gh-pages"
    has_outbranch = true
    if !success(`git checkout $outbranch`)
        has_outbranch = false
        if !success(`git switch --orphan $outbranch`)
            @error "Cannot create new orphaned branch $outbranch."
            exit(1)
        end
    end
    for file in readdir(gitroot; join = true)
        endswith(file, ".git") && continue
        rm(file; force = true, recursive = true)
    end
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(gitroot, file))
    end
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout main`)
    else
        @info "No changes to aggregated documentation."
    end
else
    @info "Skipping deployment, 'deploy' not passed. Generated files in docs/build." ARGS
    cp(outpath, joinpath(@__DIR__, "build"), force = true)
end

#deploydocs(;
#    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
#    push_preview = true,
#    branch = "master",
#    devbranch = "source"
#)
