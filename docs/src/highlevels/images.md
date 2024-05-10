# Images Overview

### AstroImages.jl

[![curly braces](../assets/code.png) Repository](https://github.com/JuliaAstro/AstroImages.jl)

[![book icon](../assets/book.png) Documentation](https://juliaastro.github.io/AstroImages.jl/stable/)

**Load, manipulate, and visualize astronomical images**

- Built on top of [Images.jl](https://github.com/JuliaImages/Images.jl) and [Plots.jl](https://github.com/JuliaPlots/Plots.jl)
- Works with the [FileIO.jl](https://github.com/JuliaIO/FileIO.jl) interface
- Automatic visualizations are directly integrated into many environments like [VSCode](https://code.visualstudio.com/), [Pluto.jl](https://github.com/fonsp/Pluto.jl), and [IJulia.jl](https://github.com/JuliaLang/IJulia.jl)
- Includes recipes for plotting with [Plots.jl](https://github.com/JuliaPlots/Plots.jl)

### SAOImageDS9.jl

[![curly braces](../assets/code.png) Repository](https://github.com/JuliaAstro/SAOImageDS9.jl)

[![book icon](../assets/book.png) Documentation](https://juliaastro.github.io/SAOImageDS9.jl/stable/)

**Interface with the DS9 image viewer**

- Uses [XPA.jl](https://github.com/JuliaAstro/XPA.jl) to communicate with DS9 instances
- Easily display images in DS9 and add features like circles and lines
- Low-level API accessible with `set` and `get`

### Photometry.jl

[![curly braces](../assets/code.png) Repository](https://github.com/juliaastro/Photometry.jl)

[![book icon](../assets/book.png) Documentation](https://juliaastro.org/Photometry.jl/stable/)

**Aperture photometry**

- Background estimation and source extraction
- Fast and precise aperture photometry

### PSFModels.jl

[![curly braces](../assets/code.png) Repository](https://github.com/JuliaAstro/PSFModels.jl)

[![book icon](../assets/book.png) Documentation](https://juliaastro.org/PSFModels.jl/stable/)

**Analytical, allocation-free point-spread-functions (PSF)**

- Lazy representation allows fast allocation-free calculations
- Gaussian (Normal), Moffat, and Airy disk.

### LACosmic.jl

[![curly braces](../assets/code.png) Repository](https://github.com/JuliaAstro/LACosmic.jl)

[![book icon](../assets/book.png) Documentation](https://juliaastro.org/LACosmic.jl/stable/)

**Cosmic-ray rejection by Laplacian edge detection**

- Implementation of the L.A.Cosmic algorithm ([van Dokkum, 2001](https://ui.adsabs.harvard.edu/abs/2001PASP..113.1420V/abstract))
- Returns bad pixel masks and cleaned data