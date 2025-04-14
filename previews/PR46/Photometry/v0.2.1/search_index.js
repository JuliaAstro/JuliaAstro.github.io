var documenterSearchIndex = {"docs":
[{"location":"apertures/examples.html#Examples-1","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"apertures/examples.html#Plotting-1","page":"Examples","title":"Plotting","text":"","category":"section"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"We have recipes for all our aperture types, so you can easily create overlays on your images.","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"using Photometry\nusing Plots\n\nplot(CircularAperture(2, 3, 4), c=1, xlims=(0, 9), ylims=(0, 9))\nplot!(CircularAnnulus(5, 5, 2.1, 3), c=2)\nplot!(EllipticalAperture(0, 0, 10, 1, 32), c=3)\nplot!(EllipticalAnnulus(5, 5, 4, 10, 1, 32), c=4)\n\nsavefig(\"apertures.png\"); nothing # hide","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"(Image: )","category":"page"},{"location":"apertures/examples.html#Simple-Stars-1","page":"Examples","title":"Simple Stars","text":"","category":"section"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"Here is an example where we will find aperture fluxes for stars from M67. The dataset is provided as part of the astropy/photutils-datasets repository.","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"Let's start by downloading and showing our image","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"using Photometry\nusing Plots\nusing FITSIO\n\nhdu = FITS(download(\"https://github.com/astropy/photutils-datasets/raw/master/data/M6707HH.fits\"))\nimage = read(hdu[1])'\nchunk = @view image[71:150, 81:155]\n\nheatmap(chunk, aspect_ratio=1, c=:inferno,\n    xlims=(1, size(chunk, 2)), ylims=(1, size(chunk, 1)))\nsavefig(\"m67.png\"); nothing # hide","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"(Image: )","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"Now let's add some apertures!","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"positions = [\n    [47.5, 67.5],\n    [29.5, 62.5],\n    [23.5, 48.5],\n    [17.5, 29.5],\n    [13.5, 10.5],\n    [65.5, 14.0]\n]\n\nradii = [3, 3, 2.7, 2, 2.7, 3]\n\naps = CircularAperture.(positions, radii)","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"now let's plot them up","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"heatmap(chunk, aspect_ratio=1, c=:inferno,\n    xlims=(1, size(chunk, 2)), ylims=(1, size(chunk, 1)))\nplot!.(aps, c=:white)\nsavefig(\"m67_aps.png\"); nothing # hide","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"(Image: )","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"and finally let's get our output table for the photometry","category":"page"},{"location":"apertures/examples.html#","page":"Examples","title":"Examples","text":"table = aperture_photometry(aps, chunk)","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"DocTestSetup = :(using Photometry)","category":"page"},{"location":"apertures/apertures.html#Apertures-1","page":"Apertures","title":"Apertures","text":"","category":"section"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"All apertures will rely on a position and the shape parameters.","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"aperture = Aperture(x0, y0, shape_params...)","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"The position can be pixels or sky coordinates. The sky coordinate positions utilize SkyCoords.jl and WCS.jl for conversion.","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"warning: Warning\nSky coordinates are not supported yet.","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"note: Note\nSee Pixel Convention - The origin is the bottom-left with (1, 1) being the center of the pixel. ","category":"page"},{"location":"apertures/apertures.html#Circular-Apertures-1","page":"Apertures","title":"Circular Apertures","text":"","category":"section"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"These apertures are parametrized by radius.","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"CircularAperture\nCircularAnnulus","category":"page"},{"location":"apertures/apertures.html#Photometry.Aperture.CircularAperture","page":"Apertures","title":"Photometry.Aperture.CircularAperture","text":"CircularAperture(x, y, r)\nCircularAperture([x, y], r)\n\nA circular aperture.\n\nA circular aperture with radius r. r must be greater than or equal to 0. \n\nExamples\n\njulia> ap = CircularAperture(0, 0, 10)\nCircularAperture(0, 0, r=10)\n\n\n\n\n\n","category":"type"},{"location":"apertures/apertures.html#Photometry.Aperture.CircularAnnulus","page":"Apertures","title":"Photometry.Aperture.CircularAnnulus","text":"CircularAnnulus(x, y, r_in, r_out)\nCircularAnnulus([x, y], r_in, r_out)\n\nA circular annulus with inner radius r_in and outer radius r_out. 0 ≤ r_in ≤ r_out.\n\nExamples\n\njulia> ap = CircularAnnulus(0, 0, 5, 10)\nCircularAnnulus(0, 0, r_in=5, r_out=10)\n\n\n\n\n\n","category":"type"},{"location":"apertures/apertures.html#Elliptical-Apertures-1","page":"Apertures","title":"Elliptical Apertures","text":"","category":"section"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"These apertures are parametrized by the semi-major axis a, semi-minor axis b and position angle in degrees counter-clockwise from the positive x-axis θ","category":"page"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"EllipticalAperture\nEllipticalAnnulus","category":"page"},{"location":"apertures/apertures.html#Photometry.Aperture.EllipticalAperture","page":"Apertures","title":"Photometry.Aperture.EllipticalAperture","text":"EllipticalAperture(x, y, a, b, θ)\nEllipticalAperture([x, y], a, b, θ)\n\nAn elliptical aperture with semi-major axis a, semi-minor axis b, and position angle θ. a and b must be ≥ 0, θ is measured in degrees counter-clockwise the standard x-axis.\n\nExamples\n\njulia> ap = EllipticalAperture(0, 0, 4, 2, 35)\nEllipticalAperture(0, 0, a=4, b=2, θ=35°)\n\n\n\n\n\n","category":"type"},{"location":"apertures/apertures.html#Photometry.Aperture.EllipticalAnnulus","page":"Apertures","title":"Photometry.Aperture.EllipticalAnnulus","text":"EllipticalAnnulus(x, y, a_in, a_out, b_out, θ)\nEllipticalAnnulus([x, y], a_in, a_out, b_out, θ)\n\nAn elliptical annulus with inner semi-major axis a_in, outer semi-major axis a_out, outer semi-minor axis b_out, and position angle θ. a_out ≥ a_in ≥ 0 and b_out must be ≥ 0, θ is measured in degrees counter-clockwise the standard x-axis.\n\nb_in will automatically be calculated from (a_in / a_out) * b_out. Note this may cause a type instability.\n\nExamples\n\njulia> ap = EllipticalAnnulus(0, 0, 4, 10, 5, 45)\nEllipticalAnnulus(0.0, 0.0, a_in=4.0, a_out=10.0, b_in=2.0, b_out=5.0, θ=45.0°)\n\n\n\n\n\n","category":"type"},{"location":"apertures/apertures.html#Rectangular-Apertures-1","page":"Apertures","title":"Rectangular Apertures","text":"","category":"section"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"These apertures are parametrized by side-length a, side-length b, and position angle in degrees counter-clockwise from the positive x-axis θ.","category":"page"},{"location":"apertures/apertures.html#API/Reference-1","page":"Apertures","title":"API/Reference","text":"","category":"section"},{"location":"apertures/apertures.html#","page":"Apertures","title":"Apertures","text":"Aperture.AbstractAperture\nmask\ncutout","category":"page"},{"location":"apertures/apertures.html#Photometry.Aperture.AbstractAperture","page":"Apertures","title":"Photometry.Aperture.AbstractAperture","text":"The abstract super-type for Apertures\n\n\n\n\n\n","category":"type"},{"location":"apertures/apertures.html#Photometry.Aperture.mask","page":"Apertures","title":"Photometry.Aperture.mask","text":"mask(::AbstractAperture; method=:exact)\n\nReturn an array of the weighting of the aperture in the minimum bounding box. For an explanation of the different methods, see aperture_photometry.\n\n\n\n\n\n","category":"function"},{"location":"apertures/apertures.html#Photometry.Aperture.cutout","page":"Apertures","title":"Photometry.Aperture.cutout","text":"cutout(::AbstractAperture, data)\n\nGet the cutout of the aperture from the data. This will handle partial overlap by padding the data with zeros.\n\n\n\n\n\n","category":"function"},{"location":"index.html#","page":"Home","title":"Home","text":"CurrentModule = Photometry\nDocTestSetup = :(using Photometry)","category":"page"},{"location":"index.html#Photometry-1","page":"Home","title":"Photometry","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"(Image: Build Status) (Image: Coverage) (Image: License)","category":"page"},{"location":"index.html#Installation-1","page":"Home","title":"Installation","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"To install from the REPL, enter Pkg-mode (])","category":"page"},{"location":"index.html#","page":"Home","title":"Home","text":"pkg> add Photometry","category":"page"},{"location":"index.html#Getting-Started-1","page":"Home","title":"Getting Started","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"Here is a basic example to do some aperture photometry using CircularAperture and CircularAnnulus. The aperture_photometry function performs the photometry using a given method. ","category":"page"},{"location":"index.html#","page":"Home","title":"Home","text":"data = ones(100, 100)\nerr = ones(100, 100)\n\nap1 = CircularAperture(50, 50, 3)\n# partial overlap\nap2 = CircularAperture(0.5, 0.5, 5)\n\nresults = aperture_photometry([ap1, ap2], data, err)\n@assert results.aperture_sum[1] ≈ 9π\n@assert results.aperture_sum[2] ≈ 25π / 4\n\nresults\n\n# output\n2×4 DataFrames.DataFrame\n│ Row │ xcenter │ ycenter │ aperture_sum │ aperture_sum_err │\n│     │ Float64 │ Float64 │ Float64      │ Float64          │\n├─────┼─────────┼─────────┼──────────────┼──────────────────┤\n│ 1   │ 50.0    │ 50.0    │ 28.2743      │ 5.31736          │\n│ 2   │ 0.5     │ 0.5     │ 19.635       │ 4.43113          │","category":"page"},{"location":"index.html#Contributing-1","page":"Home","title":"Contributing","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"If you're interested in contributing, go ahead and check out the issues or make a pull request. If you add a new feature, please write appropriate unit tests for it and bump the package's minor version.","category":"page"},{"location":"index.html#License-1","page":"Home","title":"License","text":"","category":"section"},{"location":"index.html#","page":"Home","title":"Home","text":"The work derived from astropy/photutils is BSD 3-clause and the work derived from kbarbary/sep is BSD 3-clause. All other work is considered MIT expat. Therefore this work as a whole is BSD 3-clause. LICENSE contains all licenses and any files using derived work are noted at the top of the file.","category":"page"},{"location":"apertures/index.html#Aperture-Photometry-1","page":"Getting Started","title":"Aperture Photometry","text":"","category":"section"},{"location":"apertures/index.html#Introduction-1","page":"Getting Started","title":"Introduction","text":"","category":"section"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"Aperture photometry uses Apertures to cut out and sum values in an image. A very basic mask might be a square of pixels at a certain position. We can model this as a matrix of ones and zeros like","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"[0 0 0 0 0\n 0 1 1 1 0\n 0 1 1 1 0\n 0 1 1 1 0\n 0 0 0 0 0]","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"If we have some data like","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"[7 9 6 0 8\n 8 5 8 7 9\n 5 6 2 2 7\n 9 7 3 4 1\n 7 8 0 9 8]","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"then the result of our aperture photometry looks like","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"[0 0 0 0 0     [7 9 6 0 8     [0 0 0 0 0\n 0 1 1 1 0      8 5 8 7 9      0 5 8 7 0\n 0 1 1 1 0  .*  5 6 2 2 7  =   0 6 2 2 0\n 0 1 1 1 0      9 7 3 4 1      0 7 3 4 0\n 0 0 0 0 0]     7 8 0 9 8]     0 0 0 0 0]\n \n sum(result) = 44","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"This module uses the above principal with common aperture shapes in a fast and precise manner, including exact overlaps between apertures and pixels. ","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"The majority of the lifting is done with the aperture_photometry function with common shapes being described in Apertures. It is possible to create a custom aperture by sub-typing the Aperture.AbstractAperture class, although it may be easier to perform PSF photometry instead.","category":"page"},{"location":"apertures/index.html#Pixel-Convention-1","page":"Getting Started","title":"Pixel Convention","text":"","category":"section"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"Photometry.jl follows the same convention as FITS, WCS, IRAF, ds9, and SourceExtractor with (1, 1) being the center on the bottom-left pixel. This means the exact bottom-left corner is at (0.5, 0.5). Pixels increase up and to the right until axis_length + 0.5.","category":"page"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"This is mostly in line with Julia's indexing, although it is important to remember that arrays are layed out in (y, x) due to the row-column interface. So the pixel at (34, 56) is at image[56, end-34]. ","category":"page"},{"location":"apertures/index.html#API/Reference-1","page":"Getting Started","title":"API/Reference","text":"","category":"section"},{"location":"apertures/index.html#","page":"Getting Started","title":"Getting Started","text":"aperture_photometry","category":"page"},{"location":"apertures/index.html#Photometry.Aperture.aperture_photometry","page":"Getting Started","title":"Photometry.Aperture.aperture_photometry","text":"aperture_photometry(::AbstractAperture, data::AbstractMatrix, [error]; method=:exact)\naperture_photometry(::AbstractVector{<:AbstractAperture}, data::AbstractMatrix, [error]; method=:exact)\n\nPerform aperture photometry on data given aperture(s). If error (the pixel-wise standard deviation) is provided, will calculate sum error. If a list of apertures is provided the output will be a DataFrame, otherwise a NamedTuple.\n\nMethods\n\n:exact - Will calculate the exact geometric overlap\n:center - Will only consider full-pixel overlap (equivalent to subpixel method with 1 subpixel)\n(:subpixel, n) - Use n^2 subpixels to calculate overlap\n\n\n\n\n\n","category":"function"}]
}
