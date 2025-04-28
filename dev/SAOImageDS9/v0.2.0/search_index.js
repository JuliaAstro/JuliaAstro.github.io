var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Introduction",
    "title": "Introduction",
    "category": "page",
    "text": ""
},

{
    "location": "#Introduction-1",
    "page": "Introduction",
    "title": "Introduction",
    "category": "section",
    "text": "The SAOImageDS9 package provides an interface between Julia and the image viewer SAOImage/DS9 via XPA.jl, a Julia interface to the XPA Messaging System."
},

{
    "location": "#Table-of-contents-1",
    "page": "Introduction",
    "title": "Table of contents",
    "category": "section",
    "text": "Pages = [\"install.md\", \"starting.md\", \"requests.md\",\n         \"connect.md\", \"drawing.md\", \"examples.md\",\n         \"library.md\"]"
},

{
    "location": "#Method-index-1",
    "page": "Introduction",
    "title": "Method index",
    "category": "section",
    "text": ""
},

{
    "location": "install/#",
    "page": "Installation",
    "title": "Installation",
    "category": "page",
    "text": ""
},

{
    "location": "install/#Installation-1",
    "page": "Installation",
    "title": "Installation",
    "category": "section",
    "text": "To use this package, the SAOImage/DS9 program and the XPA dynamic library and headers must be installed on your computer.  If this is not the case, they are available for different operating systems.  For example, on Debian or Ubuntu-like Linux system, you can call apt-get from the command line:sudo apt-get install saods9 libxpa-devSAOImageDS9 can be can be installed by Julia\'s package manager:... pkg> add https://github.com/JuliaAstro/SAOImageDS9.jlAnother possibility from Julia\'s REPL or in a Julia script:using Pkg\nPkg.add(PackageSpec(url=\"https://github.com/JuliaAstro/SAOImageDS9.jl\", rev=\"master\"))See XPA.jl site for instructions about how to install this package if the installation of SAOImageDS9 fails to properly install this required package.To upgrade the SAOImageDS9 package:using Pkg\nPkg.update(\"SAOImageDS9\")There is nothing to build."
},

{
    "location": "starting/#",
    "page": "Starting",
    "title": "Starting",
    "category": "page",
    "text": ""
},

{
    "location": "starting/#Starting-1",
    "page": "Starting",
    "title": "Starting",
    "category": "section",
    "text": "To use SAOImageDS9 package, type:using SAOImageDS9will import the symbol DS9 which can be used to prefix all methods available in SAOImageDS9 instead of the full package name which can be a bit tedious in interactive sessions.  If you prefer another prefix, say sao, you can do:import SAOImageDS9\nconst sao = SAOImageDS9or (provided your Julia version is at least 1.6):import SAOImageDS9 as saoYou may also just import SAOImageDS9 and keep the SAOImageDS9 prefix. Throughout all the remaining documentation, no shortcut is assumed.You may call the SAOImageDS9.connect method to specify the access point to a given running SAOImage/DS9 application.  If no given access point is specified, SAOImageDS9 will automatically attempts to connect to the first access point matching \"DS9.*\" when a command is sent to SAOImage/DS9.  The method SAOImageDS9.accesspoint() yields the name of the current access point to SAOImage/DS9, or an empty string if none has been chosen.To check the connection to SAOImage/DS9, you can type:SAOImageDS9.get(VersionNumber)which should yield the version of the SAOImage/DS9 to which you are connected."
},

{
    "location": "requests/#",
    "page": "SAOImage/DS9 requests",
    "title": "SAOImage/DS9 requests",
    "category": "page",
    "text": ""
},

{
    "location": "requests/#SAOImage/DS9-requests-1",
    "page": "SAOImage/DS9 requests",
    "title": "SAOImage/DS9 requests",
    "category": "section",
    "text": "There are two kinds of requests: get requests to retrieve some information or data from SAOImage/DS9 and set requests to send some data to SAOImage/DS9 or to set some of its parameters."
},

