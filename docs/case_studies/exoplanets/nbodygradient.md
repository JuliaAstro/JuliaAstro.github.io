---
title: "A differentiable N-body code for transit timing and dynamical modelling - I. Algorithm and derivatives"
id: "ericagol-NbodyGradient"
description: "Computes derivatives with respect to initial conditions for TTVs, RV, Photodynamics & more."
author: "[Eric Agol](https://github.com/ericagol); [David M. Hernandez](https://www.davidmhernandez.com/); [Zachary Langford](https://github.com/langfzac)"
date: "2021-07-19"
---

This team uses Julia to develop a fast and accurate N-body code to study the multi-planetary [TRAPPIST-1 system](https://en.wikipedia.org/wiki/TRAPPIST-1).

**Package: [ericagol/NbodyGradient.jl](https://github.com/ericagol/NbodyGradient.jl)**

**[ADS link](https://ui.adsabs.harvard.edu/abs/2021MNRAS.507.1582A/abstract)**

![image](https://s3.amazonaws.com/adsabs-thumbnails/seri/MNRAS/0507/stab2044/stab2044fig7.jpeg)

This is accomplished by using a novel method to obtain the derivatives of the transit times with respect to the initial conditions and masses using the chain rule, which is quicker and more accurate than using finite differences or automatic differentiation.

See their paper published in MNRAS below and follow-up code, [langfzac/Photodynamics](@ref langfzac-Photodynamics), for more:

> Agol, E., Hernandez, D., & Langford, Z. (2021). A differentiable N-body code for transit timing and dynamical modelling – I. Algorithm and derivatives. [Monthly Notices of the Royal Astronomical Society, 507(2), 1582-1605](https://academic.oup.com/mnras/article/507/2/1582/6324024).
