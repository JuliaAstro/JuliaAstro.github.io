var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#UnitfulAstro.jl-Documentation-1",
    "page": "Home",
    "title": "UnitfulAstro.jl Documentation",
    "category": "section",
    "text": "UnitfulAstro.jl is an extension of Unitful.jl to include units commonly encountered in astronomy."
},

{
    "location": "#Table-of-Units-1",
    "page": "Home",
    "title": "Table of Units",
    "category": "section",
    "text": "The list of additional units is given below:Name Binding Value\nErg UnitfulAstro.erg 1//10000000 J\nDyne UnitfulAstro.dyn 1//100000 N\nArcminute UnitfulAstro.arcminute 0.016666666666666666 °\nArcsecond UnitfulAstro.arcsecond 0.0002777777777777778 °\nJulian year UnitfulAstro.yr 365.25 dy\nAstronomical unit UnitfulAstro.AU 1.495978707e13 cm\nLight year UnitfulAstro.ly 9.4607304725808e17 cm\nParsec UnitfulAstro.pc 3.0856775814913674e18 cm\nJansky UnitfulAstro.Jy 1.0e-23 erg Hz^-1 cm^-2 s^-1\nAngstrom UnitfulAstro.angstrom 0.1 nm\nSolar radius UnitfulAstro.Rsun 6.957e10 cm\nSolar irradiance UnitfulAstro.Ssun 1.361e6 erg cm^-2 s^-1\nSolar luminosity UnitfulAstro.Lsun 3.828e33 erg s^-1\nG × Solar mass UnitfulAstro.GMsun 1.3271244e20 m^3 s^-2\nSolar mass UnitfulAstro.Msun 1.9884754153381438e33 g\nEarth radius (equatorial) UnitfulAstro.Rearth_e 6.3781e8 cm\nEarth radius (polar) UnitfulAstro.Rearth_p 6.3568e8 cm\nEarth radius UnitfulAstro.Rearth 6.3781e8 cm\nG × Earth mass UnitfulAstro.GMearth 3.986004e14 m^3 s^-2\nEarth mass UnitfulAstro.Mearth 5.972364730419773e27 g\nJupiter radius (equatorial) UnitfulAstro.Rjup_e 7.1492e9 cm\nJupiter radius (polar) UnitfulAstro.Rjup_p 6.6854e9 cm\nJupiter radius UnitfulAstro.Rjup 7.1492e9 cm\nG × Jupiter mass UnitfulAstro.GMjup 1.2668653e17 m^3 s^-2\nJupiter mass UnitfulAstro.Mjup 1.8981871658715508e30 g\nFifty-one ergs UnitfulAstro.foe 1.0e51 erg\nSolar flux unit UnitfulAstro.SFU 10//1 kJy\nTotal electron content unit UnitfulAstro.TECU 1.0e12 cm^-2"
},

{
    "location": "#Examples-1",
    "page": "Home",
    "title": "Examples",
    "category": "section",
    "text": "julia> using Unitful, UnitfulAstro\n\njulia> uconvert(u\"erg\", 1 * Unitful.kg * Unitful.gn * Unitful.m)\n9.80665e7 erg\n\njulia> uconvert(u\"Jy\", 1.23e-20 * u\"erg/s/cm^2/Hz\")\n1230.0000000000002 Jy\n\njulia> uconvert(u\"ly\", 1 * u\"pc\")\n3.2615637771674337 ly"
},

{
    "location": "#IAU-Resolutions-1",
    "page": "Home",
    "title": "IAU Resolutions",
    "category": "section",
    "text": "Copies of recent IAU resolutions which formalize the definitions of some units used in this package are linked below.IAU 2012 (pdf)\nIAU 2015 (pdf)"
},

]}
