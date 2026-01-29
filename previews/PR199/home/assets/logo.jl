### A Pluto.jl notebook ###
# v0.20.20

#> [frontmatter]
#> image = "https://global.discourse-cdn.com/julialang/original/3X/d/c/dc1e0ef55d4c62739488e86a185581b095033008.svg"
#> title = "JuliaAstro Logo"
#> date = "2025-10-01"
#> tags = ["logo", "luxor"]
#> description = "The script used to produce the JuliaAstro logo."

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ 80655354-885c-11f0-2b27-55496dd7d5c8
using Luxor, PlutoUI

# ╔═╡ 4ac77954-ab89-46f8-b1cf-bc84897223f0
md"""
# JuliaAstro Logo ✨

This basic design document shows how to construct the [JuliaAstro](https://github.com/JuliaAstro) logo with [Luxor.jl](https://github.com/JuliaGraphics/Luxor.jl)

Community poll results: <https://discourse.julialang.org/t/juliaastro-logo/132635>
"""

# ╔═╡ 37f867f4-657c-40a6-be2a-4edf4f2d6078
md"""
## Concept

The standard Julia logo, but with the circle shapes replaced by star shapes.
"""

# ╔═╡ 3a69b14f-903f-4966-81fd-db9b8a3f0b2b
const WIDTH, HEIGHT = 250, 250

# ╔═╡ 55a36f1b-e6e1-4ff8-96b7-838776f51ad1
md"""
## Framework

Assuming a square grid ($(WIDTH) x $(HEIGHT) pixels by default), we place a star shape with circumradius ``R_\text{star}`` at each vertex of an equilateral triangle with circumradius ``R_\text{tri}`` oriented with one base parallel to the bottom side of the page. The center of the equilateral triangle is placed at the coordinate ``(0, y_\text{offset})`` to keep the horizontal and vertical whitespace balanced. To the right and down is defined as positive. The vertical coordinate offset ``y_\text{offset}`` is found by splitting the distance between the top and bottom extent of the image in half. We take the top and bottom ``y`` coordinate of the top and bottom circumcircles as the top and bottom extent, respectively:

```math
\begin{align}
y_\text{offset} &= \frac{
	\text{extent}_\text{top} - \text{extent}_\text{bottom}
}{2} \\
&= \frac{
	(R_\text{tri} + R_\text{star}) - (R_\text{tri}\sin\frac{\pi}{6} + R_\text{star})
}{2} \\
&= R_\text{tri} / 4 \quad.
\end{align}
```


!!! note
	Alternatively, we could have used the bottom coordinate of one of the bottom stars as our bottom extent to give:

	```math
	y_\text{offset} = \left[
		\frac{R_\text{tri}}{2} +
			R_\text{star}\left(1 - \cos\frac{\pi}{5}\right)
	\middle] \right/ 2 \quad.
	```

	Although this makes the whitespace between the top and bottom stars equal, we found that it tended to give a slightly bottom-heavy appearance. For this reason, we opted for the simpler offset equation using their circumscribed circles above to try to achieve a better perceptual balance.

Finally, we set the stars' circumdiameter equal to the side length of the underlying equilateral triangle so that all three circumcircles are mutually tangent.


```math
R_\text{star} = R_{\text{tri}_{x}}
	= R_\text{tri}\cos\frac{\pi}{6}
	= \frac{\sqrt 3}{2} R_\text{tri} \quad.
```

This defines the space between our stars.
"""

# ╔═╡ 164e437c-a5db-4345-abe2-b8c0cbed71ad
const R_TRI = min(WIDTH, HEIGHT) / (2 + √(3))

# ╔═╡ 78b7497b-0a74-4c86-a242-c4b6669ab035
const Y_OFFSET = R_TRI / 4 #(0.5*R_tri + R_star*(1.0 - cos(π/5))) / 2

# ╔═╡ d67ac8bb-492b-4f9b-ba48-54f5d7ac6af8
R_STAR = R_TRI * √(3) / 2