{
    "location": "requests/#Set-requests-1",
    "page": "SAOImage/DS9 requests",
    "title": "Set requests",
    "category": "section",
    "text": "The general syntax to perform a set request to the current SAOImage/DS9 access point is:SAOImageDS9.set(args...; data=nothing)where args... are any number of arguments which will be automatically converted in a string where the arguments are separated by spaces.  The keyword data may be used to specify the data to send with the request, it may be nothing (the default) or a Julia array.  For instance, the following 3 calls will set the current zoom to be equal to 3.7:SAOImageDS9.set(:zoom,:to,3.7)\nSAOImageDS9.set(\"zoom to\",3.7)\nSAOImageDS9.set(\"zoom to 3.7\")where the last line shows the string which is effectively sent to SAOImage/DS9 via the XPA.set method in the 3 above cases.As a special case, args... can be a single array to send to SAOImage/DS9 for being displayed:SAOImageDS9.set(arr)where arr is a 2D or 3D Julia array.  SAOImage/DS9 will display the values of arr as an image (if arr is a 2D array) or a sequence of images (if arr is a 3D array) in the currently selected frame with the current scale parameters, zoom, orientation, rotation, etc.  Keyword order can be used to specify the byte ordering.  Keyword new can be set true to display the image in a new SAOImage/DS9 frame."
},

{
    "location": "requests/#Get-requests-1",
    "page": "SAOImage/DS9 requests",
    "title": "Get requests",
    "category": "section",
    "text": "To perform a get request, the general syntax is:SAOImageDS9.get([T, [dims,]] args...)where the args... arguments are treated as for the SAOImageDS9.set method (that is converted into a single text string with separating spaces).  Optional arguments T and dims are to specify the type of the expected result and, possibly, its list of dimensions.If neither T nor dims are specified, the result of the SAOImageDS9.get(args...) call is an instance of XPA.Reply (see documentation about XPA.jl package for how to deal with the contents of such an instance).The following methods can be used to issue a get request to the current DS9 access point depending on the expected type of result:SAOImageDS9.get(Vector{UInt8}, args...)         -> buf\nSAOImageDS9.get(String, args...)                -> str\nSAOImageDS9.get(Vector{String}, args...;\n                delim=isspace, keepempty=false) -> arr\nSAOImageDS9.get(Tuple{Vararg{String}}, args...;\n                delim=isspace, keepempty=false) -> tupwhere args... are treated as for the SAOImageDS9.set method.  The returned values are respectively a vector of bytes, a single string (with the last end-of-line removed if any), an array of strings (one for each line of the result and empty line removed unless keyword keepempty is set true), or an array of (non-empty) words.If a single scalar integer or floating point is expected, two methods are available:SAOImageDS9.get(Int, args...)    -> scalar\nSAOImageDS9.get(Float, args...)  -> scalarwhich return respectively an Int and a Float64.To retrieve the array displayed by the current SAOImage/DS9 frame, do:arr = SAOImageDS9.get(Array);Keyword order can be used to specify the byte ordering."
},

{
    "location": "connect/#",
    "page": "Connection to a specific server",
    "title": "Connection to a specific server",
    "category": "page",
    "text": ""
},

{
    "location": "connect/#Connection-to-a-specific-server-1",
    "page": "Connection to a specific server",
    "title": "Connection to a specific server",
    "category": "section",
    "text": "When SAOImageDS9.connect() is called without any argument, all subsequent requests will be sent to the first SAOImage/DS9 instance found by the XPA name server.  To send further requests to a specific SAOImage/DS9 server, you may do:SAOImageDS9.connect(apt) -> identwhere apt is a string identifying a specific XPA access point.  The returned value is the fully qualified identifier of the access point, it has the form host:port for a TCP/IP socket or it is the path to the socket file for an AF/Unix socket.  The access point apt may be a fully qualified identifier or a template of the form class:name like \"DS9:*\" which corresponds to any server of the class \"DS9\".  Note that name is the argument of the -title option when SAOImage/DS9 is launched.  See XPA Template for a complete description.  When SAOImageDS9.connect() is called with no arguments or with a template containing wild characters, it automatically connects to the first access point matching the template (\"DS9.*\" by default) with a warning if no access points, or if more than one access point are found.To retrieve the identifier of the current access point to SAOImage/DS9, you may call:SAOImageDS9.accesspoint()which yields an empty string if there are no current connection.Remember that all requests are sent to a given access point, but you may switch between SAOImage/DS9 servers.  For instance:apt1 = SAOImageDS9.accesspoint()             # retrieve current access point\napt2 = SAOImageDS9.connect(\"DS9:some_name\")  # second access point\nSAOImageDS9.set(arr)                         # send an image to apt2\nSAOImageDS9.connect(apt1);                   # switch to apt1\nSAOImageDS9.set(\"zoom to\", 1.4)              # set zoom in apt1"
},

