var documenterSearchIndex = {"docs":
[{"location":"api/#API/Reference","page":"API/Reference","title":"API/Reference","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"Modules = [BoxLeastSquares]","category":"page"},{"location":"api/#BoxLeastSquares.BLS","page":"API/Reference","title":"BoxLeastSquares.BLS","text":"BLS(t, y, [yerr]; duration, periods=autoperiod(t, duration), objective=:likelihood, oversample=10)\n\n\n\n\n\n","category":"function"},{"location":"api/#BoxLeastSquares.autoperiod-Union{Tuple{T}, Tuple{AbstractVector{T}, Any}} where T","page":"API/Reference","title":"BoxLeastSquares.autoperiod","text":"autoperiod(t, duration;\n    minimum_n_transit=3, frequency_factor=1.0,\n    [minimum_period, maximum_period])\n\nAutomatically determine a period grid from the given times and duration(s). Periods are selected such that at least minimum_n_trasnit transits occur. The default minimum period is twice the maximum duration. The default maximum period is (maximum(t) - minimum(t)) / (minimum_n_transit - 1). The frequency factor changes the granularity in frequency space- a smaller frequency factor will create a finer period grid.\n\n\n\n\n\n","category":"method"},{"location":"api/#BoxLeastSquares.model","page":"API/Reference","title":"BoxLeastSquares.model","text":"BoxLeastSquares.model(t, y, [yerr]; period, duration, t0)\n\nEvaluate the transit model on the given time grid. If yerr is not provided, it will default to 1. The following transit parameters must be set:\n\nperiod orbital period in the same units as t\nduration the transit duration in the same units as t\nt0 the transit time (middle of transit) in the same units as t\n\nIf you are using Unitful.jl, the unit conversions will be made automatically.\n\n\n\n\n\n","category":"function"},{"location":"api/#BoxLeastSquares.model-Tuple{BoxLeastSquares.BLSPeriodogram}","page":"API/Reference","title":"BoxLeastSquares.model","text":"BoxLeastSquares.model(::BLSPeriodogram; kwargs...)\n\nCreate a transit model using the data and best-fitting parameters from the given BLS periodogram. Any keyword parameters can be overriden.\n\n\n\n\n\n","category":"method"},{"location":"api/#BoxLeastSquares.params-Tuple{BoxLeastSquares.BLSPeriodogram}","page":"API/Reference","title":"BoxLeastSquares.params","text":"BoxLeastSquares.params(::BLSPeriodogram)\n\nReturn the transit parameters for the best fitting period. Returns period, duration, t0, and power.\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = BoxLeastSquares","category":"page"},{"location":"#BoxLeastSquares.jl","page":"Home","title":"BoxLeastSquares.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: GitHub) (Image: Build Status) (Image: PkgEval) (Image: Coverage) (Image: License)","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"To install use Pkg. From the REPL, press ] to enter Pkg-mode","category":"page"},{"location":"","page":"Home","title":"Home","text":"pkg> add BoxLeastSquares","category":"page"},{"location":"","page":"Home","title":"Home","text":"If you want to use the most up-to-date version of the code, check it out from main","category":"page"},{"location":"","page":"Home","title":"Home","text":"pkg> add BoxLeastSquares#main","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"First, import the package","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using BoxLeastSquares","category":"page"},{"location":"","page":"Home","title":"Home","text":"you can optionally alias the package name, too","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> import BoxLeastSquares as BLS","category":"page"},{"location":"","page":"Home","title":"Home","text":"now, load some data. If you don't have an estimate of the y error it will default to 1.","category":"page"},{"location":"","page":"Home","title":"Home","text":"DocTestSetup = quote\n    using StableRNGs\n    rng = StableRNG(3351)\n    t = 10 .* rand(rng, 1000);\n    yerr = 5e-3 .* (rand(rng, 1000) .+ 1)\n    P = 2; t0 = 0.5; dur = 0.16; depth = 0.2;\n    mask = @. abs((t - t0 + 0.5P) % P - 0.5P) < 0.5dur;\n    y = @. ifelse(mask, 1 - depth, 1);\n    y .+= yerr .* randn(rng, 1000)\n    load_data() = t, y, yerr\nend","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> t, y, yerr = load_data(); # load data somehow","category":"page"},{"location":"","page":"Home","title":"Home","text":"The primary interface is through the BLS method","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> result = BLS(t, y, yerr; duration=0.16)\nBLSPeriodogram\n==============\ninput dim: 1000\noutput dim: 1820\nperiod range: 0.32 - 5.014724142709022\nduration range: 0.16 - 0.16\nobjective: likelihood\n\nparameters\n----------\nperiod: 1.99930396919953\nduration: 0.16\nt0: 0.5001330656464655\ndepth: 0.19594118110109113 ± 0.0008688097746093883\nsnr: 225.52828804117118\nlog-likelihood: 27396.365214805144","category":"page"},{"location":"","page":"Home","title":"Home","text":"to extract the parameters in a convenient named tuple use BoxLeastSquares.params","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> BoxLeastSquares.params(result)\n(power = 27396.365214805144, period = 1.99930396919953, duration = 0.16, t0 = 0.5001330656464655, depth = 0.19594118110109113, depth_err = 0.0008688097746093883, snr = 225.52828804117118, loglike = 27396.365214805144)","category":"page"},{"location":"","page":"Home","title":"Home","text":"The period grid was automatically determined using autoperiod, but you can supply your own, too:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> periods = range(log(2) - 0.1, log(2) + 0.1, length=1000);\n\njulia> result_fine = BLS(t, y, yerr; duration=0.12:0.20, periods=periods)\nBLSPeriodogram\n==============\ninput dim: 1000\noutput dim: 1000\nperiod range: 0.5931471805599453 - 0.7931471805599453\nduration range: 0.12 - 0.12\nobjective: likelihood\n\nparameters\n----------\nperiod: 0.668822856235621\nduration: 0.12\nt0: 0.49613306564646553\ndepth: 0.06949975333493467 ± 0.0005991935962031148\nsnr: 115.98881192210811\nlog-likelihood: 8087.810929044984","category":"page"},{"location":"#Unitful.jl","page":"Home","title":"Unitful.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"BoxLeastSquares.jl is fully compatible with the Unitful.jl (although it is not a dependency of the library). For example","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Unitful\n\njulia> tu = t * u\"d\";\n\njulia> results_units = BLS(tu, y, yerr; duration=(10:14)u\"hr\")\nBLSPeriodogram\n==============\ninput dim: 1000\noutput dim: 158\nperiod range: 1.1666666666666665 d - 5.010959571954422 d\nduration range: 10 hr - 14 hr\nobjective: likelihood\n\nparameters\n----------\nperiod: 2.04681966153818 d\nduration: 10 hr\nt0: 0.3791330656464655 d\ndepth: 0.0788086190813451 ± 0.0005822150269728557\nsnr: 135.35998802899218\nlog-likelihood: 11186.069545672593","category":"page"},{"location":"#Contributing-and-Support","page":"Home","title":"Contributing and Support","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"If you would like to contribute, feel free to open a pull request. If you want to discuss something before contributing, head over to discussions and join or open a new topic. If you're having problems with something, open an issue.","category":"page"}]
}
