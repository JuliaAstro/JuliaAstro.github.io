# JuliaAstro

Community Astronomy and Astrophysics packages for Julia

## Ecosystem
Packages are separated by functionality and Julia's declarative package manager takes care of resolving dependencies. You get just the functionality you need, and smaller packages lead to more rapid development.

### [AstroLib](https://github.com/JuliaAstro/astrolib.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroLib.jl/stable/)
**Collection of generic astronomical and astrophysical functions**

- Translation of many IDL AstroLib procedures

### [AstroTime](https://github.com/JuliaAstro/AstroTime.jl) [![](assets/book.png)](https://juliaastro.github.io/AstroTime.jl/stable/)
**Astronomical time keeping**

- High-precision, time-scale aware, DateTime-like data type
- Support all commonly used astronomical time scales

### [Cosmology](https://github.com/JuliaAstro/Cosmology.jl) [![](assets/book.png)](https://juliaastro.github.io/Cosmology.jl/stable/)
**Distances in the universe**

- ``\Lambda``-CDM and w0-wa cosmologies
- Open, closed, and flat variants


### [DustExtinction](https://github.com/JuliaAstro/DustExtinction.jl) [![](assets/book.png)](https://juliaastro.github.io/DustExtinction.jl/stable/)
**Dust extinction laws and maps**

- Various empirical extinction models
- SFD (1998) galactic dust map

### [ERFA](https://github.com/JuliaAstro/ERFA.jl)
**Low-level ERFA wrapper**

- Wrapper for [liberfa](https://github.com/liberfa/erfa)
- Time systems conversions


### [EarthOrientation](https://github.com/JuliaAstro/EarthOrientation.jl) [![](assets/book.png)](https://juliaastro.github.io/EarthOrientation.jl/stable/)
**Earth orientation parameters**

- Calculate Earth orientation parameters from IERS tables

### [FITSIO](https://github.com/JuliaAstro/FITSIO.jl) [![](assets/book.png)](https://juliaastro.github.io/FITSIO.jl/stable/)
**Reading and writing FITS files**

- Wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
- Image and table extensions

### [JPLEphemeris](https://github.com/JuliaAstro/JPLEphemeris.jl)
**JPL Development Ephemerides**

- Calculate positions and velocities of solar system bodies

### [LombScargle](https://github.com/JuliaAstro/LombScargle.jl) [![](assets/book.png)](https://juliaastro.github.io/LombScargle.jl/stable/)
**Compute Lomb-Scargle periodogram**

- Determine period of unevenly sampled periodic signals
- Supports multi-threading

### [Photometry](https://github.com/JuliaAstro/Photometry.jl) [![](assets/book.png)](https://juliaastro.github.io/Photometry.jl/stable/)
**Photometry**

- Utilities for characterizing sources in astronomical images.

### [SkyCoords](https://github.com/JuliaAstro/SkyCoords.jl)
**Astronomical coordinate systems**

- Supports ICRS, galactic, and FK5 coordinate systems
- Fast conversion of coordinates between different systems

### [UnitfulAstro](https://github.com/JuliaAstro/UnitfulAstro.jl) [![](assets/book.png)](https://juliaastro.github.io/UnitfulAstro.jl/stable/)
**Astronomical units**

- Extension of [Unitful.jl](https://github.com/painterqubits/unitful.jl)

### [WCS](https://github.com/JuliaAstro/WCS.jl) [![](assets/book.png)](https://juliaastro.github.io/WCS.jl/stable/)
**World Coordinate System transformations**

- Wrapper for [wcslib](https://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/)

## Other Packages

Registered Julia astronomy packages hosted elsewhere

### [CasaCore](https://github.com/mweastwood/CasaCore.jl) [![](assets/book.png)](http://mweastwood.info/CasaCore.jl/stable/)
**Tables and measurement sets for radio astronomy**
- Wrapper for [CasaCore](http://casacore.github.io/casacore/)
- Interface for CASA tables and measures

### [OIFITS](https://github.com/emmt/OIFITS.jl)
**Support for OI-FITS**
- Read and write OI-FITS optical interferometry data format

## Contributing

Use the packages, file issues, and join the conversation!

- [JuliaAstro](https://github.com/juliaastro) on GitHub
- [julia-astro](https://groups.google.com/forum/#!forum/julia-astro) mailing list on Google Groups
- [Astro/Space](https://discourse.julialang.org/c/domain/astro) topics on JuliaLang Discourse
- [#JuliaAstro:openastronomy.org](https://riot.im/app/#/room/#JuliaAstro:openastronomy.org) on Matrix
- [#astronomy](slack://channel?id=CMXU6SD7V&team=T68168MUP) on [JuliaLang Slack](https://slackinvite.julialang.org/)

## Google Summer of Code
Would you like to contribute to JuliaAstro as part of Google Summer of Code? You can! We are member of [OpenAstronomy](https://openastronomy.org), go to the [GSoC page](https://openastronomy.org/gsoc/) to see how to apply and the list of ideas. You can also propose us your own idea!
