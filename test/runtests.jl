#=
This file defines integration tests for the JuliaAstro package ecosystem.

These are tests that confirm various packages can be installed and work together.
=#

using Test, Pkg, InteractiveUtils

# Specify revision to install and build docs for.
# Every package must be listed here UNLESS it's listed in `usereadme` above.
pkgrevs = Dict(
    "AstroAngles" =>  "main",
    "AstroImages" =>  "master",
    "AstroLib" =>  "master",
    "AstroLib" =>  "master",
    "AstroTime" =>  "main",
    "BoxLeastSquares" => "main",
    # "CCDReduction" =>  "main",
    "CFITSIO" =>  "master",
    "Cosmology" =>  "master",
    "DustExtinction" =>  "master",
    "EarthOrientation" =>  "master",
    "ERFA" => "main",
    "FITSIO" =>  "master",
    "LACosmic" =>  "main",
    #"JPLEphemeris" =>  "master",
    "LombScargle" => "master",
    "Photometry" =>  "main",
    # "PSFModels" =>  "main",
    "SAOImageDS9" =>  "master",
    "SkyCoords" =>  "master",
    "Transits" =>  "main",
    "UnitfulAstro" =>  "master",
    "WCS" => "master",
)

@testset "JuliaAstro Package Evalauation" begin
    @testset "Compatible versions exist" begin

        ENV["JULIA_PKG_PRECOMPILE_AUTO"]=0

        for pkgspec in pkgrevs
            name, rev = pkgspec
            @test Pkg.add(PackageSpec(;name)) == nothing
        end
    end

    @testset "Development versions compatible" begin

        # Start by testing that we can install all packages
        # Worry if they compile successfully after
        ENV["JULIA_PKG_PRECOMPILE_AUTO"]=0

        for pkgspec in pkgrevs
            name, rev = pkgspec
            @test Pkg.add(PackageSpec(;name, rev)) == nothing
        end
    end

    @testset "Precompilation" begin
        @test Pkg.precompile(; strict=true) == nothing
    end

    @testset "Package loading" begin
        for pkgspec in pkgrevs
            name, rev = pkgspec
            @test eval(quote
                @time_imports using $(Symbol(name))
            end) == nothing
        end
    end
end
