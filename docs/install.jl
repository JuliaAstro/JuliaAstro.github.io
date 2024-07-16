using LibGit2, Pkg, TOML, UUIDs
using DocumenterCitations

# This prepares the documentation for all JuliaAstro packages to be built.
# It installs the latest versions of all JuliaAstro packages and prepares
# a list of pages to build.

include("pages.jl")

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
    # Pkg.add(PackageSpec(;name,rev))
    Pkg.develop(PackageSpec(;name))
end

installed_pkg_names = getproperty.(values(Pkg.dependencies()), :name)
to_use = []
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

                    # By default, don't require any external modules (may get overriden by including pages.jl)
                    requiredmods = Symbol[]

                    # Load page index for package
                    include(pagefile)
                    push!(allmods, $(Symbol(mod))) # Sub-package we are documenting

                    # Dependencies of sub-package docs Project.toml
                    # This one is hackier. We parse the docs/Project.toml, add a name and uuid field,
                    # and then dev it.
                    docprojectname = string($(Symbol(mod)), "docs")
                    docsprojectfname = joinpath(pkgdir($(Symbol(mod))), "docs", "Project.toml")
                    if isfile(docsprojectfname) && docprojectname ∉ installed_pkg_names
                        try
                            Pkg.rm(docprojectname)
                        catch
                        end
                        docsproject = TOML.parsefile(docsprojectfname)
                        @info "  dev'ing docs folder" docsprojectfname
                        @info "  giving docs folder name and uuid" docprojectname
                        docsproject["name"] = docprojectname
                        docsproject["uuid"] = string(uuid4())
                        @info "  updating docsproject file" project=docsprojectfname
                        open(docsprojectfname, "w") do io
                            TOML.print(io, docsproject)
                        end
                        open(joinpath(dirname(docsprojectfname), "src", docprojectname*".jl"), write=true) do io
                            write(io, "module $docprojectname; end")
                        end
                        Pkg.develop(path=dirname(docsprojectfname))
                    else
                        @info "  No docs sub-project to dev" docprojectname docsprojectfname
                    end
                    # Dependencies of sub-packages
                    # All sub-deps are already installed but we have to mess with LOAD_PATH
                    # so that we can import them directly.
                    push!(Base.LOAD_PATH, joinpath(pkgdir($(Symbol(mod))), "docs"))



                    # These are a list of modules supplied by packages that are necesary
                    # to load before the docs can be built
                    for depe in requiredmods
                        push!(to_use, depe)
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
Pkg.resolve()
Pkg.precompile()
