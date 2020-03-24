using Documenter

makedocs(;
    authors = "Julia Astro",
    repo = "https://github.com/juliaastro/juliaastro.github.io/blob/{commit}{path}#L{line}",
    sitename = "JuliaAstro",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://juliaastro.github.io/",
        assets = String[],
    ),
    pages = [
        "JuliaAstro" => "index.md",
    ],
    strict = true
)


deploydocs(;
    repo = "github.com/JuliaAstro/JuliaAstro.github.io",
    push_preview = true,
    branch = "master",
    devbranch = "source",
    devurl = "",
)
