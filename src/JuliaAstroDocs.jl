module JuliaAstroDocs

using ASDF: load
using TypedTables: Table

stake! = String ∘ take!

load_ecosystem() = load(joinpath(dirname(@__DIR__), "ecosystem.asdf"))

function ecosystem()
    d = load_ecosystem().metadata
    delete!(d, "asdf/library")
    return d
end

include("ecosystem.jl")
include("comparison.jl")

end