# ╔═╡ 002b4f56-f14e-4327-9cbe-baec36f1b90b
const CENTER = Point(0, Y_OFFSET)

# ╔═╡ 87232574-4ed9-4acb-93c0-a25723516b5c
const VERTICES = ngon(CENTER, R_TRI, 3, π/6; vertices = true)

# ╔═╡ 3bb31c16-5372-4b29-a3e8-3a70886f1940
begin
reset
md"""
## Design

With the underlying framework established, we use the following colors in our logo:
"""
end

# ╔═╡ cbc16232-8c2c-455d-afa7-45253c3e2014
const COLORS_LOGO = (
	RED = Luxor.julia_red,
	GREEN = Luxor.julia_green,
	PURPLE = Luxor.julia_purple,
)

# ╔═╡ 7ac1f958-6df5-48fe-b4ea-2a31bbd31069
md"""
and display it on top of the following background colors to viusally examine its contrast:
"""

# ╔═╡ 02b660dc-c3e8-4dd1-98cb-547e39d49a78
const COLORS_BG = (
	transparent = "transparent",
	white = "white",
	grey  = "#f5f5f5", # Documenter sidebar grey
	black = "black",
)

# ╔═╡ 5b5baa4f-c974-45e9-aef6-6ad817a18e1f
md"""
We next show the construction for the following logo candidates considered:

* [4-point star](#5-point-star) ([community poll winner](https://discourse.julialang.org/t/juliaastro-logo/132635))
* [5-point star](#5-point-star)
* [6-point star](#6-point star)
"""

# ╔═╡ aa7b4ef1-7bc5-486a-92e2-326b37d4b08f
md"""
 $(@bind four_point_star_reset Button("Reset")) | Overlay: $(@bind four_point_star_overlay CheckBox(; default = true)) 
"""

# ╔═╡ 982175b8-8e4c-46e4-979b-0d141679f1d8
begin
four_point_star_reset
	
md"""
### 4-point star

n1 | n2 | n3
:-: | :-: | :-:
$(@bind four_point_star_n1 Slider(0:0.01:2; default = 0.5, show_value = true)) | $(@bind four_point_star_n2 Slider(0:0.01:2; default = 0.5, show_value = true)) | $(@bind four_point_star_n3 Slider(0:0.01:2; default = 0.5, show_value = true))

a | b | smooth
:-: | :-: | :-:
$(@bind four_point_star_a Slider(0:0.01:2; default = 1.0, show_value = true)) | $(@bind four_point_star_b Slider(0:0.01:2; default = 1.0, show_value = true)) | $(@bind four_point_star_smooth Select([1, 2]))

r1 | r2 | r3
:-: | :-: | :-:
$(@bind four_point_star_r1 Slider(10:150; default = 40, show_value = true)) | $(@bind four_point_star_r2 Slider(10:150; default = 70, show_value = true)) | $(@bind four_point_star_r3 Slider(10:150; default = 55, show_value = true))
"""
end

# ╔═╡ fe55b59b-1920-4e93-8809-a39fd75193f5
md"""
---
"""

# ╔═╡ 59ddcb43-1973-472a-af40-26dbb734740a
md"""
 $(@bind five_point_star_reset Button("Reset")) | Overlay: $(@bind five_point_star_overlay CheckBox(; default = true))
"""

# ╔═╡ 834c539e-a6d4-433e-8693-3e154f18733f
begin
five_point_star_reset
md"""
### 5-point star

ratio | smooth | tilt
:-: | :-: | :-:
`ratio` kwarg passed to `Luxor.star` | corner radius passed to `Luxor.polysmooth`
$(@bind r_s Slider(0.35:0.05:1.0; default = 0.45, show_value = true)) | $(@bind five_point_star_smooth Slider(1:5; default = 2, show_value = true)) | $(@bind five_point_star_tilt CheckBox(; default = false))
"""
end

