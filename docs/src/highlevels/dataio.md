# Data I/O Overview


## Data I/O

### [AstroImages.jl](https://github.com/JuliaAstro/AstroImages.jl)
[![book icon](../assets/book.png) Documentation](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface

### [FITSIO.jl](https://github.com/JuliaAstro/FITSIO.jl)
[![book icon](../assets/book.png) Documentation](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Interact with header data units (HDUs), FITS headers, and FITS data: both images and tables
- FITS tables follow the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface, allowing seamless integration with the rich data ecosystem, like [CSV.jl](https://github.com/JuliaData/CSV.jl), [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), etc.

### [CFITSIO.jl](https://github.com/JuliaAstro/CFITSIO.jl)
[![book icon](../assets/book.png) Documentation](https://juliaastro.github.io/FITSIO.jl/stable/)

**Reading and writing FITS files**

- Low-level wrapper for [cfitsio](https://heasarc.gsfc.nasa.gov/fitsio/)
- The c interface can be directly accessed with the [CFITSIO_jll package](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/)

### [mweastwood/CasaCore.jl](https://github.com/mweastwood/CasaCore.jl)
[![book icon](../assets/book.png) Documentation](http://mweastwood.info/CasaCore.jl/stable/)

**Tables and measurement sets for radio astronomy**

- Wrapper for [CasaCore](http://casacore.github.io/casacore/)
- Interface for CASA tables and measures

### [emmt/OIFITS.jl](https://github.com/emmt/OIFITS.jl)

**Support for OI-FITS**

- Read and write OI-FITS optical interferometry data format

### [aplavin/VLBIData.jl](https://gitlab.com/aplavin/VLBIData.jl)
[![book icon](../assets/book.png) Documentation](https://aplavin.github.io/VLBIData.jl/test/examples.html)

**Work with data formats common in very long baseline interferometry (VLBI)**

- Read interferometric visibilities (`uvfits`), images (`fits`), and source models
- Minimal writing support for source models

### [aplavin/Difmap.jl](https://gitlab.com/aplavin/Difmap.jl)

**Wrapper for the Difmap program used in synthesis imaging**

- Execute [Difmap](http://www.ascl.net/1103.001) scripts, handle inputs/outputs and logs
- Display images and plots from Difmap in interactive Julia environments
