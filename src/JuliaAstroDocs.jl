module JuliaAstroDocs

using ASDF

# Just use the underlying `OrderedDict` storing our ecosystem data
ecosystem() = delete!(load(joinpath(dirname(@__DIR__), "ecosystem.asdf")).metadata, "asdf_library")

include("ecosystem.jl")
include("comparison.jl")

end # module
