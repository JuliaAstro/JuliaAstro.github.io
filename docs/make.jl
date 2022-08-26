using LibGit2, Pkg, TOML, UUIDs

# This make file compiles the documentation for the JuliaAstro website.
# It consists of the usual documeter structure, but also follows the approach
# of the SciML docs page https://github.com/SciML/SciMLDocs/blob/main/docs/make.jl
# by generating nested documentation for packages under the JuliaAstro organization.
# That way, docs for all packages are browesable and searchable in one place!


# Plain documenter pages
fullpages = Any[
    "Home"=>"index.md"
    # "Ecosystem" => "ecosystem.md";
    "Tutorials" => [
        "tutorials/index.md",
        "General" => [
            "tutorials/jwst-image-scale-bar.md",
            "tutorials/tabular-data.md",
            "tutorials/curve-fit.md",
        ]
    ]   
]

# Categories to pull in from external docs
# Ordering Matters!
docsmodules = [
    "Time, Coordinates, & Units" => [
        "AstroLib",
        "UnitfulAstro",
        "AstroAngles",
        "AstroTime",
        "SkyCoords",
        "WCS",
    ],
    "Images" => [
        "AstroImages",
        "SAOImageDS9",
        "Photometry",
        "PSFModels",
        "CCDReduction",
        "LACosmic",
    ],
    "Data I/O" => [
        "FITSIO",
        "CFITSIO",
        "CasaCore",
        "OIFITS",
        "VLBIData",
        "Difmap",
    ],
    "Cosmology" => [
        "Cosmology"
    ],
    "Orbits & Emphemerides" => [
        # "JPLEphemeris",
        "EarthOrientation",
        "Transits",
        "PlanetOrbits",
        "AstroLib",
    ],
    "Numerical Utilities" => [
        "BoxLeastSquares",
        "LombScargle"
    ],
    "Statistics" => [
        "PairPlots"
    ]
]


# Intro pages to a given category.
# Ensure order matches the above.
catpagestarts = [
    Any["highlevels/timecoords.md"],
    Any["highlevels/images.md"],
    Any["highlevels/dataio.md"],
    Any["highlevels/cosmology.md"],
    Any["highlevels/orb-ephem.md"],
    Any["highlevels/numerical-utils.md"],
    Any["highlevels/stats.md"],
]

# 3rd party packages: pull in README only
usereadme = Dict(


    # These take longer to build. Uncomment to disable and just use the README.
    # "AstroImages" => "https://github.com/JuliaAstro/AstroImages.jl",
    # "PSFModels" => "https://github.com/JuliaAstro/PSFModels.jl",
    # "LACosmic" => "https://github.com/JuliaAstro/LACosmic.jl",

    # No docs page yet
    "AstroAngles" => "https://github.com/JuliaAstro/AstroAngles.jl",

    # Ecosystem
    "CasaCore" => "https://github.com/mweastwood/CasaCore.jl",
    "Difmap" => "https://gitlab.com/aplavin/Difmap.jl",
    "OIFITS" => "https://github.com/emmt/OIFITS.jl",
    "PairPlots" => "https://github.com/sefffal/PairPlots.jl",
    "PlanetOrbits" => "https://github.com/sefffal/PlanetOrbits.jl",
    "VLBIData" => "https://gitlab.com/aplavin/VLBIData.jl",
)

# Specify revision to install and build docs for.
# Every package must be listed here UNLESS it's listed in `usereadme` above.
pkgrevs = Dict(
    "AstroAngles" =>  "main",
    "AstroImages" =>  "master",
    "AstroLib" =>  "master",
    "AstroLib" =>  "master",
    "AstroTime" =>  "main",
    "BoxLeastSquares" => "main",
    "CCDReduction" =>  "main",
    "CFITSIO" =>  "master",
    "Cosmology" =>  "master",
    "DustExtinction" =>  "master",
    "EarthOrientation" =>  "master",
    "ERFA" => "main",
    "FITSIO" =>  "master",
    "LACosmic" =>  "main",
    #"JPLEphemeris" =>  "master",
    "LombScargle" => "master",
    "Photometry" =>  "main",
    "PSFModels" =>  "main",
    "SAOImageDS9" =>  "master",
    "SkyCoords" =>  "master",
    "Transits" =>  "main",
    "UnitfulAstro" =>  "master",
    "WCS" => "master",
)

allmods = Vector{Module}()

if isdir("src/modules")
    rm("src/modules", recursive=true)
end

ENV["GKSwstype"] = "100"
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

function recursive_append(pages::AbstractArray{<:AbstractArray}, str)
    map(recursive_append, pages, str)
end

function recursive_append(pages::AbstractArray{<:Pair{String,Any}}, str)
    for i in eachindex(pages)
        if pages[i][2] isa AbstractArray
            pages[i] = pages[i][1] => recursive_append(pages[i][2], str)
        elseif pages[i][2] isa String
            pages[i] = pages[i][1] => joinpath(str, pages[i][2])
        end
    end
    pages
end

function recursive_append(pages::AbstractArray{<:String}, str)
    for i in eachindex(pages)
        pages[i] = joinpath(str, pages[i])
    end
    pages
end