{
    "location": "drawing/#",
    "page": "Drawing in SAOImage/DS9",
    "title": "Drawing in SAOImage/DS9",
    "category": "page",
    "text": ""
},

{
    "location": "drawing/#Drawing-in-SAOImage/DS9-1",
    "page": "Drawing in SAOImage/DS9",
    "title": "Drawing in SAOImage/DS9",
    "category": "section",
    "text": "SAOImageDS9 can be used to quickly draw or display things in SAOImage/DS9.For instance, assuming img is a 2-dimensional Julia array, to display img as an image in SAOImage/DS9, call:SAOImageDS9.draw(img; kwds...)The main difference with SAOImageDS9.set(img) is that a number of keywords are supported:Use keyword frame to specify the frame number.\nUse keyword cmap to specify the name of the colormap.  For instance, cmap=\"gist_stern\".\nUse keyword zoom to specify the zoom factor.\nUse keywords min and/or max to specify the scale limits.The SAOImageDS9.draw method can be called with other kinds of arguments such as instances (or array or tuple) of TwoDimensional.Point to draw point(s) or instances of TwoDimensional.BoundingBox to draw rectangle(s)."
},

{
    "location": "examples/#",
    "page": "Examples",
    "title": "Examples",
    "category": "page",
    "text": ""
},

{
    "location": "examples/#Examples-1",
    "page": "Examples",
    "title": "Examples",
    "category": "section",
    "text": ""
},

{
    "location": "examples/#Basic-examples-1",
    "page": "Examples",
    "title": "Basic examples",
    "category": "section",
    "text": "import SAOImageDS9\nusing SAOImageDS9: TupleOf\nSAOImageDS9.connect()For a 512×861 image img with Float32 pixels, SAOImageDS9.set(img) takes 8.502 ms (28 allocations: 1.30 KiB) while SAOImageDS9.get(Array) takes 5.844 ms (50 allocations: 1.68 MiB).Query parameters of the image displayed in the current DS9 frame:SAOImageDS9.get(Int, \"fits width\")         # get the width of the image\nSAOImageDS9.get(Int, \"fits height\")        # get the height of the image\nSAOImageDS9.get(Int, \"fits depth\")         # get the depth of the image\nSAOImageDS9.get(Int, \"fits bitpix\")        # get the bits per pixel of the image\nSAOImageDS9.get(TupleOf{Int}, \"fits size\") # get the dimensions of the imageThe dimensions are ordered as width, height and depth.To retrieve or set the dimensions of the display window:SAOImageDS9.get(Int, \"width\")    # get the width of the image display window\nSAOImageDS9.get(Int, \"height\")   # get the height of the image display window\nSAOImageDS9.set(\"width\", n)      # set the width of the image display window\nSAOImageDS9.set(\"height\", n)     # set the height of the image display windowDisplay an image and set the scale limits:SAOImageDS9.set(img)\nSAOImageDS9.set(\"scale limits\", 0, maximum(img))"
},

{
    "location": "examples/#Frame-settings-1",
    "page": "Examples",
    "title": "Frame settings",
    "category": "section",
    "text": ""
},

