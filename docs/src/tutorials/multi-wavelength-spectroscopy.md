# [Multi-wavelength spectroscopy](@id tutorial-multiwavelength-spectroscopy)

Spectroscopy is one of the most powerful tools in an astronomer's toolkit. By splitting
light into its component wavelengths, we can learn about a source's chemical composition,
temperature, velocity, and much more.

In this tutorial we walk through a realistic end-to-end spectroscopy workflow using:

- [`Spectra.jl`](https://juliaastro.org/Spectra/stable/): core spectral types
- [`Unitful.jl`](https://painterqubits.github.io/Unitful.jl/stable/) + [`UnitfulAstro.jl`](https://juliaastro.org/UnitfulAstro/stable/): physical units
- [`Measurements.jl`](https://github.com/JuliaPhysics/Measurements.jl): uncertainty propagation
- [`DustExtinction.jl`](https://juliaastro.org/DustExtinction/stable/): dust dereddening
- [`Cosmology.jl`](https://juliaastro.org/Cosmology/stable/): cosmological distances
- [CairoMakie](https://docs.makie.org/stable/): plotting

## Setup
```julia
using Unitful, UnitfulAstro, DustExtinction
using Measurements, Cosmology, CairoMakie, SkyCoords
using Spectra
```

## Part 1: Loading a real SDSS spectrum

We use a publicly available spectrum from SDSS DR14 — a galaxy on
plate 1323, MJD 52797, fiber 12. The FITS file stores flux in units
of 10⁻¹⁷ erg s⁻¹ cm⁻² Å⁻¹ and an `ivar` (inverse-variance) column
that encodes real per-pixel measurement uncertainties.
```julia
using Downloads, FITSIO, Unitful, UnitfulAstro, Measurements

# Download the spectrum (skipped if already present)
sdss_url  = "https://dr14.sdss.org/optical/spectrum/view/data/format=fits/spec=lite" *
            "?plateid=1323&mjd=52797&fiberid=12"
sdss_file = joinpath(@__DIR__, "sdss_example.fits")
isfile(sdss_file) || Downloads.download(sdss_url, sdss_file)

# Read spectral columns
f        = FITS(sdss_file)
loglam   = read(f[2], "loglam")   # log₁₀(λ / Å)
flux_raw = read(f[2], "flux")     # 10⁻¹⁷ erg s⁻¹ cm⁻² Å⁻¹
ivar     = read(f[2], "ivar")     # inverse variance
close(f)

# Convert wavelength + attach units
wave_raw = 10 .^ loglam            # Å (plain numbers for dust map)
wave_aa  = wave_raw .* u"angstrom" # with units

# Real per-pixel σ from ivar: σ = 1/√ivar
sigma_raw = map(iv -> iv > 0 ? 1/sqrt(iv) : 0.0, ivar)

# Attach units + Measurements.jl uncertainties
flux_meas = ((flux_raw .± sigma_raw) .* 1e-17) * u"erg/s/cm^2/angstrom"

using Spectra
spec = spectrum(wave_aa, flux_meas)

println("Wavelength : ", round(wave_raw[1], digits=1),
        " — ",  round(wave_raw[end], digits=1), " Å")
println("Pixels     : ", length(wave_raw))
println("Example px : ", flux_meas[100])   # shows value ± uncertainty
```

Plot the spectrum with its uncertainty band:
```julia
wv = ustrip.(wave_aa)
fv = Measurements.value.(ustrip.(flux_meas))
fe = Measurements.uncertainty.(ustrip.(flux_meas))

fig, ax = lines(wv, fv;
    axis = (xlabel = "Wavelength (Å)",
            ylabel = "Flux Density (erg s⁻¹ cm⁻² Å⁻¹)",
            title  = "SDSS Galaxy — plate 1323, fiber 12"))
band!(ax, wv, fv .- fe, fv .+ fe; color = (:steelblue, 0.3))
fig
```

## Part 2: Physical unit conversions

[`Unitful.jl`](https://painterqubits.github.io/Unitful.jl/stable/) makes it easy to
convert between wavelength, frequency, and energy representations.
```julia
Ha_aa = 6563.0u"angstrom"
println("Hα = ", Ha_aa,
        " = ", uconvert(u"nm", Ha_aa),
        " = ", uconvert(u"μm", Ha_aa))

# Convert Fλ → Fν (Jansky)
c0  = 2.99792458e18u"angstrom/s"
Fla = 2.5e-17u"erg/s/cm^2/angstrom"
Fnu = uconvert(u"erg/s/cm^2/Hz", Fla * Ha_aa^2 / c0)
println("Fλ = ", Fla)
println("Fν = ", uconvert(u"Jy", Fnu))
```

## Part 3: Dust extinction and dereddening

We use [`DustExtinction.jl`](https://juliaastro.org/DustExtinction/stable/) with the
Schlegel, Finkbeiner & Davis (1998) dust map and the CCM89 extinction law.
```julia
# Convert RA/Dec → Galactic coordinates for SFD98 dust map
eq  = ICRSCoords(deg2rad(178.90417), deg2rad(0.66278))
gal = convert(GalCoords, eq)

dustmap = SFD98Map()
ebv     = dustmap(rad2deg(gal.l), rad2deg(gal.b))
Av      = 3.1 * ebv
println("E(B-V) = ", round(ebv, digits=4), "  Av = ", round(Av, digits=4), " mag")

# Apply CCM89 extinction law
ext   = CCM89(Rv = 3.1)
tau   = [ustrip(ext(w * u"angstrom")) * Av for w in wave_raw]
corr  = 10 .^ (tau ./ 2.5)

fv_raw = Measurements.value.(ustrip.(spec.flux))
fv_ded = fv_raw .* corr

fig2, ax2 = lines(wv, fv_raw; label = "Raw",
    axis = (xlabel = "Wavelength (Å)",
            ylabel = "Flux Density (erg s⁻¹ cm⁻² Å⁻¹)",
            title  = "CCM89 Dust Dereddening"))
lines!(ax2, wv, fv_ded; label = "Dereddened", color = :orange)
axislegend(ax2)
fig2
```

## Part 4: Blackbody spectra and stellar luminosity density

`blackbody` returns spectral radiance B(λ, T). The stellar luminosity density is:
```math
L_\lambda(\lambda, T) = 4\pi^2 R^2 \, B(\lambda, T)
```
```julia
R_sun    = 6.957e10u"cm"

# Wavelength and temperature must carry units
wave_bb  = collect(range(3000, 10000, length = 500)) .* u"angstrom"
bb_solar = blackbody(wave_bb, 5778.0u"K")
B_solar  = bb_solar.flux
L_solar  = 4π^2 .* R_sun.^2 .* B_solar

println("BB peak radiance : ",
        round(maximum(ustrip.(B_solar)), sigdigits = 3), " erg/s/cm²/Å/sr")
println("Peak L_λ (1 R☉) : ",
        round(ustrip(uconvert(u"erg/s/angstrom", maximum(L_solar))), sigdigits = 3),
        " erg/s/Å")

# Compare multiple temperatures — wave_synth with units
wave_synth = collect(range(1000, 20000, length = 1000)) .* u"angstrom"
temps      = [3_000u"K", 6_000u"K", 10_000u"K", 30_000u"K"]
labels_bb  = ["3 000 K", "6 000 K", "10 000 K", "30 000 K"]
colors_bb  = [:red, :orange, :steelblue, :purple]

fig3, ax3 = lines(ustrip.(wave_synth),
                  ustrip.(blackbody(wave_synth, temps[1]).flux);
    label = labels_bb[1], color = colors_bb[1],
    axis  = (xlabel = "Wavelength (Å)",
             ylabel = "Flux Density (erg s⁻¹ cm⁻² Å⁻¹ sr⁻¹)",
             title  = "Blackbody Spectra"))
for (T, lab, col) in zip(temps[2:end], labels_bb[2:end], colors_bb[2:end])
    lines!(ax3, ustrip.(wave_synth),
           ustrip.(blackbody(wave_synth, T).flux);
           label = lab, color = col)
end
axislegend(ax3, position = :rt)
fig3
```

## Part 5: Cosmological redshift and surface-brightness dimming

For a source at redshift z, the observed flux density is:
```math
F_\lambda^{\rm obs}(\lambda_{\rm obs}) =
\frac{(1+z)\,L_\lambda(\lambda_{\rm rest})}{4\pi\,d_L^2}
```
```julia
cosmo     = cosmology()
wave_rest = collect(range(3000, 10000, length = 500)) .* u"angstrom"
bb_rest   = blackbody(wave_rest, 10_000u"K")
L_lam     = 4π^2 .* R_sun.^2 .* bb_rest.flux

fig4, ax4 = lines(ustrip.(wave_rest), ustrip.(bb_rest.flux);
    label = "z = 0", color = :black,
    axis  = (xlabel = "Wavelength (Å)",
             ylabel = "Flux Density (erg s⁻¹ cm⁻² Å⁻¹)",
             title  = "Cosmological Surface-Brightness Dimming"))

for (z, col) in zip([0.5, 1.0, 2.0], [:blue, :green, :red])
    d_L   = uconvert(u"cm", luminosity_dist(cosmo, z))
    w_obs = wave_rest .* (1 + z)
    F_obs = L_lam .* (1 + z) ./ (4π .* d_L.^2)
    lines!(ax4, ustrip.(w_obs), ustrip.(F_obs); label = "z = $z", color = col)
end
axislegend(ax4, position = :rt)
fig4
```
