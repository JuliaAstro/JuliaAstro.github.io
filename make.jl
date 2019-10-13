using Documenter

makedocs(sitename = "JuliaAstro",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true",
        assets = [
            "assets/favicon.ico",
        ],
    ))

