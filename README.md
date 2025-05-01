JuliaAstro.github.io
====================

[![Static Badge](https://img.shields.io/badge/Docs-stable-blue)](https://juliaastro.org/)
[![Build website](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/Documentation.yml/badge.svg?branch=source)](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/Documentation.yml)
[![pages-build-deployment](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/pages/pages-build-deployment/badge.svg?branch=master)](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/pages/pages-build-deployment)
[![Test JuliaAstro packages](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/CI.yml/badge.svg)](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/CI.yml)

## Description

This repo is an in-development project to produce a landing page for JuliaAstro, inspired by the [MultiDocumenter.jl](https://github.com/JuliaComputing/MultiDocumenter.jl) workflow followed by [SciMLDocs](https://github.com/SciML/SciMLDocs) (see their production page [here](https://docs.sciml.ai/Overview/stable/)).

The rendered JuliaAstro site is published online using GitHub Pages at <https://juliaastro.org/>. A GitHub action rebuilds the site on every successful pull request.

## Contributing

Below we walk through two main ways to contribute to the JuliaAstro site:

### 1. Editing existing content

Typo fixes or suggested changes to existing prose is appreciated! The most direct way to create a PR is to navigate to the page that you would like to edit, and select the "Edit source on GitHub" icon that appears at the top of each page. From there, you can submit your edits as usual following [the GitHub guide for submitting in-browser changes](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files).

### 2. Adding a package to our [Ecosystems page](https://juliaastro.org/home/ecosystem/)

Our Ecosystem page is integrated with the rest of the site, including the global navbar dropdown menu across the top, and in our [integration testing suite](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/CI.yml). To add a package, include the following metadata for it in the [`JuliaAstroDocs.jl > ecosystem`](https://github.com/JuliaAstro/JuliaAstro.github.io/blob/bca19e11cdfa47014786686ae96a6e02d87ff4b8/src/JuliaAstroDocs.jl#L14) data structure:

* `name`: package name
* `repo`: url of package repo 
* `doc`: url of package docs
* `tagline`: brief summary of what package does
* `descr`: an extended description of what package does

> [!NOTE]
> See the packages already included in this structure for examples. Note that this structure is organized in the same order as the top level dropdown menus on the site, alphabetically by package name. Packages under the JuliaAstro organization are listed as their bare name, while packages outside of the organization have their parent repo name prepended to it, e.g., `eschnett/ASDF2.jl`.

## Testing locally / developer docs

Add [LiveServer.jl](https://github.com/JuliaDocs/LiveServer.jl) to your global env and then run the following in the `JuliaAstro.github.io/` folder:

```julia-repl
> julia --proj

julia> using LiveServer

julia> servedocs(; include_dirs=["./src/"], launch_browser=true)
```

> [!NOTE]
> If making changes in `JuliaAstroDocs.jl`, run the following in a separate process to sync markdown files:
> ```julia
> using JuliaAstroDocs
>
> JuliaAstroDocs.write_ecosystem()
> ```

> [!TIP]
> If just making simple markdown changes, you can shorten the build time between edits by commenting out the call to `MultiDocumenter.make` in `./docs/make.jl`. This disables the MultiDocumenter.jl repo-cloning and top navbar build process and can be done without needing to restart your `LiveServer` session.

See our [Contributing page](https://juliaastro.org/home/#Contributing) for more.
