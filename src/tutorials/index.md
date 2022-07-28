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

For more information on how to use the Julia package manager, refer to the [Pkg.jl documentation](https://pkgdocs.julialang.org/v1/repl/).



## Tutorial Index

The following tutorials show how to use Julia to perform common taks in astronomy and astrophysics.

### General

* [Plot a JWST image with world coordinates and a scale bar](@ref tutorial-jwst-scalebar)

* [Loading tabular data from a FITS file](@ref tabular-data)

