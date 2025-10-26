#=
This file defines integration tests for the JuliaAstro package ecosystem.

These are tests that confirm various packages can be installed and work together.
=#

using ParallelTestRunner: runtests, find_tests, parse_args
import JuliaAstroDocs

const init_code = quote
    # Start by testing that we can install all packages
    # Worry if they compile successfully after
    ENV["JULIA_PKG_PRECOMPILE_AUTO"] = 0

    import Pkg
    using JuliaAstroDocs: ecosystem_t
    using InteractiveUtils: @time_imports

    packages_juliaastro = filter(ecosystem_t()) do package
        occursin("juliaastro", lowercase(package.repo))
    end
    unique!(p -> p.name, packages_juliaastro)
    sort!(packages_juliaastro)
end

args = parse_args(Base.ARGS)
testsuite = find_tests(@__DIR__)

runtests(JuliaAstroDocs, args; testsuite, init_code)
