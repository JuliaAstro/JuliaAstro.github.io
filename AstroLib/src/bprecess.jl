# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

const Mbprec =
    reshape([+0.9999256795,      -0.0111814828,      -0.0048590040,
             -0.000551,          -0.238560,          +0.435730,
             +0.0111814828,      +0.9999374849,      -0.0000271557,
             +0.238509,          -0.002667,          -0.008541,
             +0.0048590039,      -0.0000271771,      +0.9999881946,
             -0.435614,          +0.012254,          +0.002117,
             -0.00000242389840,  +0.00000002710544,  +0.00000001177742,
             +0.99990432,        -0.01118145,        -0.00485852,
             -0.00000002710544,  -0.00000242392702,  +0.00000000006585,
             +0.01118145,        +0.99991613,        -0.00002716,
             -0.00000001177742,  +0.00000000006585,  -0.00000242404995,
             +0.00485852,        -0.00002717,        +0.99996684], 6, 6)

# Note: IDL version of `bprecess' changes in-place "muradec", "parallax" and
# "radvel".  We don't do anything like this, but calculations are below,
# commented, in case someone is interested.
function _bprecess{T<:AbstractFloat}(ra::T, dec::T, parallax::T,
                                     radvel::T, epoch::T, muradec::Vector{T})
    @assert length(muradec) == 2
    cosra  = cosd(ra)
    sinra  = sind(ra)
    cosdec = cosd(dec)
    sindec = sind(dec)
    ra1950 = dec1950 = zero(T)
    A  = copy(A_precess)
    r0 = [cosra*cosdec,  sinra*cosdec,  sindec]
    r0_dot = [-muradec[1]*sinra*cosdec - muradec[2]*cosra*sindec,
               muradec[1]*cosra*cosdec - muradec[2]*sinra*sindec,
               muradec[2]*cosdec] + 21.095*radvel*parallax*r0
    R_0 = vcat(r0, r0_dot)
    R_1 = Mbprec*R_0
    r1 = R_1[1:3]
    r1_dot = R_1[4:6]
    if isfinite(epoch)
        r1 += deg2rad.(r1_dot*(epoch - 1950.0)*inv(360000.0))
        A  += deg2rad.(A_dot_precess*(epoch - 1950.0)*inv(360000.0))
    end
    rmag = vecnorm(r1)
    s1 = r1*inv(rmag)
    s1_dot = r1_dot*inv(rmag)
    r = Array{T}(3)
    s = s1
    for j = 0:2
        r = s1 + A - sum(s.*A)*s
        s = r*inv(rmag)
    end
    rmag = vecnorm(r)
    # r_dot = s1_dot + A_dot_precess - sum(s.*A_dot_precess)*s
    x = r[1]
    y = r[2]
    z = r[3]
    # x_dot = r_dot[1]
    # y_dot = r_dot[2]
    # z_dot = r_dot[3]
    # muradec[1] = (x*y_dot - y*x_dot)/(x*x + y*y)
    # muradec[2] = (z_dot*(x*x + y*y) - z*(x*x_dot + y*y_dot))/(rmag*rmag*hypot(x, y))
    dec1950 = asin(z*inv(rmag))
    ra1950  = atan2(y, x)
    # if parallax > 0
    #     radvel = (x*x_dot + y*y_dot + z*z_dot)/(21.095*parallax*rmag)
    #     parallax = parallax*inv(rmag)
    # end
    if ra1950 < 0
        ra1950 += 2pi
    end
    ra1950  = rad2deg(ra1950)
    dec1950 = rad2deg(dec1950)
    return ra1950, dec1950
end

# Main interface.
bprecess{R<:Real}(ra::Real, dec::Real, muradec::Vector{R};
                  parallax::Real=0.0, radvel::Real=0.0) =
                      _bprecess(promote(float(ra), float(dec), float(parallax),
                                        float(radvel), NaN)...,
                                float(muradec))

bprecess(ra::Real, dec::Real, epoch::Real=2000.0) =
    _bprecess(promote(float(ra), float(dec), 0.0, 0.0, float(epoch))...,
              zeros(typeof(float(ra)), 2))

# Tuple arguments.
bprecess{R1<:Real,R2<:Real,R3<:Real}(radec::Tuple{R1,R2}, muradec::Vector{R3};
                                     parallax::Real=0.0, radvel::Real=0.0) =
                                         bprecess(radec..., muradec,
                                                  parallax=parallax,
                                                  radvel=radvel)

bprecess{R1<:Real,R2<:Real}(radec::Tuple{R1,R2}, epoch::Real=2000.0) =
    bprecess(radec..., epoch)