# ╔═╡ 87bc1853-7e64-4884-a1ae-e55bae8aece8
md"""
---
"""

# ╔═╡ e9f3a401-5fd1-4357-b4e1-3f3f92137954
md"""
 $(@bind six_point_star_reset Button("Reset")) | Overlay: $(@bind six_point_star_overlay CheckBox(; default = true))
"""

# ╔═╡ 5ffda01b-2bac-42fc-86ec-eb16032ac72b
begin
six_point_star_reset
	
md"""
### 6-point star

n1 | n2 | n3
:-: | :-: | :-:
$(@bind six_point_star_n1 Slider(0:0.01:2; default = 0.7, show_value = true)) | $(@bind six_point_star_n2 Slider(0:0.01:2; default = 0.7, show_value = true)) | $(@bind six_point_star_n3 Slider(0:0.01:2; default = 0.7, show_value = true))

a | b | smooth
:-: | :-: | :-:
$(@bind six_point_star_a Slider(0:0.01:2; default = 1.0, show_value = true)) | $(@bind six_point_star_b Slider(0:0.01:2; default = 1.0, show_value = true)) | $(@bind six_point_star_smooth Select([1, 2]))

r1 | r2 | r3
:-: | :-: | :-:
$(@bind six_point_star_r1 Slider(10:150; default = 40, show_value = true)) | $(@bind six_point_star_r2 Slider(10:150; default = 64, show_value = true)) | $(@bind six_point_star_r3 Slider(10:150; default = 50, show_value = true))
"""
end

# ╔═╡ fe659653-46ac-41dd-84c6-3641155955fa
md"""
## Notebook setup
"""

# ╔═╡ f5beb5ed-732b-4ae1-8d53-cabc85d54506
# Overlay framework guidelines for visual checks
function overlay!()
	setline(1)
	setcolor("black")
	ngon(CENTER, R_TRI, 3, π/6; action = :stroke)
	circle.(VERTICES, R_STAR; action = :stroke)
	rect(-WIDTH/2, -HEIGHT/2, WIDTH, HEIGHT; action = :stroke)
end

# ╔═╡ 2d59cbf1-6b8d-43fc-8887-1d739875f320
let
	Drawing(WIDTH, HEIGHT, :png)
	origin()
	setline(0)
	background(COLORS_BG.transparent)

	params = (
		n1 = four_point_star_n1,
		n2 = four_point_star_n2,
		n3 = four_point_star_n3,
		a = four_point_star_a,
		b = four_point_star_b,
		m = 4,
	)
	radii  = (four_point_star_r1, four_point_star_r2, four_point_star_r3)
		
	for (i, (center, color, r)) in enumerate(zip(VERTICES, COLORS_LOGO, radii))
		setcolor(color)
		
		star_i = polysuper(center;
			params...,
			radius = r,
			vertices = true,
			# stepby = π / 1200,
		)
	
		# poly(star_i; action = :fill)
		polysmooth(star_i, four_point_star_smooth; action = :fill)
	end

	four_point_star_overlay && overlay!()
	
	finish()
	@show params radii
	println("smooth level: ", four_point_star_smooth)
	preview()
end

# ╔═╡ 7fd6c788-44ef-4fc5-b9b9-a0a4ac699d55
let
	Drawing(WIDTH, HEIGHT, :svg)
	origin()
	setline(2)
	background(COLORS_BG.transparent)

	params = (radius=R_STAR, npoints=5, ratio=r_s, orientation=-π/2) 
		
	for (i, (center, color)) in enumerate(zip(VERTICES, COLORS_LOGO))
		setcolor(color)
		star_i = star(center, params...; vertices = true)
		if five_point_star_tilt
			i == 1 && polyrotate!(star_i, -π/2 - π/6; center)
			i == 3 && polyrotate!(star_i, π/2 + π/6; center)
		end
		polysmooth(star_i, five_point_star_smooth; action = :fill)
	end

	five_point_star_overlay && overlay!()

	finish()
	@show params
	println("smooth level: ", five_point_star_smooth)
	println("tilt: ", five_point_star_tilt)
	preview()