function recursive_append(pages::AbstractArray{<:Pair{String,String}}, str)
    for i in eachindex(pages)
        pages[i] = pages[i][1] => joinpath(str, pages[i][2])
    end
    pages
end

function recursive_append(pages::AbstractArray{<:Any}, str)
    for i in eachindex(pages)
        if pages[i] isa Pair && pages[i][2] isa String
            pages[i] = pages[i][1] => joinpath(str, pages[i][2])
        elseif pages[i] isa Pair && pages[i][2] isa AbstractArray
            pages[i] = pages[i][1] => recursive_append(pages[i][2], str)
        elseif pages[i] isa String
            pages[i] = joinpath(str, pages[i])
        else
            error("wait what?")
        end
    end
    pages
end

# Step 1: loop through packages and install JuliaAstro ones at their latest revision.
ENV["JULIA_PKG_PRECOMPILE_AUTO"]=0
for (name,rev) in pkgrevs
    Pkg.add(PackageSpec(;name,rev))
end

installed_pkg_names = getproperty.(values(Pkg.dependencies()), :name)
for (i, cat) in enumerate(docsmodules)
    global catpage
    catpage = catpagestarts[i]

    for mod in cat[2]
        @info "! Preparing docs for $mod"
        if haskey(usereadme, mod)
            @info "  Retrieving README.md"
            dir = joinpath("src", "modules", mod)
            if isdir(mod)
                @info "  $mod dir already exists; git fetch"
                LibGit2.fetch(LibGit2.GitRepo(mod))
                # TODO: might need a checkout operation as well.
                # This path only triggers when building locally and doesn't
                # effect CI doc builds.
            else
                @info "  Cloning $(usereadme[mod])"
                mkpath(dir)
                mkpath(mod)
                LibGit2.clone(usereadme[mod], mod)
            end
            from = joinpath(mod, "README.md")
            to = joinpath(dir, "index.md")
            @info "  Copying" from to
            mkpath(dirname(to))
            cp(from, to, force=true)
            push!(catpage, mod => joinpath("modules", mod, "index.md"))
        else
            @info "  Will use pages.jl directly"
            ex = quote
                using $(Symbol(mod))
                pagefile = joinpath(pkgdir($(Symbol(mod))), "docs", "pages.jl")
                if isfile(pagefile)
                    sourcedir = joinpath(pkgdir($(Symbol(mod))), "docs", "src")
                    targdir = joinpath("src", "modules", $mod)
                    mkpath(targdir)
                    cp(sourcedir, targdir, force=true)

                    # By default, don't require any external modules
                    requiredmods = Symbol[]

                    # Load page index for package
                    include(pagefile)
                    push!(allmods, $(Symbol(mod))) # Sub-package we are documenting

                    # Dependencies of sub-package docs Project.toml
                    # This one is hackier. We parse the docs/Project.toml, add a name and uuid field,
                    # and then dev it.
                    docprojectname = string($(Symbol(mod)), "docs")
                    # docsprojectfname = joinpath(pkgdir($(Symbol(mod))), "docs", "Project.toml")
                    # if isfile(docsprojectfname) && docprojectname ∉ installed_pkg_names
                    #     # docsproject = TOML.parsefile(docsprojectfname)
                    #     # @info "  dev'ing docs folder" docsprojectfname
                    #     # @info "  giving docs folder name and uui" docprojectname
                    #     # docsproject["name"] = docprojectname
                    #     # docsproject["uuid"] = string(uuid4())
                    #     # @info "  updating docsproject file" project=docsprojectfname
                    #     # open(docsprojectfname, "w") do io
                    #     #     TOML.print(io, docsproject)
                    #     # end
                    #     # open(joinpath(dirname(docsprojectfname), "src", docprojectname*".jl"), write=true) do io
                    #     #     write(io, "module $docprojectname; end")
                    #     # end
                    #     # Pkg.develop(path=dirname(docsprojectfname))
                    # else
                    #     @info "  No docs sub-project to dev" docprojectname docsprojectfname
                    # end
                    # Dependencies of sub-packages
                    # All sub-deps are already installed but we have to mess with LOAD_PATH
                    # so that we can import them directly.
                    push!(Base.LOAD_PATH, joinpath(pkgdir($(Symbol(mod))), "docs"))



                    # These are a list of modules supplied by packages that are necesary
                    # to load before the docs can be built
                    for depe in requiredmods
                        eval(quote
                            using $depe
                            push!(allmods, $depe)
                        end)
                    end

                    push!(catpage, $mod => recursive_append(pages, joinpath("modules", $mod)))
                else
                    @warn "  pages.jl not present, skipping package."
                end
            end
            @eval $ex
        end
    end
    push!(fullpages, cat[1] => catpage)
end
run(`ls -R`)
Pkg.resolve()
Pkg.precompile()

# We wait to import Documenter in case one of the packages requires
# an older version. If that was the case, it's version may have changed
# after the above for-loop
using Documenter

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
    modules=identity.(allmods),
    clean=true, doctest=false,
    format=Documenter.HTML(
        mathengine=mathengine,
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://juliaastro.github.io/",
        assets = String[],
    ),
    pages=fullpages
)



deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source"
)
