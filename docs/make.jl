using LibGit2, Pkg, TOML, UUIDs

# This make file compiles the documentation for the JuliaAstro website.
# It consists of the usual documeter structure, but also follows the approach
# of the SciML docs page https://github.com/SciML/SciMLDocs/blob/main/docs/make.jl
# by generating nested documentation for packages under the JuliaAstro organization.
# That way, docs for all packages are browesable and searchable in one place!

include("install.jl")

for depe in to_use
    eval(quote
        using $depe
        push!(allmods, $depe)
    end)
end

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
    clean=true,
    doctest=false,
    format=Documenter.HTML(
        mathengine=mathengine,
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://juliaastro.github.io/",
        assets = String[
            "assets/styles.css",
        ],
    ),
    pages=fullpages,
    # turn errors into warnings
    # :cross_references -> AstroImages uses some weird docstring pulling from
    #   DimensionalData.jl which is outside the scope of this website.
    # :citations, :bibliography_block -> integration with DocumenterCitations
    #   isn't complete enough yet, so this is added piecemeal and the errors
    #   silenced for now
    warnonly=[:missing_docs, :cross_references, :citations, :bibliography_block],
)


deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source"
)
