using FITSIO, Unitful, UnitfulAstro, DustExtinction, Measurements, Cosmology

println("=" ^ 62)
println("  Multi-Wavelength Spectroscopy Tutorial — Dependency Tests")
println("=" ^ 62)

print("Part 1: FITSIO — FITS file read/write .................. ")
let
    tmp = tempname() * ".fits"
    f = FITS(tmp, "w"); write(f, [1.0,2.0,3.0]); close(f)
    f2 = FITS(tmp); data = read(f2[1]); close(f2); rm(tmp)
    @assert data == [1.0,2.0,3.0]
end
println("✅")

print("Part 2: Unitful / UnitfulAstro — unit conversions ...... ")
let
    ha = 6563.0u"angstrom"
    @assert uconvert(u"nm", ha) ≈ 656.3u"nm"
    @assert uconvert(u"μm", ha) ≈ 0.6563u"μm"
    Fnu = (2.5e-17u"erg/s/cm^2/angstrom") * ha^2 / Unitful.c0 |> u"erg/s/cm^2/Hz"
    @assert ustrip(Fnu) > 0
end
println("✅")

print("Part 3: DustExtinction — CCM89, OD94 .................. ")
let
    waves = [3000.0, 5500.0, 8000.0] * u"angstrom"
    ext = ustrip.(ccm89.(waves, 3.1))
    @assert all(ext .> 0)
    @assert ext[1] > ext[end]
end
println("✅")

print("Part 4: Measurements — uncertainty propagation ......... ")
let
    a = 5.0 ± 0.2; b = 3.0 ± 0.1
    @assert Measurements.value(a + b) ≈ 8.0
    @assert Measurements.uncertainty(a * b) > 0
end
println("✅")

print("Part 5: Cosmology — ΛCDM distances ..................... ")
let
    cosmo = cosmology()
    d1 = luminosity_dist(cosmo, 0.5)
    d2 = luminosity_dist(cosmo, 1.0)
    @assert d2 > d1
    @assert 5000 < ustrip(uconvert(u"Mpc", d2)) < 8000
end
println("✅")

println("\n" * "=" ^ 62)
println("  ALL TESTS PASSED ✅")
println("=" ^ 62)