end

# ╔═╡ 73582ea1-d6d8-40bb-977e-567a6c13b090
let
	Drawing(WIDTH, HEIGHT, :svg)
	origin()
	setline(0)
	background(COLORS_BG.transparent)

	params = (
		n1 = six_point_star_n1,
		n2 = six_point_star_n2,
		n3 = six_point_star_n3,
		a = six_point_star_a,
		b = six_point_star_b,
		m = 6,
	)
	radii = (six_point_star_r1, six_point_star_r2, six_point_star_r3)
		
	for (i, (center, color, r)) in enumerate(zip(VERTICES, COLORS_LOGO, radii))
		setcolor(color)
		
		star_i = polysuper(center;
			params...,
			radius = r,
			vertices = true,
			# stepby = π / 1200,
		)

		polyrotate!(star_i, π/6; center)
		polysmooth(star_i, six_point_star_smooth; action = :fill)
	end
	
	six_point_star_overlay && overlay!()
	
	finish()
	@show params
	println("radii: ", radii)
	println("smooth level: ", six_point_star_smooth)
	preview()
end

# ╔═╡ 1c776d20-83c3-4cd5-9219-f583eb9be11f
TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Luxor = "ae8d54c2-7ccd-5906-9d76-62fc9837b5bc"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Luxor = "~4.3.0"
PlutoUI = "~0.7.71"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.1"
manifest_format = "2.0"
project_hash = "2938c926774da4376c433e8c29818c17f14f3349"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1b96ea4a01afe0ea4090c5c8039690672dd13f2e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.9+0"

[[deps.Cairo]]
deps = ["Cairo_jll", "Colors", "Glib_jll", "Graphics", "Libdl", "Pango_jll"]
git-tree-sha1 = "71aa551c5c33f1a4415867fe06b7844faadb0ae9"
uuid = "159f3aea-2a34-519c-b102-8c37f9878175"
version = "1.1.1"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fde3bf89aead2e723284a8ff9cdf5b551ed700e8"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.5+0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "37ea44092930b1811e666c3bc38065d7d87fcc74"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.13.1"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "0037835448781bb46feb39866934e243886d756a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.18.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "4e1fe97fdaed23e9dc21d4d664bea76b65fc50a0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.22"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7bb1361afdb33c7f2b085aa49ea8fe1b0fb14e58"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.7.1+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "83dc665d0312b41367b7263e8a4d172eac1897f4"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.4"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "3a948313e7a41eb1db7a1e733e6335f17b4ab3c4"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "7.1.1+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "b66970a70db13f45b7e57fbda1736e1cf72174ea"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.17.0"

    [deps.FileIO.extensions]
    HTTPExt = "HTTP"

    [deps.FileIO.weakdeps]
    HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
git-tree-sha1 = "f85dac9a96a01087df6e3a749840015a0ca3817d"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.17.1+0"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "2c5512e11c791d1baed2049c5652441b28fc6a31"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7a214fdac5ed5f59a22c2d9a885a16da1c74bbc7"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.17+0"

