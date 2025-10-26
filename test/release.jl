@testset "Latest release versions are compatible" begin
    for package in packages_juliaastro
        p_name = package.name
        # TODO: Include in testing when next release after v0.11.0
        p_name == "GeneralAstroDynamics" && continue
        @testset "$(p_name)" begin
            @test Pkg.add(chopsuffix(p_name, ".jl")) == nothing
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
