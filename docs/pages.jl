# This file specifies what packages to document

# Plain documenter pages
fullpages = Any[
    "Home"=>"index.md",
    # "Ecosystem" => "ecosystem.md";
    "Tutorials" => [
        "tutorials/index.md",
        "General" => [
            "tutorials/jwst-image-scale-bar.md",
            "tutorials/tabular-data.md",
            "tutorials/curve-fit.md",
        ]
    ],
    "Time, Coordinates, & Units" => "highlevels/timecoords.md",
    "Images" => "highlevels/images.md",
    "Data I/O" => "highlevels/dataio.md",
    "Cosmology" => "highlevels/cosmology.md",
    "Orbits & Emphemerides" => "highlevels/orb-ephem.md",
    "Numerical Utilities" => "highlevels/numerical-utils.md",
    "Statistics" => "highlevels/stats.md",
]
