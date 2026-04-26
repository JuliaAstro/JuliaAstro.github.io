function test_packages(mode)
    @testset "Compatibility - $(mode)" begin
        for package in packages_juliaastro
            p_name = package.name
            @info string("Adding: ", p_name)
            @testset "$(p_name)" begin
                if mode == :release
                    if p_name == "ASDF.jl"
                        # TODO: Register ASDF.jl v2 (v1 Python version currently broken)
                        @test_skip p_name
                    elseif p_name == "Spectra.jl"
                        # TODO: Register SpectrumBase.jl
                        @test_skip p_name
                    elseif p_name == "GeneralAstrodynamics.jl"
                        @test_skip p_name
                    else
                        @test Pkg.add(chopsuffix(p_name, ".jl")) == nothing
                    end
                elseif mode == :dev
                    if p_name == "GeneralAstrodynamics.jl"
                        # https://github.com/JuliaAstro/GeneralAstrodynamics.jl/pull/275
                        repo = "https://github.com/JuliaAstro/GeneralAstrodynamics.jl"
                        Pkg.add([
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalCalculations"),
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalModels"),
                            Pkg.PackageSpec(; url = repo, subdir = "lib/AstrodynamicalSolvers"),
                            Pkg.PackageSpec(; url = repo),
                        ])
                        @test Pkg.add(url = "https://github.com/JuliaAstro/GeneralAstrodynamics.jl") == nothing
                    else
                        @test Pkg.add(url=package.repo) == nothing
                    end
                else
                    throw(ArgumentError("`mode` argument to `test_packages` must be either `:release` or `:dev`."))
                end
            end
        end

        @testset "Precompilation" begin
            @test Pkg.precompile(; strict = true) == nothing
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
