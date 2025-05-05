var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#EarthOrientation.jl-1",
    "page": "Home",
    "title": "EarthOrientation.jl",
    "category": "section",
    "text": "Calculate Earth orientation parameters from IERS tables in Julia."
},

{
    "location": "index.html#Installation-1",
    "page": "Home",
    "title": "Installation",
    "category": "section",
    "text": "The package can be installed through Julia's package manager:Pkg.add(\"EarthOrientation\")"
},

{
    "location": "index.html#Quickstart-1",
    "page": "Home",
    "title": "Quickstart",
    "category": "section",
    "text": "Fetch the latest [IERS][iers-link] tables:using EarthOrientation\nEarthOrientation.update()Get the current Earth orientation parameters, e.g. for polar motion:xp, yp = polarmotion(now()) # arcsecondsOr the current difference between UT1 and UTC and the associated prediction error:ΔUT1 = getΔUT1(now()) # seconds\nΔUT1_err = getΔUT1_err(now()) # seconds"
},

{
    "location": "index.html#Available-data-1",
    "page": "Home",
    "title": "Available data",
    "category": "section",
    "text": "Polar motion:\nx-coordinate of Earth's north pole: getxp\ny-coordinate of Earth's north pole: getyp\nboth: polarmotion\nEarth rotation\nDifference between UT1 and UTC: getΔUT1\nExcess length of day: getlod\nPrecession and nutation based on the 1980 IAU conventions\nCorrection to the nutation of the ecliptic: getdψ\nCorrection to the obliquity of the ecliptic: getdϵ\nboth: precession_nutation80\nPrecession and nutation based on the 2000 IAU conventions\nCorrection to the celestial pole's x-coordinate: getdx\nCorrection to the celestial pole's y-coordinate: getdy\nboth: precession_nutation00There is an associated function that returns the prediction error for each data type, e.g. getxp_err."
},

{
    "location": "index.html#Manual-Data-Management-1",
    "page": "Home",
    "title": "Manual Data Management",
    "category": "section",
    "text": "By default the files downloaded by EarthOrientation.update() will be used. It is also possible to pass different finals.all and finals2000A.all files in CSV format.using EarthOrientation\n\npush!(EOP_DATA, \"finals.csv\", \"finals2000A.csv\")"
},

{
    "location": "api.html#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api.html#EarthOrientation.EOParams-Tuple{String,String}",
    "page": "API",
    "title": "EarthOrientation.EOParams",
    "category": "Method",
    "text": "EOParams(iau1980file::String, iau2000file::String)\n\nParse IERS data files into a EOParams object. iau1980file and iau2000file are the paths to a 'finals.all' and a 'finals2000A.all' CSV file, respectively.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdx-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdx",
    "category": "Method",
    "text": "getdx(date; extrapolate=true, warnings=true)\n\nGet the celestial pole x-coordinate correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdx_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdx_err",
    "category": "Method",
    "text": "getdx_err(date; extrapolate=true, warnings=true)\n\nGet the error in celestial pole x-coordinate correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdy-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdy",
    "category": "Method",
    "text": "getdy(date; extrapolate=true, warnings=true)\n\nGet the celestial pole y-coordinate correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdy_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdy_err",
    "category": "Method",
    "text": "getdy_err(date; extrapolate=true, warnings=true)\n\nGet the error in celestial pole y-coordinate correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdψ-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdψ",
    "category": "Method",
    "text": "getdψ(date; extrapolate=true, warnings=true)\n\nGet the ecliptic nutation correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdψ_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdψ_err",
    "category": "Method",
    "text": "getdψ_err(date; extrapolate=true, warnings=true)\n\nGet the error in the ecliptic nutation correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdϵ-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdϵ",
    "category": "Method",
    "text": "getdϵ(date; extrapolate=true, warnings=true)\n\nGet the ecliptic obliquity correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getdϵ_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getdϵ_err",
    "category": "Method",
    "text": "getdϵ_err(date; extrapolate=true, warnings=true)\n\nGet the error in the ecliptic obliquity correction for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getlod-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getlod",
    "category": "Method",
    "text": "getlod(date; extrapolate=true, warnings=true)\n\nGet the excess length of day for a certain date in milliseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getlod_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getlod_err",
    "category": "Method",
    "text": "getlod_err(date; extrapolate=true, warnings=true)\n\nGet the error in the excess length of day for a certain date in milliseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getxp-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getxp",
    "category": "Method",
    "text": "getxp(date; extrapolate=true, warnings=true)\n\nGet the x-coordinate of Earth's north pole w.r.t. the CIO for a certain date in arcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getxp_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getxp_err",
    "category": "Method",
    "text": "getxp_err(date; extrapolate=true, warnings=true)\n\nGet the error for the x-coordinate of Earth's north pole w.r.t. the CIO for a certain date in arcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getyp-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getyp",
    "category": "Method",
    "text": "getyp(date; extrapolate=true, warnings=true)\n\nGet the y-coordinate of Earth's north pole w.r.t. the CIO for a certain date in arcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getyp_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getyp_err",
    "category": "Method",
    "text": "getyp_err(date; extrapolate=true, warnings=true)\n\nGet the error for the y-coordinate of Earth's north pole w.r.t. the CIO for a certain date in arcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getΔUT1-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getΔUT1",
    "category": "Method",
    "text": "getΔUT1(date; extrapolate=true, warnings=true)\n\nGet the difference between UTC and UT1 for a certain date in seconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.getΔUT1_err-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.getΔUT1_err",
    "category": "Method",
    "text": "getΔUT1_err(date; extrapolate=true, warnings=true)\n\nGet the error in the difference between UTC and UT1 for a certain date in seconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.polarmotion-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.polarmotion",
    "category": "Method",
    "text": "polarmotion(date; extrapolate=true, warnings=true)\n\nGet the coordinates of Earth's north pole w.r.t. the CIO for a certain date in arcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.precession_nutation00-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.precession_nutation00",
    "category": "Method",
    "text": "precession_nutation00(date; extrapolate=true, warnings=true)\n\nGet the celestial pole coordinate corrections for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#EarthOrientation.precession_nutation80-Tuple{Any,Any}",
    "page": "API",
    "title": "EarthOrientation.precession_nutation80",
    "category": "Method",
    "text": "precession_nutation80(date; extrapolate=true, warnings=true)\n\nGet the ecliptic corrections for a certain date in milliarcseconds.\n\ndate can either be a DateTime object or a Julian date represented by a Float64. If extrapolate is false an exception will be thrown if date is beyond the range of the table contained in eop. If warnings is true the user will be warned if the result is extrapolated.\n\n\n\n"
},

{
    "location": "api.html#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "Modules = [EarthOrientation]\nPrivate = false"
},

]}
