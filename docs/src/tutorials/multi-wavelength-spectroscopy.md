# [Multi-wavelength spectroscopy](@id tutorial-multiwavelength-spectroscopy)

Spectroscopy is one of the most powerful tools in an astronomer's toolkit. By splitting
light into its component wavelengths, we can learn about a source's chemical composition,
temperature, velocity, and much more.

In this tutorial we walk through a realistic workflow: downloading a real SDSS optical
spectrum, loading it with [`FITSIO.jl`](https://juliaastro.org/FITSIO/stable/), wrapping
it in a `Spectrum` object with physical units via
[`UnitfulAstro.jl`](https://juliaastro.org/UnitfulAstro/stable/), applying dust corrections
with [`DustExtinction.jl`](https://juliaastro.org/DustExtinction/stable/), propagating
uncertainties with [`Measurements.jl`](https://juliaphysics.github.io/Measurements.jl/stable/),
and computing cosmological distances with
[`Cosmology.jl`](https://juliaastro.org/Cosmology/stable/).

!!! note
    This tutorial uses Julia 1.9+. `Spectra.jl` is under active development and installed
    from GitHub. Code blocks show the intended API; some call signatures may evolve.

## Packages
```
pkg> add FITSIO Unitful UnitfulAstro DustExtinction Measurements Cosmology Plots
pkg> add https://github.com/JuliaAstro/Spectra.jl
```

| Package | Role |
|---|---|
| `FITSIO` | Read spectral data from FITS binary tables |
| `Spectra` | Core `Spectrum` type, blackbody, reddening |
| `DustExtinction` | Empirical extinction laws (CCM89, OD94, CAL00) |
| `Unitful` / `UnitfulAstro` | Physical units — Å, nm, Jy, erg/s/cm²/Å |
| `Measurements` | Automatic uncertainty propagation |
| `Cosmology` | ΛCDM luminosity distances |
| `Plots` | Visualisation |

---

## Part 1: Loading a real SDSS spectrum

We work with a publicly available spectrum from SDSS DR14 — a galaxy observed on
plate 1323, MJD 52797, fiber 12. The FITS file stores the coadded spectrum as a
binary table with log₁₀-spaced wavelengths and calibrated flux in units of
10⁻¹⁷ erg/s/cm²/Å.

### Downloading the data
```julia
using Downloads

sdss_url = "https://dr14.sdss.org/optical/spectrum/view/data/format=fits/spec=lite" *
           "?plateid=1323&mjd=52797&fiberid=12"
sdss_file = joinpath(@__DIR__, "sdss_example.fits")

if !isfile(sdss_file)
    Downloads.download(sdss_url, sdss_file)
end
```

### Reading the FITS file
```julia
using FITSIO, Unitful, UnitfulAstro

f        = FITS(sdss_file)
loglam   = read(f[2], "loglam")
flux_raw = read(f[2], "flux")
ivar     = read(f[2], "ivar")

wave = (10 .^ loglam) * u"angstrom"
flux = (flux_raw .* 1e-17) * u"erg/s/cm^2/angstrom"
close(f)

println("Wavelength range : ", minimum(wave), " — ", maximum(wave))
println("Number of pixels : ", length(wave))
```

### Creating a Spectrum object
```julia
using Spectra

spec = spectrum(wave, flux)
println(spec)
```

### Plotting the raw spectrum
```julia
using Plots

waves  = spectral_axis(spec)
fluxes = flux_axis(spec)

plot(ustrip.(waves), ustrip.(fluxes),
    xlabel  = "Wavelength (Å)",
    ylabel  = "Flux  (erg s⁻¹ cm⁻² Å⁻¹)",
    title   = "SDSS Galaxy — plate 1323, fiber 12",
    legend  = false, lw = 0.5, color = :steelblue, size = (800, 400))
```

---

## Part 2: Working with physical units

### Wavelength conversions
```julia
ha_wave = 6563.0u"angstrom"

ha_nm = uconvert(u"nm",  ha_wave)
ha_um = uconvert(u"μm",  ha_wave)

println("Hα = $ha_wave = $ha_nm = $ha_um")
```

### Converting between Fλ and Fν

Radio and infrared data are usually stored as Fν (flux per unit frequency, often in
Jansky). The conversion is Fν = Fλ × λ² / c.
```julia
using Unitful: c0

Flambda = 2.5e-17u"erg/s/cm^2/angstrom"
Fnu     = Flambda * ha_wave^2 / c0 |> u"erg/s/cm^2/Hz"
Fnu_jy  = uconvert(u"Jy", Fnu)

println("Fλ = $Flambda")
println("Fν = $Fnu  =  $Fnu_jy")
```

---

## Part 3: Dust extinction and dereddening

Interstellar dust makes sources appear fainter and redder — it preferentially absorbs
blue photons. `Spectra.jl` integrates with `DustExtinction.jl` for one-line corrections.

### Reddening a blackbody
```julia
using DustExtinction

wave_bb = range(3000, 10000, length = 500)
bb      = blackbody(wave_bb, 10_000)

bb_05 = redden(bb, 0.5)
bb_15 = redden(bb, 1.5)
bb_30 = redden(bb, 3.0)

plot(spectral_axis(bb),  ustrip.(flux_axis(bb)),   label = "Av = 0",   lw = 2)
plot!(spectral_axis(bb), ustrip.(flux_axis(bb_05)), label = "Av = 0.5", lw = 2)
plot!(spectral_axis(bb), ustrip.(flux_axis(bb_15)), label = "Av = 1.5", lw = 2)
plot!(spectral_axis(bb), ustrip.(flux_axis(bb_30)), label = "Av = 3.0", lw = 2)
plot!(xlabel = "Wavelength (Å)", ylabel = "Flux",
      title  = "Effect of dust extinction (T = 10 000 K blackbody)",
      size   = (800, 400))
```

### Comparing extinction laws
```julia
bb_ccm  = redden(bb, 1.0, law = CCM89)
bb_od94 = redden(bb, 1.0, law = OD94)
bb_cal  = redden(bb, 1.0, law = CAL00)
```

### Dereddening the SDSS spectrum
```julia
spec_dered = deredden(spec, 0.1)

ws = ustrip.(spectral_axis(spec))
plot(ws, ustrip.(flux_axis(spec)),       label = "Observed",    lw = 0.5, color = :gray, alpha = 0.6)
plot!(ws, ustrip.(flux_axis(spec_dered)), label = "Dereddened",  lw = 0.5, color = :steelblue)
plot!(xlabel = "Wavelength (Å)", ylabel = "Flux  (erg s⁻¹ cm⁻² Å⁻¹)",
      title  = "Dereddening the SDSS spectrum", size = (800, 400))
```

---

## Part 4: Inspecting spectral axes

`Spectra.jl` provides `spectral_axis` and `flux_axis` helpers to extract the wavelength
and flux arrays from any `Spectrum` object. This is useful for passing data to external
fitting routines.
```julia
waves  = spectral_axis(spec_dered)
fluxes = flux_axis(spec_dered)

println("First wavelength : ", waves[1])
println("Last  wavelength : ", waves[end])

# Zoom around Hα (6563 Å)
ha_mask = (ustrip.(waves) .> 6400) .& (ustrip.(waves) .< 6700)
plot(ustrip.(waves[ha_mask]), ustrip.(fluxes[ha_mask]),
    xlabel = "Wavelength (Å)", ylabel = "Flux  (erg s⁻¹ cm⁻² Å⁻¹)",
    title  = "SDSS spectrum near Hα (6563 Å)",
    lw = 1.5, color = :steelblue, legend = false, size = (800, 400))
```

!!! note
    Chebyshev continuum fitting (`continuum()`) is planned for a future `Spectra.jl`
    release — see [JuliaAstro/Spectra.jl#41](https://github.com/JuliaAstro/Spectra.jl/issues/41).
    For now, `SpectralFitting.jl` provides full continuum and line fitting with
    OGIP-compatible models.

---

## Part 5: Spectra with uncertainties
```julia
using Measurements

wave_m  = range(4000, 7000, length = 200) * u"angstrom"
flux_m  = ((5e-17 .± 0.5e-17) .* ones(200)) * u"erg/s/cm^2/angstrom"
spec_m  = spectrum(wave_m, flux_m)

spec_red = redden(spec_m, 0.5)

println("Original  flux[1] : ", flux_axis(spec_m)[1])
println("Reddened  flux[1] : ", flux_axis(spec_red)[1])
```

---

## Part 6: Synthetic blackbody spectra
```julia
wave_synth = range(1000, 20000, length = 1000)

bb_3k  = blackbody(wave_synth,  3_000)
bb_6k  = blackbody(wave_synth,  6_000)
bb_10k = blackbody(wave_synth, 10_000)
bb_30k = blackbody(wave_synth, 30_000)

plot(spectral_axis(bb_3k),  ustrip.(flux_axis(bb_3k)),  label = "3 000 K",  lw = 2, color = :red)
plot!(spectral_axis(bb_6k),  ustrip.(flux_axis(bb_6k)),  label = "6 000 K",  lw = 2, color = :orange)
plot!(spectral_axis(bb_10k), ustrip.(flux_axis(bb_10k)), label = "10 000 K", lw = 2, color = :steelblue)
plot!(spectral_axis(bb_30k), ustrip.(flux_axis(bb_30k)), label = "30 000 K", lw = 2, color = :purple)
plot!(xlabel = "Wavelength (Å)", ylabel = "Flux",
      title  = "Planck blackbodies at four temperatures", size = (800, 400))
```

---

## Part 7: Spectral arithmetic
```julia
wave_a  = range(4000, 8000, length = 500)
source  = blackbody(wave_a, 8_000)
sky     = blackbody(wave_a,   300) * 0.1

science = source - sky

plot(spectral_axis(source), ustrip.(flux_axis(source)),  label = "Source", lw = 2)
plot!(spectral_axis(sky),    ustrip.(flux_axis(sky)),     label = "Sky",    lw = 2)
plot!(spectral_axis(science),ustrip.(flux_axis(science)), label = "Source − Sky", lw = 2, ls = :dash)
plot!(xlabel = "Wavelength (Å)", ylabel = "Flux",
      title  = "Spectral arithmetic: sky subtraction", size = (800, 400))
```

---

## Part 8: Cosmological redshift
```julia
using Cosmology

cosmo = cosmology()

for z in [0.1, 0.5, 1.0, 2.0]
    d = luminosity_dist(cosmo, z)
    println("z = $z  →  dL = ", round(typeof(d), d, digits = 0))
end

wave_rest = range(3000, 8000, length = 500)
bb_rest   = blackbody(wave_rest, 6_000)

p = plot(xlabel = "Observed wavelength (Å)", ylabel = "Flux",
         title  = "Cosmological redshift", size = (800, 400))

for (z, c) in zip([0.0, 0.5, 1.0, 2.0], [:black, :blue, :green, :red])
    wave_obs = wave_rest .* (1 + z)
    flux_obs = flux_axis(bb_rest) ./ (1 + z)^2
    spec_z   = spectrum(wave_obs, flux_obs)
    lbl = z == 0 ? "z = 0 (rest frame)" : "z = $z"
    plot!(p, spectral_axis(spec_z), ustrip.(flux_axis(spec_z)), label = lbl, lw = 2, color = c)
end
p
```

---

## Summary

1. **Loading real spectral data** from SDSS FITS files with `FITSIO.jl`
2. **Physical units** with `Unitful.jl` + `UnitfulAstro.jl`
3. **Dust extinction** with CCM89, OD94, CAL00 laws via `DustExtinction.jl`
4. **Spectral axis inspection** using `spectral_axis` and `flux_axis`
5. **Uncertainty propagation** via `Measurements.jl`
6. **Synthetic blackbody spectra** from `Spectra.jl`
7. **Spectral arithmetic** — sky subtraction, scaling
8. **Cosmological redshift** and luminosity distances via `Cosmology.jl`

### Where to go next

| Package | What it adds |
|---|---|
| [`SpectralFitting.jl`](https://juliaastro.org/SpectralFitting/stable/) | X-ray spectral fitting with OGIP PHA/RMF/ARF |
| [`Korg.jl`](https://ajwheeler.github.io/Korg.jl/stable/) | Synthetic stellar spectra from model atmospheres |
| [`AstroImages.jl`](https://juliaastro.org/AstroImages/stable/) | IFU data-cubes — spectra at every spaxel |
