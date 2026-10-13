# JuliaAstro Roadmap

**Last revised: October 2026**

* [Introduction](#Introduction)
* [Status Legend](#Status-Legend)
* [Functionality](#Functionality)
* [Infrastructure, Documentation](#Infrastructure-Documentation)
* [Interoperability and compatibility](#Interoperability-and-Compatibility)
* [Hardware and Performance](#Hardware-and-Performance)
* [Learn and User Support](#Learn-and-User-Support)
* [Community Building and Sustainability](#Community-Building-and-Sustainability)
* [Governance, Management, and Personnel](#Governance-Management-and-Personnel)
* [Fundraising](#Fundraising)

## Introduction

This Roadmap captures high level actionable items that we as an organization aim to undertake to improve the health and stability of JuliaAstro, and to help prioritize the allocation of JuliaAstro resources. The Roadmap itself is largely a static document, however it will be revisited regularly at JuliaAstro community meetings or via pull requests, to keep track of progress and write new versions as needed. The structure of The Roadmap is inspired by [The Astropy Project's Roadmap](https://github.com/astropy/astropy-project/blob/main/roadmap/roadmap.md).

## Status Legend

### Green 🟢

- Group or person leading effort is identified and sufficiently supported.
- Effort is already underway and/or expected to be implemented in the “near term.”

### Orange 🔶

- Item is already defined (e.g., issue or draft PR exists), but not sufficiently underway.
- Attempts to secure the necessary resources are underway.
  - *For example, funding applied for, but not awarded.*

### Red 🟥

- Consensus of the community is that the item is a priority.
- Attempts to secure the necessary resources have not yet been started.
  - *For example, there’s no one available to write a funding proposal or lead recruitment efforts.*

## Functionality

The core product of JuliaAstro is high quality astronomical software, including both the core library and coordinated packages in the wider Julia ecosystem. This category encompasses goals having to do with this core JuliaAstro functionality.

🔶 Determine a plan for long-term support of our pure Julia implementations of the [FITS](https://github.com/JuliaAstro/FITSFiles.jl) and [ASDF](https://github.com/JuliaAstro/ASDF.jl) file formats, while also improving performance and making contributions easier.

🔶 Provide next-generation radio analysis tools (e.g., [AURIS.jl](https://github.com/JuliaAstro/AURIS.jl), [XRadio.jl (Implementation of MSv4 standard, currently private)](https://github.com/JuliaAstro/XRadio.jl), [MeasurementSets.jl](https://github.com/JuliaAstro/MeasurementSets.jl)) usable by individual researchers and larger surveys with [EHTJulia coordinated packages](https://github.com/EHTJulia) and formation of a Radio Astronomy Group (RAG).

🔶 Unify various pulsar/FRB analysis packages under a common interface (<https://github.com/JuliaAstro/fireplace/issues/7>).

🔶 Develop next-generation X-ray analysis tools (e.g., [XraySpectra.jl](https://github.com/JuliaAstro/XraySpectra.jl), [Radix.jl](https://github.com/JuliaAstro/Radix.jl)).

🔶 Provide next-generation spectroscopic analysis tools usable by individual researchers and larger surveys (e.g., [SpectrumBase.jl](https://github.com/JuliaAstro/SpectrumBase.jl), [SpectralFitting.jl](https://github.com/JuliaAstro/SpectralFitting.jl)).

🟥 Build out DS9 support with SAMP (e.g., [VirtualObservatorySAMP.jl](https://github.com/astrozot/VirtualObservatorySAMP.jl)) and XPA (e.g., [SAOImageDS9.jl](https://github.com/JuliaAstro/SAOImageDS9.jl), [XPA.jl](https://github.com/JuliaAstro/XPA.jl)) functionality.

🟥 Develop a package containing radiative process models, such as blackbody, bremsstrahlung, gyrosynchrotron, synchrotron, line and collisional emission, and ionization rates. Such a package would provide a set of validated and optimized models for use in data analysis, similar to [SpecialFunctions.jl](https://github.com/JuliaMath/SpecialFunctions.jl/).

🟥 Develop an astroquery-like package within the JuliaAstro ecosystem. Currently, tabular data support exists in [VirtualObservatory.jl](https://github.com/JuliaAPlavin/VirtualObservatory.jl), but further raw data product support is still needed.

## Infrastructure, Documentation

Underlying all JuliaAstro packages is critical infrastructure that ensures high quality, well-documented software is released. This category encompasses goals having to do with such infrastructure and documentation.

🟢 Improve integration of core package and coordinated package documentation from a user perspective (e.g., joint search functionality with [MultiDocumenter.jl](https://github.com/JuliaComputing/MultiDocumenter.jl)).

🟥 Develop and improve robust performance benchmark reporting using modern frameworks (e.g., [AirspeedVelocity.jl](https://github.com/MilesCranmer/AirspeedVelocity.jl)).

## Interoperability and Compatibility

One of the core principles of JuliaAstro is to "foster an ecosystem of interoperable astronomy packages." This category encompasses goals related to that principle of interoperability and compatibility.

🟢 Encourage usage of the core and coordinated package ecosystem.

🔶 Leverage language interoperability with Python packages via [PythonCall.jl/juliacall](https://github.com/JuliaPy/PythonCall.jl).

## Hardware and Performance

Astronomers perform their work in a variety of computing environments with a variety of requirements. This category encompasses goals related to supporting the performance and hardware needs of JuliaAstro users, as well as anticipating future needs and requirements.

🟢 Improve and/or maintain interoperability with performant I/O file formats and libraries such as HDF5, Zarr, and Arrow/Parquet.

🔶 Improve support for using JuliaAstro tools in heterogeneous computing environments such as cloud environments or GPU systems (e.g., [CoherentSearch.jl](https://github.com/scottransom/CoherentSearch.jl)).

🟥 Add basic WebAssembly support. Relevant community discussion [can be found here](https://discourse.julialang.org/t/julia-and-wasm/108482).

## Learn and User Support

JuliaAstro cannot succeed in its core objectives without a robust user onboarding and support system. This category is for items related to our ecosystem and other user support related improvements.

🟢 Update JuliaAstro website to reflect the organization as a whole, not just the core packages.

🔶 Generate and ingest guides and/or a series of tutorials that demonstrate JuliaAstro functionality in the context of astronomical research (<https://learn.juliaastro.org/>).

🔶 Expand and build on workshop offerings, including online and increased geographic coverage (<https://github.com/JuliaAstro/workshop>).

🟥 Develop, host, and index tutorials suitable for use in university astronomy courses.

## Community Building and Sustainability

As a community-driven project, the long term health and development of the JuliaAstro community is an intrinsic part of our organization. This category encompasses goals related to growing and maintaining that community, and ensuring that it adheres to the core principles of inclusion and consensus-building.

🔶 Better understand JuliaAstro user community through user and developer surveys (e.g., JuliaAstro User Survey on functionality and Community views on diversity, equity, and inclusion in JuliaAstro) (<https://github.com/JuliaAstro/fireplace/issues/2>).

🔶 Increase the learning and mentoring opportunities for people interested in becoming contributors and helping to develop existing contributors into maintainers (e.g., [OpenAstronomy GSoC](https://openastronomy.org/gsoc/)).

🟥 Increase inclusion, diversity, and empowerment efforts within JuliaAstro communities, and improve our understanding of the demographics of our communities in order to measure the effectiveness of these efforts.

🟥 Ensure people who contribute are from a broad experience base, including typical astronomers.

## Governance, Management, and Personnel

This category encompasses goals related to governing and managing JuliaAstro to facilitate reaching the goals described elsewhere in this document.

🟢 Adopt the [Julia Code of Conduct (CoC)](https://julialang.org/community/standards/)

🟥 Build a community ombuds/CoC team to curate the guidelines and enforce them.

## Fundraising

To ensure project sustainability, JuliaAstro needs funding sources that can be maintained over the long term.

🟥 Raise funds from governmental sources outside of the US.

🔶 Raise funds from private foundations.

🟢 Maintain existing funding sources (e.g., NASA, JuliaLang).
