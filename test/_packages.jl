function test_packages(mode)
    Pkg.activate(; temp = true)
    @testset "Compatibility - $(mode)" begin
        for (p_name, package) in packages_juliaastro
            @info string("Adding: ", p_name)
            @testset "$(p_name)" begin
                if mode == :release
                    if p_name ∈ NOT_REGISTERED
                        @test_skip p_name
                    else
                        @info "Adding package" p_name
                        @test Pkg.add(chopsuffix(p_name, ".jl")) == nothing
                    end
                elseif mode == :dev
                    if p_name == "GeneralAstrodynamics.jl"
                        # TODO: https://github.com/JuliaAstro/GeneralAstrodynamics.jl/pull/275
                        repo = "https://github.com/JuliaAstro/GeneralAstrodynamics.jl"
                        Pkg.add([
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalCalculations"),
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalModels"),
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalSolvers"),
                            Pkg.PackageSpec(; url = repo),
                        ])
                        @test Pkg.add(url = "https://github.com/JuliaAstro/GeneralAstrodynamics.jl") == nothing
                    else
                        @test Pkg.add(url = package["repo"]) == nothing
                    end
                else
                    throw(ArgumentError("`mode` argument to `test_packages` must be either `:release` or `:dev`."))
                end
            end
        end

        @testset "Precompilation" begin
            @test (Pkg.precompile(; strict = true); true)
        end

        @testset "Package loading" begin
            for (p_name, package) in packages_juliaastro
                if mode == :release && p_name ∈ NOT_REGISTERED
                    continue
                end
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
