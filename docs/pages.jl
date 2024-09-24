# This file specifies what packages to document

# Plain documenter pages
fullpages = Any[
    "Home"=>"index.md"
    # "Ecosystem" => "ecosystem.md";
    "Tutorials" => [
        "tutorials/index.md",
        "General" => [
            "tutorials/jwst-image-scale-bar.md",
            "tutorials/tabular-data.md",
            "tutorials/curve-fit.md",
        ]
    ]
]

# Categories to pull in from external docs
# Ordering Matters!
docsmodules = [
    "Time, Coordinates, & Units" => [
        "AstroLib",
        "UnitfulAstro",
        "AstroAngles",
        "AstroTime",
        "SkyCoords",
        "WCS",
    ],
    "Images" => [
        "AstroImages",
        "SAOImageDS9",
        "Photometry",
        "PSFModels",
        #"CCDReduction",
        "LACosmic",
        "SkyImages",
    ],
    "Data I/O" => [
        "FITSIO",
        "CFITSIO",
        "CasaCore",
        "OIFITS",
        "VLBIData",
        "Difmap",
        "VOTables",
        "VirtualObservatory",
    ],
    "Cosmology" => [
        "Cosmology"
    ],
    "Orbits & Emphemerides" => [
        # "JPLEphemeris",
        "EarthOrientation",
        "Transits",
        "PlanetOrbits",
        "AstroLib",
    ],
    "Numerical Utilities" => [
        "BoxLeastSquares",
        "LombScargle"
    ],
    "Statistics" => [
        "PairPlots"
    ]
]


# Intro pages to a given category.
# Ensure order matches the above.
catpagestarts = [
    Any["highlevels/timecoords.md"],
    Any["highlevels/images.md"],
    Any["highlevels/dataio.md"],
    Any["highlevels/cosmology.md"],
    Any["highlevels/orb-ephem.md"],
    Any["highlevels/numerical-utils.md"],
    Any["highlevels/stats.md"],
]

# 3rd party packages: pull in README only
usereadme = Dict(

    # These are breaking the build for some reason
    "PSFModels" => "https://github.com/JuliaAstro/PSFModels.jl",
    # "LACosmic" => "https://github.com/JuliaAstro/LACosmic.jl",
    "Transits" => "https://github.com/JuliaAstro/Transits.jl",

    # No docs page yet
    "AstroAngles" => "https://github.com/JuliaAstro/AstroAngles.jl",

    # Ecosystem
    "CasaCore" => "https://github.com/mweastwood/CasaCore.jl",
    "Difmap" => "https://github.com/JuliaAPlavin/Difmap.jl",
    "OIFITS" => "https://github.com/emmt/OIFITS.jl",
    "PairPlots" => "https://github.com/sefffal/PairPlots.jl",
    "PlanetOrbits" => "https://github.com/sefffal/PlanetOrbits.jl",
    "SkyImages" => "https://github.com/JuliaAPlavin/SkyImages.jl",
    "VLBIData" => "https://github.com/JuliaAPlavin/VLBIData.jl",
    "VOTables" => "https://github.com/JuliaAPlavin/VOTables.jl",
    "VirtualObservatory" => "https://github.com/JuliaAPlavin/VirtualObservatory.jl",
)

# Specify revision to install and build docs for.
# Every package must be listed here UNLESS it's listed in `usereadme` above.
pkgrevs = Dict(
    "AstroAngles"       =>  "main",
    "AstroImages"       =>  "master",
    "AstroLib"          =>  "master",
    "AstroLib"          =>  "master",
    "AstroTime"         =>  "main",
    "BoxLeastSquares"   =>  "main",
    # "CCDReduction"    =>  "main",
    "CFITSIO"           =>  "master",
    "Cosmology"         =>  "master",
    "DustExtinction"    =>  "master",
    "EarthOrientation"  =>  "master",
    "ERFA"              =>  "main",
    "FITSIO"            =>  "master",
    "LACosmic"          =>  "main",
    #"JPLEphemeris"     =>  "master",
    "LombScargle"       =>  "master",
    "Photometry"        =>  "main",
    # "PSFModels"       =>  "main",
    "SAOImageDS9"       =>  "master",
    "SkyCoords"         =>  "master",
    # "Transits"        =>  "main",
    "UnitfulAstro"      =>  "master",
    "WCS"               =>  "master",
)
