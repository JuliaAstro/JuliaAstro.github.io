using Documenter, LibGit2, Pkg

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
    "Images" => ["FITSIO"],
    # "Images" => ["AstroImages", "FITSIO"],
    # "Time & Coordinates" => ["WCS", "AstroTime"]
    "Visualization & Plotting" => [
        # "AstroImages",
        "SAOImageDS9",
        # "Plots"
    ],
    "Data I/O" => [
        # "CFITSIO",
        "CasaCore",
        "OIFITS",
        "VLBIData",
        "Difmap",
    ],
    "Cosmology" => [

    ],
    "Images" => [
        # "CCDReduction",
        # "LACosmic"
    ],
    "Numerical Utilities" => [
        "FFTW"
    ],
    # "Statistics" => [
    #     "Statistics",
    #     "StatsBase",
    #     "Turing",
    #     "PairPlots",
    # ]
]
# CCDReduction LACosmic Photometry PSFModels Reproject AstroAngles AstroTime ERFA SkyCoords UnitfulAstro WCS Transits EarthOrientation AstroLib BoxLeastSquares Cosmology DustExtinction LombScargle


# Intro pages to a given category.
# Ensure order matches the above.
catpagestarts = [
    Any["highlevels/images.md"],
    Any["highlevels/vizplot.md"],
    Any["highlevels/dataio.md"],
    Any["highlevels/cosmology.md"],
    Any["highlevels/images.md"],
    Any["highlevels/numerical-utils.md"],
]

# 3rd party packages: pull in README only
usereadme = Dict(
    "FFTW" => "https://github.com/JuliaMath/FFTW.jl",
    # "CFITSIO" => "https://github.com/JuliaAstro/CFITSIO.jl",
    "CasaCore" => "https://github.com/mweastwood/CasaCore.jl",
    "OIFITS" => "https://github.com/emmt/OIFITS.jl",
    "VLBIData" => "https://gitlab.com/aplavin/VLBIData.jl",
    "Difmap" => "https://gitlab.com/aplavin/Difmap.jl",
    # "Plots" => "https://github.com/JuliaPlots/Plots.jl",
)


allmods = Vector{Module}()

if isdir("src/modules")
    rm("src/modules", recursive=true)
end

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
                sourcedir = joinpath(pkgdir($(Symbol(mod))), "docs", "src")
                targdir = joinpath("src", "modules", $mod)
                mkpath(targdir)
                cp(sourcedir, targdir, force=true)
                pagefile = joinpath(pkgdir($(Symbol(mod))), "docs", "pages.jl")
                include(pagefile)
                push!(allmods, $(Symbol(mod))) # Sub-package we are documenting

                # Dependencies required for sub-package docs
                # All sub-deps are already installed but we have to mess with LOAD_PATH
                # so that we can import them directly.
                push!(Base.LOAD_PATH, joinpath(pkgdir($(Symbol(mod))), "docs"))
                for depe in requiredmods
                    eval(quote
                        using $depe
                        push!(allmods, $depe)
                    end)
                end
                push!(catpage, $mod => recursive_append(pages, joinpath("modules", $mod)))
            end
            @eval $ex
        end
    end
    push!(fullpages, cat[1] => catpage)
end
# @show fullpages allmods

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


# makedocs(;
#     repo = "https://github.com/juliaastro/juliaastro.github.io/blob/{commit}{path}#L{line}",
#     sitename = "JuliaAstro",
#     format = Documenter.HTML(;
#         prettyurls = get(ENV, "CI", "false") == "true",
#         canonical = "https://juliaastro.github.io/",
#         assets = String[],
#     ),
#     pages = [

#     ],
#     strict = true
# )


deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source"
)
