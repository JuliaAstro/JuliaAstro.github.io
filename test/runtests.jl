#=
This file defines integration tests for the JuliaAstro package ecosystem.

These are tests that confirm various packages can be installed and work together.
=#

using Test, Pkg

include("pages.jl")

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