{
    "location": "examples/#Set-frame-settings-1",
    "page": "Examples",
    "title": "Set frame settings",
    "category": "section",
    "text": "SAOImageDS9.set(\"frame center\")       # center current frame\nSAOImageDS9.set(\"frame center\",1)     # center \'Frame1\'\nSAOImageDS9.set(\"frame center all\")   # center all frames\nSAOImageDS9.set(\"frame clear\")        # clear current frame\nSAOImageDS9.set(\"frame new\")          # create new frame\nSAOImageDS9.set(\"frame new rgb\")      # create new rgb frame\nSAOImageDS9.set(\"frame delete\")       # delete current frame\nSAOImageDS9.set(\"frame reset\")        # reset current frame\nSAOImageDS9.set(\"frame refresh\")      # refresh current frame\nSAOImageDS9.set(\"frame hide\")         # hide current frame\nSAOImageDS9.set(\"frame show\",1)       # show frame \'Frame1\'\nSAOImageDS9.set(\"frame move first\")   # move frame to first in order\nSAOImageDS9.set(\"frame move back\")    # move frame back in order\nSAOImageDS9.set(\"frame move forward\") # move frame forward in order\nSAOImageDS9.set(\"frame move last\")    # move frame to last in order\nSAOImageDS9.set(\"frame first\")        # goto first frame\nSAOImageDS9.set(\"frame prev\")         # goto prev frame\nSAOImageDS9.set(\"frame next\")         # goto next frame\nSAOImageDS9.set(\"frame last\")         # goto last frame\nSAOImageDS9.set(\"frame frameno 4\")    # goto frame \'Frame4\',create if needed\nSAOImageDS9.set(\"frame\", 3)           # goto frame \'Frame3\',create if needed\nSAOImageDS9.set(\"frame match wcs\")\nSAOImageDS9.set(\"frame lock wcs\")"
},

{
    "location": "examples/#Get-frame-settings-1",
    "page": "Examples",
    "title": "Get frame settings",
    "category": "section",
    "text": "SAOImageDS9.get(Int, \"frame\")            # returns the id of the current frame\nSAOImageDS9.get(Int, \"frame frameno\")    # returns the id of the current frame\nSAOImageDS9.get(TupleOf{Int}, \"frame all\")    # returns the id of all frames\nSAOImageDS9.get(TupleOf{Int}, \"frame active\") # returns the id of all active frames\nSAOImageDS9.get(String, \"frame lock\")\nSAOImageDS9.get(Bool, \"frame has amplifier\")\nSAOImageDS9.get(Bool, \"frame has datamin\")\nSAOImageDS9.get(Bool, \"frame has datasec\")\nSAOImageDS9.get(Bool, \"frame has detector\")\nSAOImageDS9.get(Bool, \"frame has grid\")\nSAOImageDS9.get(Bool, \"frame has iis\")\nSAOImageDS9.get(Bool, \"frame has irafmin\")\nSAOImageDS9.get(Bool, \"frame has physical\")\nSAOImageDS9.get(Bool, \"frame has smooth\")\nSAOImageDS9.get(Bool, \"frame has contour\")\nSAOImageDS9.get(Bool, \"frame has contour aux\")\nSAOImageDS9.get(Bool, \"frame has fits\")\nSAOImageDS9.get(Bool, \"frame has fits bin\")\nSAOImageDS9.get(Bool, \"frame has fits cube\")\nSAOImageDS9.get(Bool, \"frame has fits mosaic\")\nSAOImageDS9.get(Bool, \"frame has marker highlite\")\nSAOImageDS9.get(Bool, \"frame has marker paste\")\nSAOImageDS9.get(Bool, \"frame has marker select\")\nSAOImageDS9.get(Bool, \"frame has marker undo\")\nSAOImageDS9.get(Bool, \"frame has system physical\")\nSAOImageDS9.get(Bool, \"frame has wcs wcsa\")\nSAOImageDS9.get(Bool, \"frame has wcs equatorial wcsa\")\nSAOImageDS9.get(Bool, \"frame has wcs linear wcsa\")"
},

{
    "location": "examples/#Other-examples-1",
    "page": "Examples",
    "title": "Other examples",
    "category": "section",
    "text": "Get about string:SAOImageDS9.get(String, \"about\")Get version number:SAOImageDS9.get(VersionNumber, \"version\")Exit SAOImage/DS9:SAOImageDS9.set(\"exit\")Is SAOImage/DS9 iconified?SAOImageDS9.get(Bool, \"iconify\")(De)iconify SAOImage/DS9:SAOImageDS9.set(\"iconify\", bool)SAOImageDS9.set(\"lower\")\nSAOImageDS9.set(\"raise\") # can be used to de-iconifyGet/set zoom level:SAOImageDS9.get(Float64, \"zoom\")  # get current zoom level\nSAOImageDS9.set(\"zoom\", value)\nSAOImageDS9.set(\"zoom to\", value)\nSAOImageDS9.set(\"zoom to fit\")Rotation:SAOImageDS9.get(Float64, \"rotate\")\nSAOImageDS9.set(\"rotate\", value)\nSAOImageDS9.set(\"rotate to\", value)\nSAOImageDS9.set(\"rotate open\")\nSAOImageDS9.set(\"rotate close\")SAOImageDS9.get(String, \"orient\")\nSAOImageDS9.set(\"orient\", value)#iexam(;event::Union{AbstractString,Symbol}=:button) = get_words(\"iexam\", event)\n\niexam(args...; event::Union{AbstractString,Symbol}=:button) =\n    get_words(\"iexam\", event, args...)\n\nSAOImageDS9.get(Int, :threads)  # get threads\nSAOImageDS9.set(\"threads\", n)"
},

