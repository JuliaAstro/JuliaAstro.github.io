using Revise
using SpectralFitting, Plots
using Profile

DATADIR = "/home/lilith/Developer/jl/datasets/xrism/"
paths = SpectralFitting.SpectralDataPaths(;
    response = joinpath(DATADIR, "rsl_Hp_5eV.rmf"),
    ancillary = joinpath(DATADIR, "rsl_pointsource_GVclosed.arf"),
)

DATADIR = "/home/lilith/Developer/jl/datasets/xspec/walkthrough/"
paths = SpectralFitting.SpectralDataPaths(; response = joinpath(DATADIR, "s54405.rsp"))

_, resp, _, anc = @time SpectralFitting._read_all_ogip(paths)

begin
    model = XS_Gaussian() + XS_Gaussian(E = FitParam(10.0))
    erange = 10 .^ collect(range(log10(4), log10(20.0), 100))
    model2 = GaussianLine() + GaussianLine(μ = FitParam(10.0))
    plot(
        erange[1:(end-1)],
        @time(invokemodel(erange, model)),
        marker = :o,
        markersize = 4,
        label = "XS",
    )
    plot!(
        erange[1:(end-1)],
        @time(invokemodel(erange, model2)),
        marker = :o,
        markersize = 4,
        label = "jl",
    )
    vline!([6.4], label = false)
end

faked = @time OGIPDataset(joinpath(DATADIR, "s54405.fak.fak"))
model = XS_PowerLaw(a = FitParam(2.0), K = FitParam(1.0))

emids = push!(copy(resp.channel_bins_low), last(resp.channel_bins_high))
evald = push!(copy(resp.bins_low), last(resp.bins_high))
out = resp.matrix * invokemodel(evald, model)
plot(emids[1:(end-1)], out)


sims = @time simulate(model, resp, anc; exposure_time = 1e3, seed = 42)
plot(sims, xscale = :log10, yscale = :log10, xlims = (1.0, 30.0), ylims = (1e-6, 100.0))

begin
    sims = @time simulate(model, resp, nothing; exposure_time = 1e5, seed = 42)
    normalize!(faked)
    plot(
        faked,
        xscale = :log10,
        # yscale = :log10,
        xlims = (1.0, 100.0),
        # ylims = (1e-6, 1.0)
    )
    plot!(sims)
    plot!(
        emids[1:(end-1)] .+ diff(emids) ./ 2,
        out .* 1.4,
        xscale = :log10,
        label = "Hand folded",
    )
end

prob = FittingProblem(model => sims)
result = @time fit(prob, LevenbergMarquadt())

plot!(faked, result)


sims = @time simulate(model, resp, anc; exposure_time = 1e3, seed = 42)
plot(
    sims,
    xscale = :log10,
    # yscale = :log10,
    xlims = (1.0, 10.0),
    ylims = (1e-6, 40.0),
)

model = GaussianLine(μ = FitParam(7.0)) + PowerLaw(a = FitParam(0.2))

sims = @time simulate(model, resp, nothing; exposure_time = 1e5, seed = 42)

plot(
    sims,
    xscale = :log10,
    # yscale = :log10,
    xlims = (1.0, 10.0),
)

model = GaussianLine()

result = @time fit(FittingProblem(model => sims), LevenbergMarquadt(); max_iter = 10)
