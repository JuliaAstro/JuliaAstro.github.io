#=
This file defines integration tests for the JuliaAstro package ecosystem.

These are tests that confirm various packages can be installed and work together.
=#

using Test, Pkg, InteractiveUtils

Pkg.develop(path="..")
import JuliaAstroDocs

ecos = JuliaAstroDocs.ecosystem

packages_juliaastro = Iterators.filter(p for (h, ps) in ecos for p in ps) do package
    occursin("juliaastro", lowercase(package.repo))
end

@testset "JuliaAstro Package Evalauation" begin
    @testset "Compatible versions exist" begin
        ENV["JULIA_PKG_PRECOMPILE_AUTO"] = 0
        for package in packages_juliaastro
            @testset "$(package.name)" begin
                @test Pkg.add(chopsuffix(package.name, ".jl")) == nothing
            end
        end
    end

    @testset "Development versions compatible" begin
        # Start by testing that we can install all packages
        # Worry if they compile successfully after
        ENV["JULIA_PKG_PRECOMPILE_AUTO"] = 0

        for package in packages_juliaastro
            @testset "$(package.name)" begin
                @test Pkg.add(url=package.repo) == nothing
            end
        end
    end

    @testset "Precompilation" begin
        @test Pkg.precompile(; strict=true) == nothing
    end

    @testset "Package loading" begin
        for package in packages_juliaastro
            @test eval(quote
                @time_imports using $(Symbol(chopsuffix(package.name, ".jl")))
            end) == nothing
        end
    end
end
