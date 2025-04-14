# Getting Started

Welcome! This page contains links to general tutorials useful to astronomers and astrophysicists getting started with Julia.

In Julia, smaller focussed packages are preferred. This page shows how you can combine smaller packages to get big results!

For more advanced usage examples, please see the documentation pages of the individual packages linked on the [Ecosystem](@ref eco) page.


## Installing Julia

To install Julia, it's strongly recommended to download the official binary for your operating system. 
Visit the [julialang.org Downloads page](https://julialang.org/downloads), and select the latest stable version for your operating system. Currently, this is 1.7.3. Click the [help] links next to your operating system if you require more detailed instructions.

## Installing Packages

Julia packages are installed and managed using the built-in package manager called [Pkg.jl](https://pkgdocs.julialang.org/v1/).
You can either use it interactively by entering "Pkg mode" in your terminal, or programatically. We'll illustrate interactive use here.

1. Start julia in a terminal by running `julia`.
2. Type `]` to enter package-mode (see Julia documentation for more details)
3. Type `add SomePackage` to install a package, replacing `SomePackage` with the desired package name without the `.jl` extension.

This will take a little while to download all the required packages and precompile for your system. If you have several packages to install, list them all at once instead of one by one to save time: `add SomePackage1 SomePackage2 SomePackage3`

It's recommended to use Julia projects to store what packages you use and make it easier to reproduce your work. You can create or activate a previously created project by entering Pkg-mode (type `]`) and running `activate myproject`. Another option is to create a folder for your project, and start julia in that folder with the option `julia --project=./`. 

For more information on how to use the Julia package manager, refer to the [Pkg.jl documentation](https://pkgdocs.julialang.org/v1/repl/).



## Tutorial Index

The following tutorials show how to use Julia to perform common tasks in astronomy and astrophysics.

### General

* [Plot a JWST image with world coordinates and a scale bar](@ref tutorial-jwst-scalebar)

* [Load tabular data from a FITS file and plot acceleration of nearby stars](@ref tabular-data)

* [Curve fitting: least square and Bayesian](@ref curve-fit)
