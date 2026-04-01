# [Multi-wavelength spectroscopy](@id tutorial-multiwavelength-spectroscopy)

Spectroscopy is one of the most powerful tools in an astronomer's toolkit. By splitting light
into its component wavelengths, we can learn about a source's chemical composition, temperature,
velocity, and much more.

In this tutorial we'll walk through a realistic spectroscopy workflow: downloading a real SDSS
optical spectrum, loading it with [`FITSIO.jl`](https://juliaastro.org/FITSIO/stable/), wrapping
it in [`Spectra.jl`](https://juliaastro.org/Spectra/stable/) types with proper physical units
from [`UnitfulAstro.jl`](https://juliaastro.org/UnitfulAstro/stable/), applying dust corrections
with [`DustExtinction.jl`](https://juliaastro.org/DustExtinction/stable/), fitting the continuum,
and visualizing the results with [`Plots.jl`](https://docs.juliaplots.org/stable/).

Along the way, we'll also generate synthetic spectra and show how to work with spectra at
different wavelength ranges — demonstrating the composability that makes the JuliaAstro
ecosystem so powerful.

## Packages

- [`FITSIO`](https://juliaastro.org/FITSIO/stable/): load spectral data from FITS files
- [`Spectra`](https://juliaastro.org/Spectra/stable/): core spectral types, operations, and transformations
- [`DustExtinction`](https://juliaastro.org/DustExtinction/stable/): interstellar dust reddening/dereddening
- [`Unitful`](https://painterqubits.github.io/Unitful.jl/stable) and [`UnitfulAstro`](https://juliaastro.org/UnitfulAstro/stable/): physical units
- [`Measurements`](https://juliaphysics.github.io/Measurements.jl/stable/): uncertainty propagation
- [`Plots`](https://docs.juliaplots.org/stable/): visualization
- [`Cosmology`](https://juliaastro.org/Cosmology/stable/): cosmological distance calculations

Install them by pressing `]` in the Julia REPL to enter Pkg mode:

```
pkg> add FITSIO Spectra DustExtinction Unitful UnitfulAstro Measurements Plots Cosmology
```

!!! note
    `Spectra.jl` is not yet registered in the General registry. Install it from GitHub:
    ```
    pkg> add https://github.com/JuliaAstro/Spectra.jl
    ```

## Part 1: Loading a real SDSS spectrum

We'll work with a publicly available spectrum from the Sloan Digital Sky Survey (SDSS). This is
a "lite" format spectrum of a galaxy observed on plate 1323, MJD 52797, fiber 12. The FITS file
contains the coadded spectrum as a binary table with log-spaced wavelengths and calibrated flux.

### Downloading the data

```julia
using Downloads

sdss_url = "https://dr14.sdss.org/optical/spectrum/view/data/format=fits/spec=lite?plateid=1323&mjd=52797&fiberid=12"
sdss_file = joinpath(@__DIR__, "sdss_example.fits")
if !isfile(sdss_file)
    Downloads.download(sdss_url, sdss_file)
end
nothing # hide
```

### Reading the FITS file

Let's open the file and see what's inside:

```julia
using FITSIO

f = FITS(sdss_file)
```

The spectrum lives in HDU 2 (the `COADD` table). SDSS stores wavelengths in log10 form, so
we need to convert them. The flux is in units of 10⁻¹⁷ erg/s/cm²/Å.

```julia
using Unitful, UnitfulAstro

# Read the raw arrays from the FITS binary table
loglam = read(f[2], "loglam")   # log10(wavelength in Angstrom)
flux_raw = read(f[2], "flux")   # flux in 10^-17 erg/s/cm^2/Å
ivar = read(f[2], "ivar")       # inverse variance

# Convert to physical quantities with proper units
wave = (10 .^ loglam)u"angstrom"
flux = (flux_raw .* 1e-17)u"erg/s/cm^2/angstrom"

close(f)

println("Wavelength range: $(minimum(wave)) — $(maximum(wave))")
println("Number of pixels: $(length(wave))")
```

### Creating a Spectrum object

Now we wrap these arrays into a `Spectra.jl` `Spectrum` object. This gives us access to all
the package's built-in operations — plotting, arithmetic, continuum fitting, reddening, etc.

```julia
using Spectra

spec = spectrum(wave, flux)
```

That's it — `spectrum()` is the universal constructor. It automatically picks the right
internal type based on the shape of your data (1D spectrum, echelle, etc.).

### Quick plot

```julia
using Plots

plot(spec,
    xlabel = "Wavelength (Å)",
    ylabel = "Flux (erg s⁻¹ cm⁻² Å⁻¹)",
    title = "SDSS Galaxy Spectrum — Plate 1323, Fiber 12",
    legend = false,
    linewidth = 0.5,
    color = :steelblue,
    size = (800, 400),
)
savefig("sdss_raw.svg") # hide
nothing # hide
```

![SDSS raw spectrum](sdss_raw.svg)

You can already see emission lines (the sharp peaks) and absorption features. Let's identify
some of them in the next sections.

## Part 2: Working with units

One of Julia's strengths is zero-cost unit handling. Let's see how `Spectra.jl` and
`UnitfulAstro.jl` make unit conversions effortless.

### Inspecting units

```julia
# Get the units attached to our spectrum
w_unit, f_unit = unit(spec)
println("Wavelength unit: $w_unit")
println("Flux unit: $f_unit")
```

### Converting wavelength to different representations

Astronomers working at different wavelengths think in different units: optical astronomers use
Ångströms or nanometers, infrared astronomers use microns, radio astronomers use GHz, and
X-ray astronomers use keV. Julia's unit system handles all of these natively:

```julia
# Pick a reference wavelength — the Hα line at 6563 Å
ha_wave = 6563.0u"angstrom"

# Convert to other representations
ha_nm = uconvert(u"nm", ha_wave)
ha_um = uconvert(u"μm", ha_wave)

println("Hα wavelength:")
println("  $(ha_wave)")
println("  $(ha_nm)")
println("  $(ha_um)")
```

### Converting between Fλ and Fν

Spectra can be expressed per unit wavelength (Fλ) or per unit frequency (Fν). The conversion
involves a factor of λ²/c. Here's how to do it manually:

```julia
using Unitful: c0   # speed of light

# Take a single flux measurement at Hα
Flambda = 2.5e-17u"erg/s/cm^2/angstrom"

# Fν = Fλ × λ² / c
Fnu = Flambda * ha_wave^2 / c0 |> u"erg/s/cm^2/Hz"

# Often expressed in Jansky (1 Jy = 10^-23 erg/s/cm^2/Hz)
Fnu_jy = uconvert(u"Jy", Fnu)

println("Fλ = $Flambda")
println("Fν = $Fnu")
println("Fν = $Fnu_jy")
```

## Part 3: Dust extinction and dereddening

Interstellar dust absorbs and scatters starlight, making sources appear fainter and redder than
they really are. Before doing any science with a spectrum, we often need to correct for this
extinction. `Spectra.jl` integrates directly with `DustExtinction.jl` to make this easy.

### Simulating reddened spectra

Let's first see what dust does to a clean spectrum. We'll generate a blackbody and apply
different amounts of reddening:

```julia
# Generate a blackbody spectrum at T = 10,000 K (a hot A-type star)
wave_bb = range(3000, 10000, length=500)
bb = blackbody(wave_bb, 10000)

# Apply different amounts of extinction (Av = visual extinction in magnitudes)
bb_av1 = redden(bb, 0.5)    # mild reddening
bb_av2 = redden(bb, 1.5)    # moderate reddening
bb_av3 = redden(bb, 3.0)    # heavy reddening

plot(bb, label="Original (Av=0)", linewidth=2, color=:blue)
plot!(bb_av1, label="Av = 0.5", linewidth=2, color=:green)
plot!(bb_av2, label="Av = 1.5", linewidth=2, color=:orange)
plot!(bb_av3, label="Av = 3.0", linewidth=2, color=:red)
plot!(xlabel="Wavelength (Å)", ylabel="Flux",
    title="Effect of Dust Extinction on a Blackbody (T=10,000 K)",
    size=(800, 400))
savefig("dust_reddening.svg") # hide
nothing # hide
```

![Dust reddening effect](dust_reddening.svg)

Notice how dust preferentially absorbs blue/UV light — the spectrum gets both fainter and
redder with increasing extinction.

### Dereddening our SDSS spectrum

Now let's correct our real SDSS spectrum. We'll assume a typical Milky Way extinction of
Av = 0.1 magnitudes along this line of sight (you'd normally look this up from a dust map):

```julia
# Deredden the observed spectrum
spec_dered = deredden(spec, 0.1)

plot(spec, label="Observed", alpha=0.5, linewidth=0.5, color=:gray)
plot!(spec_dered, label="Dereddened (Av=0.1)", linewidth=0.5, color=:steelblue)
plot!(xlabel="Wavelength (Å)", ylabel="Flux (erg s⁻¹ cm⁻² Å⁻¹)",
    title="Dereddening the SDSS Spectrum",
    size=(800, 400))
savefig("dereddened.svg") # hide
nothing # hide
```

![Dereddened spectrum](dereddened.svg)

The dereddened spectrum is slightly bluer (more flux at shorter wavelengths), as expected.

### Using different extinction laws

`DustExtinction.jl` provides several empirical extinction laws. The default is `CCM89`
(Cardelli, Clayton & Mathis 1989), but you can also use others:

```julia
using DustExtinction

# Compare extinction laws on our blackbody
bb_ccm = redden(bb, 1.0, law=CCM89)
bb_od94 = redden(bb, 1.0, law=OD94)
bb_cal00 = redden(bb, 1.0, law=CAL00)

plot(bb, label="Original", linewidth=2, color=:black, linestyle=:dash)
plot!(bb_ccm, label="CCM89", linewidth=2, color=:blue)
plot!(bb_od94, label="OD94", linewidth=2, color=:red)
plot!(bb_cal00, label="CAL00 (starburst)", linewidth=2, color=:orange)
plot!(xlabel="Wavelength (Å)", ylabel="Flux",
    title="Comparison of Extinction Laws (Av = 1.0)",
    size=(800, 400))
savefig("extinction_laws.svg") # hide
nothing # hide
```

![Extinction law comparison](extinction_laws.svg)

## Part 4: Continuum fitting and spectral features

The *continuum* is the smooth, slowly-varying component of a spectrum — think of it as the
"baseline" on top of which emission and absorption lines sit. Fitting and removing the
continuum is a key step in measuring line properties.

### Fitting the continuum

`Spectra.jl` provides a Chebyshev polynomial continuum fitter:

```julia
# Fit the continuum with a degree-3 Chebyshev polynomial
spec_cont = continuum(spec_dered)

# The result is a normalized spectrum (flux / continuum)
# Let's plot a zoom around the Hα region
plot(spec_cont,
    xlims=(6400, 6700),
    xlabel="Wavelength (Å)",
    ylabel="Normalized Flux",
    title="Continuum-Normalized Spectrum near Hα",
    linewidth=1.5, color=:steelblue,
    legend=false,
    size=(800, 400))
hline!([1.0], color=:gray, linestyle=:dash, label="Continuum level")
savefig("continuum_zoom.svg") # hide
nothing # hide
```

![Continuum normalized zoom](continuum_zoom.svg)

In a continuum-normalized spectrum, emission lines appear as peaks above 1.0, and absorption
lines dip below 1.0. The strong peak you see is the Hα emission line at 6563 Å — a signature
of ionized hydrogen.

## Part 5: Spectra with uncertainties

Real measurements always come with uncertainties. Julia's `Measurements.jl` package propagates
errors automatically through any calculation. `Spectra.jl` supports this natively.

```julia
using Measurements

# Create a spectrum with measurement uncertainties
wave_m = range(4000, 7000, length=200)u"angstrom"

# Simulate flux with realistic noise
flux_vals = 5e-17 .* ones(200)
sigma_vals = 0.5e-17 .* ones(200)

flux_m = (flux_vals .± sigma_vals)u"erg/s/cm^2/angstrom"

spec_m = spectrum(wave_m, flux_m)

# Now all operations propagate uncertainties automatically!
spec_reddened = redden(spec_m, 0.5)

# Check that uncertainties were propagated
println("Original flux[1]:  $(spec_m.flux[1])")
println("Reddened flux[1]:  $(spec_reddened.flux[1])")
```

The uncertainties are propagated correctly through the reddening calculation — no manual
error propagation needed.

## Part 6: Generating synthetic spectra

`Spectra.jl` includes a blackbody generator, which is useful for quick comparisons and testing:

```julia
# Generate blackbodies at different temperatures
wave_synth = range(1000, 20000, length=1000)

bb_3000 = blackbody(wave_synth, 3000)    # cool M-star
bb_6000 = blackbody(wave_synth, 6000)    # Sun-like G-star
bb_10000 = blackbody(wave_synth, 10000)  # hot A-star
bb_30000 = blackbody(wave_synth, 30000)  # very hot O-star

plot(bb_3000, label="3,000 K (M-star)", linewidth=2, color=:red)
plot!(bb_6000, label="6,000 K (G-star, Sun-like)", linewidth=2, color=:orange)
plot!(bb_10000, label="10,000 K (A-star)", linewidth=2, color=:steelblue)
plot!(bb_30000, label="30,000 K (O-star)", linewidth=2, color=:purple)
plot!(xlabel="Wavelength (Å)", ylabel="Flux",
    title="Blackbody Spectra at Different Temperatures",
    size=(800, 400))
savefig("blackbodies.svg") # hide
nothing # hide
```

![Blackbody comparison](blackbodies.svg)

Notice how hotter stars peak at shorter (bluer) wavelengths — this is Wien's displacement law
in action.

## Part 7: Spectral arithmetic

We can combine spectra using standard arithmetic. This is useful for things like subtracting a
sky background, computing ratios, or combining observations:

```julia
# Create two simple spectra
wave_arith = range(4000, 8000, length=500)
source = blackbody(wave_arith, 8000)
background = blackbody(wave_arith, 300) * 0.1  # faint thermal background

# Subtract the background
clean = source - background

plot(source, label="Source", linewidth=2, color=:steelblue)
plot!(background, label="Background (×0.1)", linewidth=2, color=:red)
plot!(clean, label="Source − Background", linewidth=2, color=:black, linestyle=:dash)
plot!(xlabel="Wavelength (Å)", ylabel="Flux",
    title="Spectral Arithmetic: Background Subtraction",
    size=(800, 400))
savefig("spectral_arithmetic.svg") # hide
nothing # hide
```

![Spectral arithmetic](spectral_arithmetic.svg)

## Part 8: Redshift and cosmological context

Distant galaxies have their spectra shifted to longer wavelengths by the expansion of the
universe. If a source is at redshift `z`, every wavelength is stretched by a factor of `(1+z)`.

Let's compute what our SDSS spectrum would look like at different redshifts:

```julia
using Cosmology

# Standard ΛCDM cosmology
cosmo = cosmology()

# Our SDSS spectrum is at some redshift — let's work with the raw wavelengths
# and show what happens when we shift them
wave_rest = range(3000, 8000, length=500)
source_rest = blackbody(wave_rest, 6000)

z_vals = [0.0, 0.5, 1.0, 2.0]
colors = [:black, :blue, :green, :red]

p = plot(xlabel="Observed Wavelength (Å)", ylabel="Flux (arbitrary)",
    title="Effect of Cosmological Redshift",
    size=(800, 400))

for (z, c) in zip(z_vals, colors)
    # Shift wavelengths: λ_obs = λ_rest × (1 + z)
    wave_obs = wave_rest .* (1 + z)
    spec_z = spectrum(wave_obs, source_rest.flux ./ (1 + z))  # flux dims by (1+z)

    dist = z > 0 ? luminosity_dist(cosmo, z) : 0.0u"Mpc"
    label_str = z == 0 ? "z = 0 (rest frame)" : "z = $z (dₗ = $(round(typeof(dist), dist, digits=0)))"

    plot!(p, spec_z, label=label_str, linewidth=2, color=c)
end

savefig("redshift_demo.svg") # hide
nothing # hide
```

![Redshift demonstration](redshift_demo.svg)

Each curve shows the same intrinsic spectrum as it would appear at different redshifts. The
spectral features shift to longer wavelengths and the flux decreases with distance.

## Summary

In this tutorial we covered:

1. **Loading real spectral data** from SDSS FITS files using `FITSIO.jl`
2. **Creating `Spectrum` objects** with proper units using `Spectra.jl` + `UnitfulAstro.jl`
3. **Unit conversions** between Å, nm, μm, and flux density conversions (Fλ ↔ Fν)
4. **Dust extinction correction** using `DustExtinction.jl` with multiple extinction laws
5. **Continuum fitting** and normalization with Chebyshev polynomials
6. **Uncertainty propagation** through spectral operations using `Measurements.jl`
7. **Synthetic spectra** generation with blackbody models
8. **Spectral arithmetic** for background subtraction and combining data
9. **Cosmological redshift** effects on spectral observations

The JuliaAstro spectroscopy stack is under active development. For X-ray spectral analysis,
check out [`SpectralFitting.jl`](https://juliaastro.org/SpectralFitting/stable/). For generating
theoretical stellar spectra from model atmospheres, see
[`Korg.jl`](https://ajwheeler.github.io/Korg.jl/stable/). These packages are designed to
compose together — you can load X-ray data with `SpectralFitting.jl`, generate a model with
`Korg.jl`, and manipulate both using `Spectra.jl`'s interface.
