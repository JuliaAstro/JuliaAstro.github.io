var documenterSearchIndex = {"docs":
[{"location":"api/#API/Reference","page":"API/Reference","title":"API/Reference","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"DocTestSetup = :(using SkyCoords)","category":"page"},{"location":"api/#Index","page":"API/Reference","title":"Index","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"pages = [\"api.md\"]","category":"page"},{"location":"api/#Types","page":"API/Reference","title":"Types","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"AbstractSkyCoords\nICRSCoords\nGalCoords\nFK5Coords\nEclipticCoords","category":"page"},{"location":"api/#SkyCoords.AbstractSkyCoords","page":"API/Reference","title":"SkyCoords.AbstractSkyCoords","text":"The supertype for all sky coordinate systems.\n\n\n\n\n\n","category":"type"},{"location":"api/#SkyCoords.ICRSCoords","page":"API/Reference","title":"SkyCoords.ICRSCoords","text":"ICRSCoords(ra, dec)\n\nInternational Celestial Reference System\n\nThis is the current standard adopted by the International Astronomical Union notably due to its high level of accuracy compared to standard equatorial coordinate systems. What sets this apart from FK5Coords is that it is completely defined using extragalactic radio sources rather than a geocentric frame, which means the reference frame will not change due to Earth's motion.\n\nCoordinates\n\nra - Right ascension in radians (0, 2π)\ndec - Declination in radians (-π/2, π/2)\n\n\n\n\n\n","category":"type"},{"location":"api/#SkyCoords.GalCoords","page":"API/Reference","title":"SkyCoords.GalCoords","text":"GalCoords(l, b)\n\nGalactic Coordinate System\n\nThis coordinate system is defined based on the projection of the Milky Way galaxy onto our celestial sphere, with (0, 0) being approximately the center of our galaxy.\n\nCoordinates\n\nl - Galactic longitude in radians (-π, π)\nb - Galactic latitude in radians (-π/2, π/2)\n\n\n\n\n\n","category":"type"},{"location":"api/#SkyCoords.FK5Coords","page":"API/Reference","title":"SkyCoords.FK5Coords","text":"FK5Coords{equinox}(ra, dec)\n\nEquatorial Coordinate System\n\nThis coordinate system maps the celestial sphere based on a geocentric observer. Historically the oldest, this coordinate system has been shown to be inaccurate due to its definitions based on the Earth, which has long-scale precession causing the reference frame to change. Because of this, an equinox must be provided (typically 2000, commonly known as J2000) which defines the reference frame.\n\nCoordinates\n\nra - Right ascension in radians (0, 2π)\ndec - Declination in radians (-π/2, π/2)\n\n\n\n\n\n","category":"type"},{"location":"api/#SkyCoords.EclipticCoords","page":"API/Reference","title":"SkyCoords.EclipticCoords","text":"EclipticCoords{equinox}(lon, lat)\n\nEcliptic Coordinate System\n\nThis coordinate system is geocentric with the ecliptic plane as the xy-plane with x oriented according to the equinox specified by equinox.\n\nCoordinates\n\nlon - Longitude in radians (0, 2π)\nlat - Latitude in radians (-π/2, π/2)\n\n\n\n\n\n","category":"type"},{"location":"api/#Conversion","page":"API/Reference","title":"Conversion","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"To convert between types, there are three (equivalent) methods of doing so.","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"julia> c1 = ICRSCoords(0., 0.)\nICRSCoords{Float64}(0.0, 0.0)","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"using convert","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"julia> convert(GalCoords, c1)\nGalCoords{Float64}(1.6814027872278692, -1.0504884034813007)","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"using constructors","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"julia> GalCoords(c1)\nGalCoords{Float64}(1.6814027872278692, -1.0504884034813007)","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"using |>","category":"page"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"julia> c1 |> GalCoords\nGalCoords{Float64}(1.6814027872278692, -1.0504884034813007)","category":"page"},{"location":"api/#Functions","page":"API/Reference","title":"Functions","text":"","category":"section"},{"location":"api/","page":"API/Reference","title":"API/Reference","text":"separation\nposition_angle\noffset","category":"page"},{"location":"api/#SkyCoords.separation","page":"API/Reference","title":"SkyCoords.separation","text":"separation(c1::AbstractSkyCoords, c2::AbstractSkyCoords) -> distance\n\nReturn angular separation between two sky coordinates, in radians.\n\nThe angular separation is calculated using the Vincenty formula, which is slightly more complex and computationally expensive than some alternatives, but is stable at at all distances, including the poles and antipodes.\n\n\n\n\n\n","category":"function"},{"location":"api/#SkyCoords.position_angle","page":"API/Reference","title":"SkyCoords.position_angle","text":"position_angle(c1::AbstractSkyCoords, c2::AbstractSkyCoords) -> angle\n\nReturn position angle between two sky coordinates, in positive radians.\n\nExamples\n\njulia> c1 = ICRSCoords(0, 0); c2 = ICRSCoords(deg2rad(1), 0);\n\njulia> position_angle(c1, c2) |> rad2deg\n90.0\n\n\n\n\n\n","category":"function"},{"location":"api/#SkyCoords.offset","page":"API/Reference","title":"SkyCoords.offset","text":"offset(::AbstractSkyCoords, separation, pa) -> coordinate\n\nOffset a coordinate by a given angular separation, separation, in radians and position angle, pa, in radians.\n\nUses the sine and cosine rules in spherical coordinates with corrections for the antipodes. Returns a sky coordinate of the same type as input.\n\nExamples\n\njulia> c1 = ICRSCoords(0, 0);\n\njulia> c2 = offset(c1, deg2rad(1), deg2rad(90))\nICRSCoords{Float64}(0.017453292519943295, 1.0686516840418957e-18)\n\njulia> offset(c1, c2) .|> rad2deg\n(1.0, 90.0)\n\nSee Also\n\nseparation, position_angle\n\n\n\n\n\noffset(::AbstractSkyCoords, AbstractSkyCoords) -> angle, angle\n\nReturn the separation and position angle in radians between two sky coordinates.\n\nExamples\n\njulia> c1 = ICRSCoords(0, 0); c2 = ICRSCoords(deg2rad(1), 0);\n\njulia> offset(c1, c2) .|> rad2deg\n(1.0, 90.0)\n\nSee Also\n\nseparation, position_angle\n\n\n\n\n\n","category":"function"},{"location":"#SkyCoords.jl","page":"Home","title":"SkyCoords.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: GitHub) (Image: Build Status) (Image: PkgEval) (Image: Coverage)","category":"page"},{"location":"","page":"Home","title":"Home","text":"SkyCoords.jl provides a type system for astronomical coordinate systems with appropriate conversions between them.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"From the Julia REPL","category":"page"},{"location":"","page":"Home","title":"Home","text":"(v1.6) pkg> add SkyCoords\n\njulia> using SkyCoords","category":"page"},{"location":"","page":"Home","title":"Home","text":"DocTestSetup = :(using SkyCoords)","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"There are currently three supported coordinate systems. The following immutable types are used to represent coordinates in each system:","category":"page"},{"location":"","page":"Home","title":"Home","text":"ICRSCoords: ICRS coordinates system\nGalCoords: Galactic coordinates system\nFK5Coords: FK5 coordinates system (with arbitrary equinox)\nEclipticCoords: Ecliptic coordinates system","category":"page"},{"location":"","page":"Home","title":"Home","text":"Each type holds a longitude and latitude, and each is a subtype of AbstractSkyCoords.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> c1 = ICRSCoords(0.0, 0.0)  # inputs are ra, dec in radians\nICRSCoords{Float64}(0.0, 0.0)\n\njulia> c1.ra # access ra, dec individually\n0.0\n\njulia> c2 = convert(GalCoords, c1) # convert to a different system\nGalCoords{Float64}(1.6814027872278692, -1.0504884034813007)\n\njulia> c2.l # Note that galactic coordinate fields are l, b\n1.6814027872278692\n\njulia> c1 |> FK5Coords{2000} # Can use piping syntax for conversion\nFK5Coords{2000, Float64}(1.1102233723050067e-7, 4.411803426976326e-8)","category":"page"},{"location":"#Units","page":"Home","title":"Units","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"There is built-in support for units via Unitful.jl","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Unitful\n\njulia> c = ICRSCoords(0.11255u\"°\", 0.00091u\"rad\")\nICRSCoords{Float64}(0.0019643680731196178, 0.00091)\n\njulia> c2 = FK5Coords{2000}(0.1u\"rad\", 0.5)\nFK5Coords{2000, Float64}(0.1, 0.5)\n\njulia> SkyCoords.lat(u\"μrad\", c)\n910.0 μrad","category":"page"},{"location":"#Parsing-from-strings","page":"Home","title":"Parsing from strings","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The AstroAngles.jl package provides convenient string parsing utilities","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using AstroAngles\n\njulia> c3 = ICRSCoords(hms\"05:34:31.94\", dms\"+22:00:52.2\")\nICRSCoords{Float64}(1.4596726677614607, 0.3842255081802917)","category":"page"},{"location":"","page":"Home","title":"Home","text":"for example, to load coordinates from a target list","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using CSV, DataFrames\n\njulia> table = CSV.File(\"target_list.csv\") |> DataFrame;\n\njulia> [table.ra table.dec]\n203×2 Matrix{String}:\n \"00 05 01.42\"  \"40 03 35.82\"\n \"00 05 07.52\"  \"73 13 11.34\"\n \"00 36 01.40\"  \"-11 12 13.00\"\n[...]\n\njulia> coords = @. ICRSCoords(hms2rad(table.ra), dms2rad(table.dec))\n203-element Vector{ICRSCoords{Float64}}:\n ICRSCoords{Float64}(0.021919880964005448, 0.6991780256843024)\n ICRSCoords{Float64}(0.022363485482220672, 1.277926878539953)\n ICRSCoords{Float64}(0.15718144355252264, -0.19553990200190915)\n[...]","category":"page"},{"location":"#Angular-Separation-between-Coordinates","page":"Home","title":"Angular Separation between Coordinates","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The separation function allows you to compute the angular (great-circle) distance between two coordinates, in radians, using the Vincenty formula.  The coordinates can be also given in different systems.  For example, according to SIMBAD the FK5Coords{2000} coordinates of Mizar are","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> mizar = FK5Coords{2000}(3.507787, 0.958628)\nFK5Coords{2000, Float64}(3.507787, 0.958628)","category":"page"},{"location":"","page":"Home","title":"Home","text":"while the GalCoords coordinates of Alcor are","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> alcor = GalCoords(1.968189, 1.072829)\nGalCoords{Float64}(1.968189, 1.072829)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Their angular separation is given by","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> separation(mizar, alcor) # Radians\n0.003435309169452965\n\njulia> rad2deg(separation(mizar, alcor)) * 60 # Arcminutes\n11.809723003934822","category":"page"},{"location":"","page":"Home","title":"Home","text":"with an angle","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> position_angle(mizar, alcor) # radians\n1.2446024012417884\n\njulia> position_angle(mizar, alcor) |> rad2deg # degrees\n71.31046476300233\n","category":"page"},{"location":"#Accuracy","page":"Home","title":"Accuracy","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"All the supported conversions have been compared to the results of astropy.coordinates (to better than 0.0001 arcsec agreement for Float64). In turn, astropy.coordinates has been tested against many other tools.","category":"page"},{"location":"#Performance","page":"Home","title":"Performance","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"For small and moderate numbers of coordinates, conversions are much faster than astropy.coordinates in Python. The following plot shows the performance for converting ICRS coordinates to various other systems (Galactic, FK5J2000 and FK5J1975), using astropy.coordinates (py_* labels) and SkyCoords.jl (jl_* labels). The x axis denotes the number of coordinates being simultaneously converted, with 1 corresponding to scalar coordinates.","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: times)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Specs \nCPU Intel core i5-8259U @ 2.3GHz (4 cores)\nRAM 16GB\nJulia Version 1.2\nPython Version 3.7\nAstropy Version 3.1.2","category":"page"},{"location":"","page":"Home","title":"Home","text":"For scalar coordinates, SkyCoords.jl is up to 100,000 times faster. For very large vectors of one million coordinates or more, SkyCoords.jl is 2-4 times faster.  The source code for these benchmarks can be found in bench/.","category":"page"},{"location":"#Contributing","page":"Home","title":"Contributing","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"If you would like to contribute to SkyCoords please head over to the GitHub page and file an issue or open a pull request!","category":"page"}]
}
