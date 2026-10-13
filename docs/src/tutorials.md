# Getting Started

Welcome! This page shows how to install Julia and start using packages for different astronomy and astrophysics applications.

## Installing Julia

Navigate to the [Install Julia](https://julialang.org/install/) section of the official Julia website for instructions on getting started.

## Installing Packages

Julia packages are installed and managed using the built-in package manager called [Pkg.jl](https://pkgdocs.julialang.org/v1/).
You can either use it interactively by entering "Pkg mode" in your terminal, or programmatically. We'll illustrate interactive use here.

1. Start julia in a terminal by running `julia`.
1. Type `]` to enter package-mode (see Julia documentation for more details)
1. Type `add SomePackage` to install a package, replacing `SomePackage` with the desired package name without the `.jl` extension.

This will take a little while to download all the required packages and precompile for your system. If you have several packages to install, list them all at once instead of one by one to save time: `add SomePackage1 SomePackage2 SomePackage3`

It's recommended to use Julia projects (i.e., [environments](https://pkgdocs.julialang.org/v1/environments/)) to store what packages you use and make it easier to reproduce your work. You can create or activate a previously created project by entering Pkg-mode (type `]`) and running `activate myproject`. Another option is to create a folder for your project, and start julia in that folder with the option `julia --project`.

For more information on how to use the Julia package manager, refer to the [Pkg.jl documentation](https://pkgdocs.julialang.org/). The [Modern Julia Workflows](https://modernjuliaworkflows.org/) website is also a useful resource for exploring best practices for developing in Julia.

## Tutorials

JuliaAstro maintains [learn.JuliaAstro.org](https://learn.juliaastro.org/), a collection of general tutorials useful to astronomers and astrophysicist getting started with Julia.

In Julia, smaller focused packages are preferred. These tutorials show how you can combine smaller packages to get big results!

For more in-depth usage examples, please see the documentation pages of the individual packages linked on the [Package Ecosystem](@ref eco) page.
