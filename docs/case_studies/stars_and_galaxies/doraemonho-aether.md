---
title: "`Aether.jl`: A High-Performance 3D MHD and Multifluid Dust Code Written in a Dynamic Language with an Interactive Human-AI Development Framework"
id: "doraemonho-aether"
description: "See how Julia runs production astrophysical MHD simulations on everything from an interactive notebook to thousands of GPUs on the Frontier exascale supercomputer."
author: "[Ka Wai Ho](https://github.com/doraemonho)"
date: 2026-08-14
---

Developed at the Kavli Institute for Theoretical Physics (KITP), Aether is a finite-volume code for compressible hydrodynamics and magnetohydrodynamics (MHD), with any number of dust fluids coupled to the gas through drag. It is designed to solve the two-language problem in computational astrophysics: the same Julia code used to prototype in a notebook is the code that runs in production on a cluster.

**Package: [MHDFlows/Aether.jl](https://github.com/MHDFlows/Aether.jl)**

![Orszag-Tang Vortex](https://arxiv.org/html/2608.14048v3/fig_orszag_tang.png)

Every performance-critical kernel is written once with [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) and runs on CPUs and on NVIDIA, AMD, Apple, and Intel GPUs. On a single GPU, Aether's throughput is comparable to or higher than C++ codes on the same hardware, and in weak scaling tests on Frontier it keeps above 93% parallel efficiency out to 4096 GPU compute dies (GCDs). Aether was also built from scratch in an interactive human–coding agent workflow, with every design decision and development session recorded in the repository.

See the paper below on arXiv for more:

> Ho, K. W. (2026). Aether.jl: A High-Performance 3D MHD and Multifluid Dust Code Written in a Dynamic Language with an Interactive Human-AI Development Framework. [arXiv:2608.14048](https://arxiv.org/abs/2608.14048). [[ADS]](https://ui.adsabs.harvard.edu/abs/2026arXiv260814048H/abstract)