{
    "location": "library/#",
    "page": "Package library",
    "title": "Package library",
    "category": "page",
    "text": ""
},

{
    "location": "library/#Package-library-1",
    "page": "Package library",
    "title": "Package library",
    "category": "section",
    "text": ""
},

{
    "location": "library/#SAOImageDS9.get",
    "page": "Package library",
    "title": "SAOImageDS9.get",
    "category": "function",
    "text": "SAOImageDS9.get([T, [dims,]] args...)\n\nsends a \"get\" request to the SAOImage/DS9 server.  The request is made of arguments args... converted into strings and merged with separating spaces. An exception is thrown in case of error.\n\nThe returned value depends on the optional arguments T and dims:\n\nIf neither T nor dims are specified, an instance of XPA.Reply is returned with at most one answer (see documentation for XPA.get for more details).\nIf only T is specified, it can be:\nString to return the answer as a single string;\nVector{String}} or Tuple{Vararg{String}} to return the answer split in words as a vector or as a tuple of strings;\nT where T<:Real to return a value of type T obtained by parsing the textual answer.\nTuple{Vararg{T}} where T<:Real to return a value of type T obtained by parsing the textual answer;\nVector{T} where T is not String to return the binary contents of the answer as a vector of type T;\nIf both T and dims are specified, T can be an array type like Array{S} or Array{S,N} and dims a list of N dimensions to retrieve the binary contents of the answer as an array of type Array{S,N}.\n\nAs a special case:\n\nSAOImageDS9.get(Array; endian=:native) -> arr\n\nyields the contents of current SAOImage/DS9 frame as an array (or as nothing if the frame is empty). Keyword endian can be used to specify the byte order of the received values (see SAOImageDS9.byte_order).\n\nTo retrieve the version of the SAOImage/DS9 program:\n\nSAOImageDS9.get(VersionNumber)\n\nSee also SAOImageDS9.connect, SAOImageDS9.set and XPA.get.\n\n\n\n\n\n"
},

{
    "location": "library/#SAOImageDS9.set",
    "page": "Package library",
    "title": "SAOImageDS9.set",
    "category": "function",
    "text": "SAOImageDS9.set(args...; data=nothing)\n\nsends command and/or data to the SAOImage/DS9 server.  The command is made of arguments args... converted into strings and merged with a separating spaces. Keyword data can be used to specify the data to send.  An exception is thrown in case of error.\n\nAs a special case:\n\nSAOImageDS9.set(arr; mask=false, new=false, endian=:native)\n\nset the contents of the current SAOImage/DS9 frame to be array arr.  Keyword new can be set true to create a new frame for displyaing the array.  Keyword endian can be used to specify the byte order of the values in arr (see SAOImageDS9.byte_order.\n\nSee also SAOImageDS9.connect, SAOImageDS9.get and XPA.set.\n\n\n\n\n\n"
},

{
    "location": "library/#Requests-to-SAOImage/DS9-1",
    "page": "Package library",
    "title": "Requests to SAOImage/DS9",
    "category": "section",
    "text": "SAOImageDS9.get\nSAOImageDS9.set"
},

{
    "location": "library/#SAOImageDS9.connect",
    "page": "Package library",
    "title": "SAOImageDS9.connect",
    "category": "function",
    "text": "SAOImageDS9.connect(ident=\"DS9:*\") -> apt\n\nset the access point for further SAOImage/DS9 commands.  Argument ident identifies the XPA access point, it can be a template string like \"DS9:*\" which is the default value or a regular expression.  The returned value is the name of the access point.\n\nTo retrieve the name of the current SAOImage/DS9 access point, call the SAOImageDS9.accesspoint method.\n\n\n\n\n\n"
},

