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
    pages=fullpages
)



deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source"
)
