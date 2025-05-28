---
title: "Achieving petaflop performance with Celeste.jl"
description: "See how this team used Julia to produce the most accurate catalog of 188 million astronomical objects in just 14.6 minutes with state-of-the-art point and uncertainty estimates."
date: 2019-04-10
---

As part of a multi-institution, multi-disciplinary team, including the National Energy Research Scientific Computing Center (NERSC), Princeton, Harvard, Intel, MIT, and JuliaHub, researchers develop a state-of-the-art parallel computing method to analyze massize astronomy datasets at petascale.

**Package: [Celeste.jl](https://github.com/jeff-regier/Celeste.jl)**

![image](https://s3.amazonaws.com/adsabs-thumbnails/seri/arXiv/arXiv/1803/00113/arxiv1803.00113_f2.png)

The Celeste team set a number of new milestones, including:

* Loading an aggregate of ~178 terabytes of Sloan Digital Sky Survey (SDSS) image data
* Producing parameter estimates for 188 million stars and galaxies from this dataset in 14.6 minutes
* Achieving a peak performance of 1.54 petaflops using 1.3 million threads on 9,300 Knights Landing (KNL) nodes of the Cori supercomputer at NERSC
* Achieving a performance improvement of 1,000x in single-threaded execution
* Demonstrating conclusively that massive and complex datasets can be analyzed with Bayesian inference by applying variational inference (VI)
* Providing not only point estimates for light sources but, for the first time, a principled measure of the quality of inference for each light source (posterior uncertainty for source type, brightness, and colors)

See the team's series of papers below and [JuliaHub article](https://juliahub.com/industries/case-studies/celeste?_gl=1*1iaui43*_ga*MTk1NzU0MDA0NS4xNzQ2MDMxMzUz*_ga_8FC7JQQLXX*czE3NDgzODc5NTQkbzIkZzEkdDE3NDgzODkyMDUkajYwJGwwJGgw) for more:

1. [Jeffrey Regier, Andrew Miller, David Schlegel, Ryan Adams, Jon McAuliffe, and Prabhat. "Approximate inference for constructing astronomical catalogs from images." In: Annals of Applied Statistics, 13 (3), 2019.](https://ui.adsabs.harvard.edu/abs/2018arXiv180300113R/abstract)
1. [Jeffrey Regier, Kiran Pamnany, Keno Fischer, Andreas Noack, Maximilian Lam, Jarrett Revels, Steve Howard, Ryan Giordano, David Schlegel, Jon McAuliffe, Rollin Thomas, and Prabhat. “Cataloging the visible universe through Bayesian inference at petascale.” In: International Parallel and Distributed Processing Symposium (IPDPS), 2018.](https://ui.adsabs.harvard.edu/abs/2018arXiv180110277R/abstract)
1. [Jeffrey Regier, Andrew Miller, Jon McAuliffe, Ryan Adams, Matt Hoffman, Dustin Lang, David Schlegel, and Prabhat. “Celeste: Variational inference for a generative model of astronomical images.” In: Proceedings of the 32nd International Conference on Machine Learning (ICML). 2015.](https://ui.adsabs.harvard.edu/abs/2015arXiv150601351R/abstract)
