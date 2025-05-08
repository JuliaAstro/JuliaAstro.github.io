var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.jl",
    "category": "page",
    "text": ""
},

{
    "location": "#DustExtinction.jl-1",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.jl",
    "category": "section",
    "text": ""
},

{
    "location": "#Installation-1",
    "page": "DustExtinction.jl",
    "title": "Installation",
    "category": "section",
    "text": "From the REPL, press ] to enter Pkg mode(v 1.1) pkg> add DustExtinction\n[...]\n\njulia> using DustExtinction"
},

{
    "location": "#Usage-1",
    "page": "DustExtinction.jl",
    "title": "Usage",
    "category": "section",
    "text": "julia> using DustExtinction"
},

{
    "location": "#Color-laws-1",
    "page": "DustExtinction.jl",
    "title": "Color laws",
    "category": "section",
    "text": "julia> ccm89(4000., 3.1)\n1.4645557029425842These laws can be applied across higher dimension arrays using the . operatorjulia> ccm89.([4000., 5000.], 3.1)\n2-element Array{Float64,1}:\n 1.4645557029425842\n 1.122246878899302\nIf you want to apply total extinction A_V it\'s as simple as multiplcationjulia> a_v=0.3\n0.3\n\njulia> a_v * ccm89(4000., 3.1)\n0.43936671088277524"
},

{
    "location": "#Dust-maps-1",
    "page": "DustExtinction.jl",
    "title": "Dust maps",
    "category": "section",
    "text": "julia> ENV[\"SFD98_DIR\"] = \"/home/user/data/dust\"\n\n# download maps (once)\njulia> download_sfd98()\n\njulia> dustmap = SFD98Map()\nSFD98Map(\"/home/user/data/dust\")\n\njulia> ebv_galactic(dustmap, 0.1, 0.1)\n0.793093095733043\n\njulia> ebv_galactic(dustmap, [0.1, 0.2], [0.1, 0.2])\n2-element Array{Float64,1}:\n 0.793093\n 0.539507"
},

{
    "location": "#Reference/API-1",
    "page": "DustExtinction.jl",
    "title": "Reference/API",
    "category": "section",
    "text": ""
},

{
    "location": "#DustExtinction.ccm89",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.ccm89",
    "category": "function",
    "text": "ccm89(wave::Real, r_v::Real=3.1)\n\nClayton, Cardelli and Mathis (1989) dust law. \n\nReturns the extinction in magnitudes at the given wavelength(s) wave (in Angstroms), relative to the extinction at 5494.5 Angstroms. The parameter r_v changes the shape of the function.  A typical value for the Milky Way is 3.1. An error is raised for wavelength values outside the range of support, 1000. to 33333.33 Angstroms.\n\nReferences\n\n[1] Cardelli, Clayton and Mathis (1989)\n\n\n\n\n\n"
},

{
    "location": "#DustExtinction.od94",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.od94",
    "category": "function",
    "text": "od94(wave::Real, r_v::Real=3.1)\n\nO\'Donnell (1994) dust law.\n\nThis is identical to the Clayton, Cardelli and Mathis (1989) dust law, except that different coefficients are used in the optical (3030.3 to 9090.9 Angstroms). Returns the extinction in magnitudes at the given wavelength(s) wave (in Angstroms), relative to the extinction at 5494.5 Angstroms. The parameter r_v changes the shape of the function.  A typical value for the Milky Way is 3.1.  An error is raised for wavelength values outside the range of support, 1000. to 33333.33 Angstroms.\n\nReferences\n\n[1] O\'Donnell (1994)\n\n\n\n\n\n"
},

{
    "location": "#DustExtinction.cal00",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.cal00",
    "category": "function",
    "text": "cal00(wave::Real, r_v::Real=3.1)\n\nCalzetti et al. (2000) Dust law.\n\nCalculate the magnitudes for given wavelengths wave in Angstrom. Wavelength support is 0.12 to 2.2 microns (error will be thrown if out of this range). Accepts selective extinction r_v parameter with default set to Milky Way average of 3.1.\n\nReferences\n\n[1] Calzetti et al. (2000)\n\n\n\n\n\n"
},

{
    "location": "#Extinction-Laws-1",
    "page": "DustExtinction.jl",
    "title": "Extinction Laws",
    "category": "section",
    "text": "ccm89\nod94\ncal00"
},

{
    "location": "#DustExtinction.download_sfd98",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.download_sfd98",
    "category": "function",
    "text": "download_sfd98([destdir])\n\nDownload the Schlegel, Finkbeiner and Davis (1998) dust maps to the given directory. If the directory is ommitted, the SFD98_DIR environment variable is used as the destination directory.\n\n\n\n\n\n"
},

{
    "location": "#DustExtinction.SFD98Map",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.SFD98Map",
    "category": "type",
    "text": "SFD98Map([mapdir])\n\nSchlegel, Finkbeiner and Davis (1998) dust map. mapdir should be a directory containing the two FITS files defining the map, SFD_dust_4096_[ngp,sgp].fits. If mapdir is omitted, the SFD98_DIR environment variable is used. Internally, this type keeps the FITS files defining the map open, speeding up repeated queries for E(B-V) values.\n\n\n\n\n\n"
},

{
    "location": "#DustExtinction.ebv_galactic",
    "page": "DustExtinction.jl",
    "title": "DustExtinction.ebv_galactic",
    "category": "function",
    "text": "ebv_galactic(dustmap::SFD98Map, l::Real, b::Real)\nebv_galactic(dustmap::SFD98Map, l::Vector{<:Real}, b::Vector{<:Real})\n\nGet E(B-V) value from a SFD98Map instance at galactic coordinates (l, b), given in radians. l and b may be Vectors. Uses bilinear interpolation between pixel values.\n\n\n\n\n\n"
},

{
    "location": "#Dust-Maps-1",
    "page": "DustExtinction.jl",
    "title": "Dust Maps",
    "category": "section",
    "text": "download_sfd98\nSFD98Map\nebv_galactic"
},

]}
