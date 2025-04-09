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
    format = Documenter.HTML(
        mathengine=mathengine,
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://juliaastro.org/",
        assets = String[
            "assets/styles.css",
            "assets/favicon.ico",
        ],
    ),
    pages = [
        "Home"=>"index.md",
        "Ecosystem" => "ecosystem.md",
        "Tutorials" => [
            "tutorials/index.md",
            "General" => [
                "tutorials/jwst-image-scale-bar.md",
                "tutorials/tabular-data.md",
                "tutorials/curve-fit.md",
            ],
        ],
    ],
    warnonly = [:missing_docs],
)

@info "Building aggregate JuliaAstro site"
import Markdown
function highlevels(content)
    arr = []
    i = 0
    for line in content
        if line isa Markdown.Header{2}
            push!(arr, [first(line.text), Vector{String}[]])
            i += 1
        end
        if line isa Markdown.Header{3}
            push!(last(arr[i]), [first(line.text)])
        end
        if line isa Markdown.Paragraph && first(line.content) isa Markdown.Link
            link_type = strip(last(first(line.content).text))
            url = first(line.content).url
            push!(last(last(arr[i])), url)
            if link_type == "Documentation"
                multidoc_type = if any(occursin.(("stable", "dev"), url)) && startswith(url, "https://juliaastro")
                    "MultiDocRef"
                else
                    "Link"
                end
                push!(last(last(arr[i])), multidoc_type)
            end
        end
    end

    return arr
end

function generate_multidoc_refs(package; clonedir=joinpath(@__DIR__, "clones"))
    package_name = string(chopsuffix(first(package), ".jl"))
    if last(package) == "MultiDocRef"
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, package_name),
            path = package_name,
            name = package_name,
            giturl = package[2],
        )
    else
        MultiDocumenter.Link(
            package_name,
            package[3],
        )
    end
end

ecosystem = read("./docs/src/ecosystem.md") |> String |> Markdown.parse

docs = [
    # We also add JuliaAstro's own generated pages
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build"),
        path = "docs",
        name = "JuliaAstro",
        fix_canonical_url = false,
    ),
    map(highlevels(ecosystem.content)) do (highlevel, packages)
        MultiDocumenter.DropdownNav(
            highlevel,
            generate_multidoc_refs.(packages)
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
    rootpath = "/previews/PR43/",
    canonical_domain = "https://JuliaAstro.org/",
    brand_image = MultiDocumenter.BrandImage(".", joinpath("assets", "logo.svg")),
    sitemap = true,
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
