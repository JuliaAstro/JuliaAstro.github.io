var documenterSearchIndex = {"docs": [

{
    "location": "tutorial/#",
    "page": "Tutorial",
    "title": "Tutorial",
    "category": "page",
    "text": ""
},

{
    "location": "tutorial/#Tutorial-1",
    "page": "Tutorial",
    "title": "Tutorial",
    "category": "section",
    "text": "This tutorial will walk you through the features and functionality of CALCEPH.jl"
},

{
    "location": "tutorial/#Ephemerides-sources-1",
    "page": "Tutorial",
    "title": "Ephemerides sources",
    "category": "section",
    "text": "The supported sources of ephemerides are:JPL DExxx binary ephemerides files: https://ssd.jpl.nasa.gov/?planetephexport\nIMCCE INPOP ephemerides files: https://www.imcce.fr/inpop/\nsome NAIF SPICE kernels: https://naif.jpl.nasa.gov/naif/data.htmlExample:download(\"https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de435.bsp\",\"planets.dat\")\n# WARNING this next file is huge (Jupiter Moons ephemerides)\ndownload(\"https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup310.bsp\",\"jupiter_system.bsp\")"
},

{
    "location": "tutorial/#Ephemerides-context-1",
    "page": "Tutorial",
    "title": "Ephemerides context",
    "category": "section",
    "text": "The user first need to load the ephemerides files into an ephemerides context object that will be used later to retrieve position and velocities of celestial objects.A context can be made from one or several files:using CALCEPH\n\n# load a single file in context eph1\neph1 = Ephem(\"planets.dat\")\n\neph2 = Ephem([\"planets.dat\",\"jupiter_system.bsp\"])You must specify the relative or absolute path(s) of the file(s) to load.You can prefetch the ephemerides data into main memory for faster access:prefetch(eph2)"
},

{
    "location": "tutorial/#Epoch-arguments-1",
    "page": "Tutorial",
    "title": "Epoch arguments",
    "category": "section",
    "text": "CALCEPH function takes the epoch as the sum of two double precision floating arguments jd1 and jd2. The sum jd1 + jd2 is interpreted as the julian date in the timescale of the ephemerides context (usually TDB or sometimes TCB).For maximum accuracy, it is recommended to set jd2 to the fractional part of the julian date and jd1 to the difference: jd2 magnitude should be less than one while jd1 should have an integer value.If a high accuracy in timetag is not needed, jd1 can be set to the full julian date and jd2 to zero."
},

{
    "location": "tutorial/#Options-1",
    "page": "Tutorial",
    "title": "Options",
    "category": "section",
    "text": "Many CALCEPH function takes an integer argument to store options. The value of this argument is the sum of the option to enable (each option actually corresponds to a single bit of that integer). Each option to enable can appear only once in the sum!The following options are available:unitAU = 1: set distance units it to Astronomical Unit.\nunitKM = 2: set distance units to kilometers.\nunitDay = 4: set time units to days.\nunitSec = 8: set time units to seconds.\nunitRad = 16: set angle units to radians.\nuseNaifId = 32: set the body identification scheme to NAIF body identification scheme.\noutputEulerAngles = 64: when using body orientation ephemerides, this allows to choose Euler angle output.\noutputNutationAngles = 128: when using body orientation ephemerides, this allows to choose nutation angle output (if available).The useNaifId option controls the identification scheme for the input arguments: target and center.The units options controls the units of the outputs. It is compulsory to set the output units if the routine has the input argument options.For example to compute the position and velocity in kilometers and kilometers per second of body target (given as its NAIF identification number) with respect to center (given as its NAIF identification number), the options argument should be set as such:options = unitKM + unitSec + useNaifId"
},

{
    "location": "tutorial/#Body-identification-scheme-1",
    "page": "Tutorial",
    "title": "Body identification scheme",
    "category": "section",
    "text": "CALCEPH has the following identification scheme for bodies:1 : Mercury Barycenter\n2 : Venus Barycenter\n3 : Earth\n4 : Mars Barycenter\n5 : Jupiter Barycenter\n6 : Saturn Barycenter\n7 : Uranus Barycenter\n8 : Neptune Barycenter\n9 : Pluto Barycenter\n10 : Moon\n11 : Sun\n12 : Solar Sytem barycenter\n13 : Earth-moon barycenter\n14 : Nutation angles\n15 : Librations\n16 : difference TT-TDB\n17 : difference TCG-TCB\nasteroid number + 2000000 : asteroidIf target is 14, 15, 16 or 17 (nutation, libration, TT-TDB or TCG-TCB), center must be 0.The more complete NAIF identification scheme can be used if the value useNaifId is added to the options argument."
},

{
    "location": "tutorial/#NAIF-body-identification-scheme-1",
    "page": "Tutorial",
    "title": "NAIF body identification scheme",
    "category": "section",
    "text": "See https://naif.jpl.nasa.gov/pub/naif/toolkitdocs/C/req/naifids.htmlCALCEPH uses this identification scheme only when the value useNaifId is added to the options argument.The CALCEPH julia wrapper comes with the naifId object which contains the mapping between NAIF identification numbers and names:julia> naifId.id[:sun]\n10\n\njulia> naifId.id[:mars]\n499\n\njulia> naifId.names[0]\nSet(Symbol[:ssb, :solar_system_barycenter])\nnaifId also stores the following identifiers::timecenter (1000000000): the center argument when requesting a value from a time ephemeris.\n:ttmtdb (1000000001): the target argument when requesting a value from the difference TT-TDB time ephemeris.\n:tcgmtcb (1000000002): the target argument when requesting a value from the difference TCG-TCB time ephemeris.naifId is actually an instance of mutable struct BodyId. The user can also create its own identification scheme for its SPICE kernels:const MyUniverseIds = CALCEPH.BodyId()\nCALCEPH.add!(MyUniverseIds,:tatooine,1000001)\nCALCEPH.add!(MyUniverseIds,:dagobah,1000002)\nCALCEPH.add!(MyUniverseIds,:endor,1000003)\nCALCEPH.add!(MyUniverseIds,:deathstar,1000004)\nCALCEPH.add!(MyUniverseIds,:endor_deathstar_system_barycenter,1000005)\nCALCEPH.add!(MyUniverseIds,:edsb,1000005)You can also load identification data from an external file:loadData!(MyUniverseIds, \"MyUniverseIds.txt\"))See example: https://github.com/JuliaAstro/CALCEPH.jl/blob/master/data/NaifIds.txtNames from the file are converted to lower case and have spaces replaced by underscores before being converted to symbols/interned strings."
},

{
    "location": "tutorial/#Computing-positions-and-velocities:-1",
    "page": "Tutorial",
    "title": "Computing positions and velocities:",
    "category": "section",
    "text": "The following methods are available to compute position and velocity with CALCEPH:compute(eph,jd1,jd2,target,center)\ncompute(eph,jd1,jd2,target,center,options)\ncompute(eph,jd1,jd2,target,center,options,order)Those methods compute the position and its time derivatives of target with respect to center.The first argument eph is the ephemerides context.\nThe second and third arguments jd1 and jd2 are the epoch.\nThe third argument target is the body for which position is to be computed with respect to origin.\nThe fourth argument center is the origin.\nThe options argument shall specify the units. It can also be used to switch target and center numbering scheme to the NAIF identification scheme.\nThe order argument can be set to:\n0: compute position only\n1: compute position and velocity\n2: compute position, velocity and acceleration\n3: compute position, velocity, acceleration and jerk.When order is not specified, position and velocity are computed."
},

{
    "location": "tutorial/#Example:-1",
    "page": "Tutorial",
    "title": "Example:",
    "category": "section",
    "text": "Computing position only of Jupiter system barycenter with respect to the Earth Moon center in kilometers at JD=2456293.5 (Ephemeris Time).options = useNaifId + unitKM + unitSec\njd1 = 2456293.0\njd2 = 0.5\ncenter = naifId.id[:moon]\ntarget = naifId.id[:jupiter_barycenter]\npos = compute(eph2, jd1, jd2, target, center, options,0)"
},

{
    "location": "tutorial/#Computing-orientation:-1",
    "page": "Tutorial",
    "title": "Computing orientation:",
    "category": "section",
    "text": "The following methods are available to compute orientation angles with CALCEPH:orient(eph,jd1,jd2,target,options)\norient(eph,jd1,jd2,target,options,order)Those methods compute the Euler angles of target and their time derivatives.The first argument eph is the ephemerides context.\nThe second and third arguments jd1 and jd2 are the epoch.\nThe fourth argument target is the body for which the Euler angles are to be computed.\nThe options argument shall specify the units. It can also be used to switch target and center numbering scheme to the NAIF identification scheme and to switch between Euler angles and nutation angles.\nThe order argument can be set to:\n0: only the angles are computed.\n1: only the angles and first derivatives are computed.\n2: only the angles, the first and second derivatives are computed.\n3: the angles, the first, second and third derivatives are computed."
},

{
    "location": "tutorial/#Example:-2",
    "page": "Tutorial",
    "title": "Example:",
    "category": "section",
    "text": "JPL DE405 binary ephemerides contain Chebychev polynomials for the IAU 1980 nutation theory. Interpolating those is much faster than computing the IAU 1980 nutation series.     Computing Earth nutation angles in radians at JD=2456293.5 (Ephemeris Time).download(\"ftp://ssd.jpl.nasa.gov/pub/eph/planets/Linux/de405/lnxp1600p2200.405\",\"DE405\")\neph1 = Ephem(\"DE405\")\noptions = useNaifId + unitRad + unitSec + outputEulerAngles\njd1 = 2456293.0\njd2 = 0.5\ntarget = naifId.id[:earth]\nangles = orient(eph1, jd1, jd2, target, options,0)Note that the returned value is a vector of 3 even though there are only 2 nutation angles. The last value is zero and meaningless."
},

{
    "location": "tutorial/#Computing-angular-momentum:-1",
    "page": "Tutorial",
    "title": "Computing angular momentum:",
    "category": "section",
    "text": "The following methods are available to compute body angular momentum with CALCEPH:rotAngMom(eph,jd1,jd2,target,unit)\nrotAngMom(eph,jd1,jd2,target,unit,order)Those methods compute the angular momentum of target and their time derivatives.The first argument eph is the ephemerides context.\nThe second and third arguments jd1 and jd2 are the epoch.\nThe fourth argument target is the body for which the angular momentum are to be computed.\nThe options argument shall specify the units. It can also be used to switch target numbering scheme to the NAIF identification scheme.\nThe order argument can be set to:\n0: only the angular momentum vector are computed.\n1: only the angular momentum vector and first derivative are computed.\n2: only the angular momentum vector, the first and second derivatives are computed.\n3: the angular momentum, the first, second and third derivatives are computed."
},

{
    "location": "tutorial/#Time-ephemeris-1",
    "page": "Tutorial",
    "title": "Time ephemeris",
    "category": "section",
    "text": "The time ephemeris TT-TDB or TCG-TCB at the geocenter can be evaluated with a suitable source.INPOP and some JPL DE ephemerides includes a numerically integrated time ephemeris for the geocenter which is usually more accurate than the analytical series: Moreover it is much faster to interpolate those ephemerides than to evaluate the analytical series. This is only for the geocenter but a simple correction can also be added for the location of the observer (and its velocity in case the observer is on a highly elliptical orbit).Files that can be used to obtain the difference between TT and TDB are, e.g.:ftp://ftp.imcce.fr/pub/ephem/planets/inpop17a/inpop17aTDBm100p100tt.dat\nftp://ssd.jpl.nasa.gov/pub/eph/planets/bsp/de432t.bsp"
},

{
    "location": "tutorial/#Example:-3",
    "page": "Tutorial",
    "title": "Example:",
    "category": "section",
    "text": "Computing TT-TDB at geocenter in seconds at JD=2456293.5 (Ephemeris Time).download(\"ftp://ftp.imcce.fr/pub/ephem/planets/inpop17a/inpop17a_TDB_m100_p100_tt.dat\",\"INPOP17a\")\neph1 = Ephem(\"INPOP17a\")\noptions = useNaifId + unitSec\njd1 = 2456293.0\njd2 = 0.5\ntarget = naifId.id[:ttmtdb]\ncenter = naifId.id[:timecenter]\nttmtdb = compute(eph1, jd1, jd2, target, center, options,0)Note that the returned value is a vector of 3 even though there is only one meaningful value. The last 2 values are zero and meaningless."
},

{
    "location": "tutorial/#In-place-methods-1",
    "page": "Tutorial",
    "title": "In place methods",
    "category": "section",
    "text": "In place versions of the methods described above are also available. Those are:unsafe_compute!(result,eph,jd1,jd2,target,center)\nunsafe_compute!(result,eph,jd1,jd2,target,center,options)\nunsafe_compute!(result,eph,jd1,jd2,target,center,options,order)\nunsafe_orient!(result,eph,jd1,jd2,target,options)\nunsafe_orient!(result,eph,jd1,jd2,target,options,order)\nunsafe_rotAngMom!(result,eph,jd1,jd2,target,options)\nunsafe_rotAngMom!(result,eph,jd1,jd2,target,options,order)Those methods do not perform any checks on their inputs. In particular, result must be a contiguous vector of double precision floating point number of dimension at least 6 when order is not specified or at least 3*(order+1) otherwise."
},

{
    "location": "tutorial/#Constants-1",
    "page": "Tutorial",
    "title": "Constants",
    "category": "section",
    "text": "Ephemerides files may contain related constants. Those can be obtained by the constants method which returns a dictionary:download(\"ftp://ftp.imcce.fr/pub/ephem/planets/inpop17a/inpop17a_TDB_m100_p100_tt.dat\",\"INPOP17a\")\neph1 = Ephem(\"INPOP17a\")\n# retrieve constants from ephemeris as a dictionary\ncon = constants(eph1)\n# list the constants\nkeys(con)\n# get the sun J2\nJ2sun = con[:J2SUN]"
},

{
    "location": "tutorial/#Introspection-1",
    "page": "Tutorial",
    "title": "Introspection",
    "category": "section",
    "text": ""
},

{
    "location": "tutorial/#Time-scale-1",
    "page": "Tutorial",
    "title": "Time scale",
    "category": "section",
    "text": "timeScale(eph)returns the Ephemeris Time identifier:1 for TDB\n2 for TCB"
},

{
    "location": "tutorial/#Time-span-1",
    "page": "Tutorial",
    "title": "Time span",
    "category": "section",
    "text": "timespan(eph)returns the triplet:julian date of first entry in ephemerides context.\njulian date of last entry in ephemerides context.\ninformation about the availability of the quantities over the time span:\n1 if the quantities of all bodies are available for any time between the first and last time.\n2 if the quantities of some bodies are available on discontinuous time intervals between the first and last time.\n3 if the quantities of each body are available on a continuous time interval between the first and last time, but not available for any time between the first and last time."
},

{
    "location": "tutorial/#Position-records-1",
    "page": "Tutorial",
    "title": "Position records",
    "category": "section",
    "text": "positionRecords(eph)retrieve position records metadata in ephemeris associated to handler eph. This is a vector of metadata about the ephemerides records ordered by priority. The compute methods use the highest priority ephemerides records when there are multiple records that could satisfy the target and epoch.Each record metadata contains the following information:target: NAIF identifier of target.\ncenter: NAIF identifier of center.\nstartEpoch: julian date of record start.\nstopEpoch: julian date of record end.\nframe : 1 for ICRF."
},

{
    "location": "tutorial/#Orientation-records-1",
    "page": "Tutorial",
    "title": "Orientation records",
    "category": "section",
    "text": "orientationRecords(eph)retrieve orientation records metadata in ephemeris associated to handler eph. This is a vector of metadata about the ephemerides records ordered by priority. The orient methods use the highest priority ephemerides records when there are multiple records that could satisfy the target and epoch.Each record metadata contains the following information:target: NAIF identifier of target.\nstartEpoch: julian date of record start.\nstopEpoch: julian date of record end.\nframe : 1 for ICRF."
},

{
    "location": "tutorial/#Cleaning-up-1",
    "page": "Tutorial",
    "title": "Cleaning up",
    "category": "section",
    "text": "Because, Julia\'s garbage collector is lazy, you may want to free the memory managed by the context before you get rid of the reference to the context with eg:finalize(eph1)\neph1 = Noneor after witheph1 = None\ngc()"
},

]}
