#=
This file defines integration tests for the JuliaAstro package ecosystem.

These are tests that confirm various packages can be installed and work together.
=#

using Test, Pkg

ecosystem = [
    (;name="AstroLib", rev="master"),
    (;name="UnitfulAstro", rev="master"),
    (;name="AstroAngles", rev="main"),
    (;name="AstroTime", rev="main"),
    (;name="SkyCoords", rev="master"),
    (;name="WCS", rev="master"),
    (;name="AstroImages", rev="master"),
    (;name="SAOImageDS9", rev="master"),
    (;name="Photometry", rev="main"),
    (;name="PSFModels", rev="main"),
    (;name="CCDReduction", rev="main"),
    (;name="LACosmic", rev="main"),
    (;name="FITSIO", rev="master"),
    (;name="CFITSIO", rev="master"),
    (;name="Cosmology", rev="master"),
    (;name="DustExtinction", rev="master"),
    # (;name= "JPLEphemeris", rev="master"),
    (;name="EarthOrientation", rev="master"),
    (;name="Transits", rev="main"),
    (;name="AstroLib", rev="master"),
]

@testset "Compatible versions exist" begin

    ENV["JULIA_PKG_PRECOMPILE_AUTO"]=0

    for pkgspec in ecosystem
        name, rev = pkgspec
        @test Pkg.add(PackageSpec(;name)) == nothing
    end
    

end

@testset "Development versions compatible" begin

    # Start by testing that we can install all packages
    # Worry if they compile successfully after
    ENV["JULIA_PKG_PRECOMPILE_AUTO"]=0

    for pkgspec in ecosystem
        name, rev = pkgspec
        @test Pkg.add(PackageSpec(;name, rev)) == nothing
    end
    
end

@testset "Precompilation" begin
    @test Pkg.precompile(; strict=true) == nothing
end

@testset "Package loading" begin
    for pkgspec in ecosystem
        name, rev = pkgspec
        @test eval(quote
            @time_imports using $(Symbol(name))
        end) == nothing
    end
end