# Vectorial arguments.
function bprecess{R<:Real,D<:Real,M<:Real,P<:Real,V<:Real}(ra::AbstractArray{R},
                                                           dec::AbstractArray{D},
                                                           muradec::AbstractArray{M};
                                                           parallax::AbstractArray{P}=zeros(R, length(ra)),
                                                           radvel::AbstractArray{V}=zeros(R, length(ra)))
    @assert length(ra) == length(dec) == size(muradec)[2] == length(parallax) == length(radvel)
    typer = typeof(float(one(R)))
    ra1950  = similar(ra, typer)
    dec1950 = similar(dec, typer)
    for i in eachindex(ra)
        ra1950[i], dec1950[i] = bprecess(ra[i], dec[i], muradec[:,i],
                                         parallax=parallax[i], radvel=radvel[i])
    end
    return ra1950, dec1950
end

function bprecess{R<:Real,D<:Real}(ra::AbstractArray{R},
                                   dec::AbstractArray{D},
                                   epoch::Real=2000.0)
    @assert length(ra) == length(dec)
    typer = float(R)
    ra1950  = similar(ra, typer)
    dec1950 = similar(dec, typer)
    for i in eachindex(ra)
        ra1950[i], dec1950[i] = bprecess(ra[i], dec[i], epoch[i])
    end
    return ra1950, dec1950
end

"""
    bprecess(ra, dec[, epoch]) -> ra1950, dec1950
    bprecess(ra, dec, muradec[, parallax=parallax, radvel=radvel]) -> ra1950, dec1950

### Purpose ###

Precess positions from J2000.0 (FK5) to B1950.0 (FK4).

### Explanation ###

Calculates the mean place of a star at B1950.0 on the FK4 system from the mean
place at J2000.0 on the FK5 system.

`bprecess` function has two methods, one for each of the following cases:

* the proper motion is known and non-zero
* the proper motion is unknown or known to be exactly zero (i.e. extragalactic
  radio sources).  Better precision can be achieved in this case by inputting
  the epoch of the original observations.

### Arguments ###

The function has 2 methods.  The common mandatory arguments are:

* `ra`: input J2000 right ascension, in degrees.
* `dec`: input J2000 declination, in degrees.

The two methods have a different third argument (see "Explanation" section for
more details).  It can be one of the following:

* `muradec`: 2-element vector containing the proper motion in seconds of arc
  per tropical *century* in right ascension and declination.
* `epoch`: scalar giving epoch of original observations.

If none of these two arguments is provided (so `bprecess` is fed only with right
ascension and declination), it is assumed that proper motion is exactly zero and
`epoch = 2000`.

If it is used the method involving `muradec` argument, the following keywords
are available:

* `parallax` (optional numerical keyword): stellar parallax, in seconds of arc.
* `radvel` (optional numerical keyword): radial velocity in km/s.

Right ascension and declination can be passed as the 2-tuple `(ra, dec)`.  You
can also pass `ra`, `dec`, `parallax`, and `radvel` as arrays, all of the same
length N.  In that case, `muradec` should be a matrix 2×N.

### Output ###

The 2-tuple of right ascension and declination in 1950, in degrees, of input
coordinates is returned.  If `ra` and `dec` (and other possible optional
arguments) are arrays, the 2-tuple of arrays `(ra1950, dec1950)` of the same
length as the input coordinates is returned.

### Method ###

The algorithm is taken from the Explanatory Supplement to the Astronomical
Almanac 1992, page 186.  See also Aoki et al (1983), A&A, 128, 263.  URL:
http://adsabs.harvard.edu/abs/1983A%26A...128..263A.

### Example ###

The SAO2000 catalogue gives the J2000 position and proper motion for the star HD
119288.  Find the B1950 position.

* RA(2000) = 13h 42m 12.740s
* Dec(2000) = 8d 23' 17.69''
* Mu(RA) = -.0257 s/yr
* Mu(Dec) = -.090 ''/yr

``` julia
muradec = 100*[-15*0.0257, -0.090]; # convert to century proper motion
ra = ten(13, 42, 12.74)*15;
decl = ten(8, 23, 17.69);
adstring(bprecess(ra, decl, muradec), precision=2)
# => " 13 39 44.526  +08 38 28.63"
```

### Notes ###

"When transferring individual observations, as opposed to catalog mean place,
the safest method is to tranform the observations back to the epoch of the
observation, on the FK4 system (or in the system that was used to to produce the
observed mean place), convert to the FK5 system, and transform to the the epoch
and equinox of J2000.0" -- from the Explanatory Supplement (1992), p. 180

`jprecess` performs the precession to J2000 coordinates.

Code of this function is based on IDL Astronomy User's Library.
"""
bprecess
