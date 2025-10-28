function test_packages(mode)
    @testset "Compatibility - $(mode)" begin
        for package in packages_juliaastro
            p_name = package.name
            @info string("Adding: ", p_name)
            @testset "$(p_name)" begin
                if mode == :release
                    @test Pkg.add(chopsuffix(p_name, ".jl")) == nothing
                else
                    @test Pkg.add(url=package.repo) == nothing
                end
            end
        end

        @testset "Precompilation" begin
            @test Pkg.precompile(; strict=true) == nothing
        end

        @testset "Package loading" begin
            for package in packages_juliaastro
                p_name = package.name
                @info string("Loading: ", p_name)
                @testset "$(p_name)" begin
                    @test eval(quote
                        @time_imports using $(Symbol(chopsuffix(p_name, ".jl")))
                    end) == nothing
                end
            end
        end
    end
end
