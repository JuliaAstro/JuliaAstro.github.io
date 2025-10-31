# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

function _precess_xyz{T<:AbstractFloat}(x::T, y::T, z::T, equinox1::T, equinox2::T)
    ra  = atan2(y, x)
    del = vecnorm((x, y, z)) #  Magnitude of distance to Sun
    dec = asin(z/del)
    # precess the ra and dec
    ra, dec = precess(ra, dec, equinox1, equinox2, radians=true)
    # convert back to x, y, z
    xunit = cos(ra)*cos(dec)
    yunit = sin(ra)*cos(dec)
    zunit = sin(dec)
    return xunit*del, yunit*del, zunit*del
end

"""
    precess_xyz(x, y, z, equinox1, equinox2) -> prec_x, prec_y, prec_z

### Purpose ###

Precess equatorial geocentric rectangular coordinates.

### Arguments ###

* `x`, `y`, `z`: scalars or vectors giving heliocentric rectangular coordinates.
* `equinox1`: original equinox of coordinates, numeric scalar.
* `equinox2`: equinox of precessed coordinates, numeric scalar.

Input coordinates can be given also a 3-tuple `(x, y, z)`.

### Output ###

The 3-tuple `(x, y, z)` of coordinates modified by precession.

### Example ###

Precess 2000 equinox coordinates `(1, 1, 1)` to 2050.

``` julia
precess_xyz(1, 1, 1, 2000, 2050)
# => (0.9838854500981734,1.0110925876508692,1.0048189888146941)
```

### Method ###

The equatorial geocentric rectangular coordinates are converted to right
ascension and declination, precessed in the normal way, then changed back to
`x`, `y` and `z` using unit vectors.

### Notes ###

Code of this function is based on IDL Astronomy User's Library.
"""
precess_xyz(x::Real, y::Real, z::Real,
            equinox1::Real, equinox2::Real) =
                _precess_xyz(promote(float(x), float(y), float(z),
                                     float(equinox1), float(equinox2))...)

precess_xyz(xyz::Tuple{Real, Real, Real}, equinox1::Real, equinox2::Real) =
    precess_xyz(xyz..., equinox1, equinox2)

function precess_xyz{X<:Real, Y<:Real, Z<:Real}(x::AbstractArray{X},
                                                y::AbstractArray{Y},
                                                z::AbstractArray{Z},
                                                equinox1::Real,
                                                equinox2::Real)
    @assert length(x) == length(y) == length(z) "x, y, z arrays should be of the same length"
    typex = typeof(float(one(X)))
    x_out = similar(x, typex)
    y_out = similar(x, typex)
    z_out = similar(x, typex)
    for i in eachindex(x)
        x_out[i], y_out[i], z_out[i] = precess_xyz(x[i], y[i], z[i],
                                                   equinox1, equinox2)
    end
    return x_out, y_out, z_out
end
