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

### 1. Editing existing markdown content

Typo fixes or suggested changes to existing prose is appreciated! The most direct way to create a PR is to navigate to the page that you would like to edit, and select the "Edit source on GitHub" icon that appears at the top of each page. From there, you can submit your edits as usual following [the GitHub guide for submitting in-browser changes](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files).

### 2. Adding a package to our [Ecosystems page](https://juliaastro.org/home/ecosystem/)

Our Ecosystem page is integrated with the rest of the site, including the global navbar dropdown menu across the top, and in our [integration testing suite](https://github.com/JuliaAstro/JuliaAstro.github.io/actions/workflows/CI.yml). To add a package, include an entry in [`docs/src/ecosystem.md`](https://github.com/JuliaAstro/JuliaAstro.github.io/blob/source/docs/src/ecosystem.md), following the same format as the other packages.

> [!NOTE]
> This page determines the order of the top level dropdown menus on the site, alphabetically by package name. Packages under the JuliaAstro organization are listed as their bare name, while packages outside of the organization have their parent repo name prepended to it, e.g., `eschnett/ASDF2.jl`.

### 2a. Adding a package to our [Comparison with Astropy page](https://juliaastro.org/home/comparison/)

If appropriate, we also appreciate a quick entry for your package that relates it to a similar package in the [Astropy ecosystem](https://www.astropy.org/). This helps new users who may be more familiar with Python get more easily oriented in the Julia ecosystem. Below is an example of how to add an entry:

* Navigate to `./docs/src/comparison.md`

* Find the corresponding row entry to add your package to, e.g., https://github.com/JuliaAstro/JuliaAstro.github.io/blob/42a87f2f2ed064c8da9cc97b2f215a4c1f978386/docs/src/comparison.md?plain=1#L27-L34

* Copy-and-paste the list item and replace with your package's (stable) documentation link and package name. Place this item in alphebetical order by package name.

* Repeat this process for the `Description` column, e.g., https://github.com/JuliaAstro/JuliaAstro.github.io/blob/42a87f2f2ed064c8da9cc97b2f215a4c1f978386/docs/src/comparison.md?plain=1#L35-L42

* Don't forget to increment the `rowspan=` HTML attribute for the astropy package row!, e.g., https://github.com/JuliaAstro/JuliaAstro.github.io/blob/7059aa93d4e008e20512d59841baf90b8e80061f/docs/src/comparison.md?plain=1#L107

## Testing locally / developer docs

Add [LiveServer.jl](https://github.com/JuliaDocs/LiveServer.jl) to your global env and then run the following in the `JuliaAstro.github.io/` folder:

```julia-repl
> julia --proj=./docs/

julia> using LiveServer

julia> servedocs(; include_dirs=["./src/"], launch_browser=true)
```

> [!TIP]
> If just making simple markdown changes, you can shorten the build time between edits by commenting out the call to `MultiDocumenter.make` in [`./docs/make.jl`](https://github.com/JuliaAstro/JuliaAstro.github.io/blob/source/docs/make.jl). This disables the MultiDocumenter.jl repo-cloning and top navbar build process, and can be done without needing to restart your `LiveServer` session.

See our [Contributing page](https://juliaastro.org/home/#Contributing) for more.