{
    "location": "library/#SAOImageDS9.accesspoint",
    "page": "Package library",
    "title": "SAOImageDS9.accesspoint",
    "category": "function",
    "text": "SAOImageDS9.accesspoint()\n\nyields the XPA access point which identifies the SAOImage/DS9 server.  This access point can be set by calling the SAOImageDS9.connect method. An empty string is returned if no access point has been chosen.  To automatically connect to SAOImage/DS9 if not yet done, you can do:\n\nif SAOImageDS9.accesspoint() == \"\"; SAOImageDS9.connect(); end\n\nSee also SAOImageDS9.connect and SAOImageDS9.accesspoint.\n\n\n\n\n\n"
},

{
    "location": "library/#Connection-1",
    "page": "Package library",
    "title": "Connection",
    "category": "section",
    "text": "SAOImageDS9.connect\nSAOImageDS9.accesspoint"
},

{
    "location": "library/#SAOImageDS9.draw",
    "page": "Package library",
    "title": "SAOImageDS9.draw",
    "category": "function",
    "text": "SAOImageDS9.draw(args...; kwds...)\n\ndraws something in SAOImage/DS9 application.  The operation depends on the type of the arguments.\n\n\n\nSAOImageDS9.draw(img; kwds...)\n\ndisplays image img (a 2-dimensional Julia array) in SAOImage/DS9. The following keywords are possible:\n\nKeyword frame can be used to specify the frame number.\nKeyword cmap can be used to specify the name of the colormap.  For instance, cmap=\"gist_stern\".\nKeyword zoom can be used to specify the zoom factor.\nKeywords min and/or max can be used to specify the scale limits.\n\n\n\nSAOImageDS9.draw(pnt; kwds...)\n\ndraws pnt as point(s) in SAOImage/DS9, pnt is a Point, an array or a tuple of Point.\n\n\n\nSAOImageDS9.draw(box; kwds...)\n\ndraws box as rectangle(s) in SAOImage/DS9, box is a BoundingBox, an array or a tuple of BoundingBox.\n\n\n\n\n\n"
},

{
    "location": "library/#Drawing-1",
    "page": "Package library",
    "title": "Drawing",
    "category": "section",
    "text": "SAOImageDS9.draw"
},

{
    "location": "library/#SAOImageDS9.bitpix_of",
    "page": "Package library",
    "title": "SAOImageDS9.bitpix_of",
    "category": "function",
    "text": "SAOImageDS9.bitpix_of(x) -> bp\n\nyields FITS bits-per-pixel (BITPIX) value for x which can be an array or a type.  A value of 0 is returned if x is not of a supported type.\n\nSee also SAOImageDS9.bitpix_to_type.\n\n\n\n\n\n"
},

{
    "location": "library/#SAOImageDS9.bitpix_to_type",
    "page": "Package library",
    "title": "SAOImageDS9.bitpix_to_type",
    "category": "function",
    "text": "SAOImageDS9.bitpix_to_type(bp) -> T\n\nyields Julia type corresponding to FITS bits-per-pixel (BITPIX) value bp. The value Nothing is returned if bp is unknown.\n\nSee also SAOImageDS9.bitpix_of.\n\n\n\n\n\n"
},

{
    "location": "library/#SAOImageDS9.byte_order",
    "page": "Package library",
    "title": "SAOImageDS9.byte_order",
    "category": "function",
    "text": "SAOImageDS9.byte_order(endian)\n\nyields the byte order for retrieving the elements of a SAOImage/DS9 array. Argument can be one of the strings (or the equivalent symbol): \"big\" for most significant byte first, \"little\" for least significant byte first or \"native\" to yield the byte order of the machine.\n\nSee also SAOImageDS9.get, SAOImageDS9.set.\n\n\n\n\n\n"
},

{
    "location": "library/#Utilities-1",
    "page": "Package library",
    "title": "Utilities",
    "category": "section",
    "text": "SAOImageDS9.bitpix_of\nSAOImageDS9.bitpix_to_type\nSAOImageDS9.byte_order"
},

]}
