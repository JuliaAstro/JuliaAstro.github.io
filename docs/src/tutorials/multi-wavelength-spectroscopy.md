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

## Part 1: Creating a spectrum

We build a synthetic galaxy spectrum — a smooth stellar continuum plus an Hα emission line.
```julia
using Unitful, UnitfulAstro, Measurements, CairoMakie, SkyCoords
using Spectra, DustExtinction, Cosmology

# Synthetic galaxy: continuum + Hα emission line
wave_raw  = collect(range(3815.0, 9206.6, length = 3827))
flux_raw  = @. 2.5e-17 * exp(-((wave_raw - 6000.0)/2000.0)^2) +
               8e-16   * exp(-((wave_raw - 6563.0)/5.0)^2)

# 5% per-pixel noise (simulating SDSS ivar: σ = 1/√ivar)
sigma_raw = abs.(flux_raw) .* 0.05 .+ 1e-18

# Attach physical units + Measurements.jl uncertainties
wave_aa   = wave_raw .* u"angstrom"
flux_meas = measurement.(flux_raw, sigma_raw) .* (1e-17u"erg/s/cm^2/angstrom")

spec = spectrum(wave_aa, flux_meas)
println("Wavelength : ", round(wave_raw[1], digits=1),
        " – ", round(wave_raw[end], digits=1), " Å")
println("Pixels     : ", length(wave_raw))
```

Plot the spectrum with its uncertainty band:
```julia
wv = ustrip.(spec.wave)
fv = Measurements.value.(ustrip.(spec.flux))
fe = Measurements.uncertainty.(ustrip.(spec.flux))

fig, ax = lines(wv, fv;
    axis = (xlabel = "Wavelength (Å)",
            ylabel = "Flux Density (erg s⁻¹ cm⁻² Å⁻¹)",
            title  = "Synthetic Galaxy Spectrum"))
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
