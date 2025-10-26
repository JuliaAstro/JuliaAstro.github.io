@testset "Development versions are compatible" begin
    ENV["JULIA_PKG_PRECOMPILE_AUTO"] = 0

    for package in packages_juliaastro
        @testset "$(package.name)" begin
            @test Pkg.add(url=package.repo) == nothing
        end
    end

    @testset "Precompilation" begin
        @test Pkg.precompile(; strict=true) == nothing
    end

    @testset "Package loading" begin
        for package in packages_juliaastro
            @testset "$(package.name)" begin
                @test eval(quote
                    @time_imports using $(Symbol(chopsuffix(package.name, ".jl")))
                end) == nothing
            end
        end
    end
end