[[deps.GettextRuntime_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll"]
git-tree-sha1 = "45288942190db7c5f760f59c04495064eedf9340"
uuid = "b0724c58-0f36-5564-988d-3bb0596ebc4a"
version = "0.22.4+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "GettextRuntime_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "35fbd0cefb04a516104b8e183ce0df11b70a3f1a"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.84.3+0"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "a641238db938fff9b2f60d08ed9030387daf428c"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.3"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a6dbda1fd736d60cc477d99f2e7a042acfa46e8"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.15+0"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "f923f9a774fcf3f5cb761bfa43aeadd689714813"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.5.1+0"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "0533e564aae234aff59ab625543145446d8b6ec2"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.7.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e95866623950267c1e4878846f848d94810de475"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.1.2+0"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "059aabebaa7c82ccb853dd4a0ee9d17796f7e1bc"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.3+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "aaafe88dccbd957a8d82f7d05be9b69172e0cee3"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "4.0.1+0"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "eb62a3deb62fc6d8822c0c4bef73e4412419c5d8"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "18.1.8+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c602b1127f4751facb671441ca72715cc95938a"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.3+0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.11.1+1"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c8da7e6a91781c41a863611c7e966098d783c57a"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.4.7+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "be484f5c92fad0bd8acfef35fe017900b0b73809"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.18.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "706dfd3c0dd56ca090e86884db6eda70fa7dd4af"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.41.1+0"

[[deps.Librsvg_jll]]
deps = ["Artifacts", "Cairo_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "Libdl", "Pango_jll", "XML2_jll", "gdk_pixbuf_jll"]
git-tree-sha1 = "e6ab5dda9916d7041356371c53cdc00b39841c31"
uuid = "925c91fb-5dd6-59dd-8e8c-345e74382d89"
version = "2.54.7+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "4ab7581296671007fc33f07a721631b8855f4b1d"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.7.1+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "d3c8af829abaeba27181db4acb485b18d15d89c6"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.41.1+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.Luxor]]
deps = ["Base64", "Cairo", "Colors", "DataStructures", "Dates", "FFMPEG", "FileIO", "PolygonAlgorithms", "PrecompileTools", "Random", "Rsvg"]
git-tree-sha1 = "54bdbc3b05b3a4cf25ec4c00054038758c1c090b"
uuid = "ae8d54c2-7ccd-5906-9d76-62fc9837b5bc"
version = "4.3.0"

    [deps.Luxor.extensions]
    LuxorExtLatex = ["LaTeXStrings", "MathTeXEngine"]
    LuxorExtTypstry = ["Typstry"]

    [deps.Luxor.weakdeps]
    LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
    MathTeXEngine = "0a4f8689-d25c-4efe-a92b-7142dfc1aa53"
    Typstry = "f0ed7684-a786-439e-b1e3-3b82803b501e"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.5.20"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "9b8215b1ee9e78a293f99797cd31375471b2bcae"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.1.3"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b6aa4566bb7ae78498a5e68943863fa8b5231b59"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.6+0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.7+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.1+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c392fc5dd032381919e3b22dd32d6443760ce7ea"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.5.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.44.0+1"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "275a9a6d85dc86c24d03d1837a0010226a96f540"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.56.3+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "db76b1ecd5e9715f3d043cec13b2ec93ce015d53"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.44.2+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "8329a3a4f75e178c11c1ce2342778bcbbbfa7e3c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.71"

[[deps.PolygonAlgorithms]]
git-tree-sha1 = "384967bb9b0dda05f9621e57c780dae5ca0c8574"
uuid = "32a0d02f-32d9-4438-b5ed-3a2932b48f96"
version = "0.3.2"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "0f27480397253da18fe2c12a4ba4eb9eb208bf3d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.Rsvg]]
deps = ["Cairo", "Glib_jll", "Librsvg_jll"]
git-tree-sha1 = "e53dad0507631c0b8d5d946d93458cbabd0f05d7"
uuid = "c4c386cf-5103-5370-be45-f3a111cca3b8"
version = "1.1.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "372b90fe551c019541fafc6ff034199dc19c8436"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.12"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "b8b243e47228b4a3877f1dd6aee0c5d56db7fcf4"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.13.6+1"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fee71455b0aaa3440dfdd54a9a36ccef829be7d4"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.8.1+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "b5899b25d17bf1889d25906fb9deed5da0c15b3b"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.12+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "aa1261ebbac3ccc8d16558ae6799524c450ed16b"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.13+0"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "52858d64353db33a56e13c341d7bf44cd0d7b309"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.6+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "a4c0ee07ad36bf8bbce1c3bb52d21fb1e0b987fb"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.7+0"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "7ed9347888fac59a618302ee38216dd0379c480d"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.12+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXau_jll", "Xorg_libXdmcp_jll"]
git-tree-sha1 = "bfcaf7ec088eaba362093393fe11aa141fa15422"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.1+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "a63799ff68005991f9d9491b6e95bd3478d783cb"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.6.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "446b23e73536f84e8037f5dce465e92275f6a308"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.7+1"

[[deps.gdk_pixbuf_jll]]
deps = ["Artifacts", "Glib_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Xorg_libX11_jll", "libpng_jll"]
git-tree-sha1 = "895f21b699121d1a57ecac57e65a852caf569254"
uuid = "da03df04-f53b-5353-a52f-6a8b0620ced0"
version = "2.42.13+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "4bba74fa59ab0755167ad24f98800fe5d727175b"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.12.1+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "125eedcb0a4a0bba65b657251ce1d27c8714e9d6"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.17.4+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "646634dd19587a56ee2f1199563ec056c5f228df"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.4+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "07b6a107d926093898e82b3b1db657ebe33134ec"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.50+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll"]
git-tree-sha1 = "11e1772e7f3cc987e9d3de991dd4f6b2602663a5"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.8+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.5.0+2"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "14cc7083fc6dff3cc44f2bc435ee96d06ed79aa7"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "10164.0.1+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e7b67590c14d487e734dcb925924c5dc43ec85f3"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "4.1.0+0"
"""

# ╔═╡ Cell order:
# ╟─4ac77954-ab89-46f8-b1cf-bc84897223f0
# ╟─37f867f4-657c-40a6-be2a-4edf4f2d6078
# ╟─55a36f1b-e6e1-4ff8-96b7-838776f51ad1
# ╠═164e437c-a5db-4345-abe2-b8c0cbed71ad
# ╠═78b7497b-0a74-4c86-a242-c4b6669ab035
# ╠═3a69b14f-903f-4966-81fd-db9b8a3f0b2b
# ╠═d67ac8bb-492b-4f9b-ba48-54f5d7ac6af8
# ╠═002b4f56-f14e-4327-9cbe-baec36f1b90b
# ╠═87232574-4ed9-4acb-93c0-a25723516b5c
# ╟─3bb31c16-5372-4b29-a3e8-3a70886f1940
# ╠═cbc16232-8c2c-455d-afa7-45253c3e2014
# ╟─7ac1f958-6df5-48fe-b4ea-2a31bbd31069
# ╠═02b660dc-c3e8-4dd1-98cb-547e39d49a78
# ╟─5b5baa4f-c974-45e9-aef6-6ad817a18e1f
# ╟─982175b8-8e4c-46e4-979b-0d141679f1d8
# ╟─aa7b4ef1-7bc5-486a-92e2-326b37d4b08f
# ╟─2d59cbf1-6b8d-43fc-8887-1d739875f320
# ╟─fe55b59b-1920-4e93-8809-a39fd75193f5
# ╟─834c539e-a6d4-433e-8693-3e154f18733f
# ╟─59ddcb43-1973-472a-af40-26dbb734740a
# ╟─7fd6c788-44ef-4fc5-b9b9-a0a4ac699d55
# ╟─87bc1853-7e64-4884-a1ae-e55bae8aece8
# ╟─5ffda01b-2bac-42fc-86ec-eb16032ac72b
# ╟─e9f3a401-5fd1-4357-b4e1-3f3f92137954
# ╟─73582ea1-d6d8-40bb-977e-567a6c13b090
# ╟─fe659653-46ac-41dd-84c6-3641155955fa
# ╟─f5beb5ed-732b-4ae1-8d53-cabc85d54506
# ╠═1c776d20-83c3-4cd5-9219-f583eb9be11f
# ╠═80655354-885c-11f0-2b27-55496dd7d5c8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
