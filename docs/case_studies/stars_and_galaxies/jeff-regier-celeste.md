---
title: "Achieving petaflop performance with Celeste.jl"
id: "jeff-regier-Celeste"
description: "See how this team used Julia to produce the most accurate catalog of 188 million astronomical objects in just 14.6 minutes with state-of-the-art point and uncertainty estimates."
date: 2019-04-10
---

As part of a multi-institution, multi-disciplinary team, including the National Energy Research Scientific Computing Center (NERSC), Princeton, Harvard, Intel, MIT, and JuliaHub, researchers develop a state-of-the-art parallel computing method to analyze massize astronomy datasets at petascale.

**Package: [jeff-regier/Celeste.jl](https://github.com/jeff-regier/Celeste.jl)**

![image](https://s3.amazonaws.com/adsabs-thumbnails/seri/arXiv/arXiv/1803/00113/arxiv1803.00113_f2.png)

The Celeste team set a number of new milestones, including:

* Loading an aggregate of ~178 terabytes of Sloan Digital Sky Survey (SDSS) image data
* Producing parameter estimates for 188 million stars and galaxies from this dataset in 14.6 minutes
* Achieving a peak performance of 1.54 petaflops using 1.3 million threads on 9,300 Knights Landing (KNL) nodes of the Cori supercomputer at NERSC
* Achieving a performance improvement of 1,000x in single-threaded execution
* Demonstrating conclusively that massive and complex datasets can be analyzed with Bayesian inference by applying variational inference (VI)
* Providing not only point estimates for light sources but, for the first time, a principled measure of the quality of inference for each light source (posterior uncertainty for source type, brightness, and colors)

See the team's series of papers below and [JuliaHub article](https://juliahub.com/industries/case-studies/celeste?_gl=1*1iaui43*_ga*MTk1NzU0MDA0NS4xNzQ2MDMxMzUz*_ga_8FC7JQQLXX*czE3NDgzODc5NTQkbzIkZzEkdDE3NDgzODkyMDUkajYwJGwwJGgw) for more:

> 1. Jeffrey Regier, Andrew C. Miller, David Schlegel, Ryan P. Adams, Jon D. McAuliffe, & Prabhat (2019). Approximate inference for constructing astronomical catalogs from images. [The Annals of Applied Statistics, 13(3), 1884 – 1926](https://projecteuclid.org/journals/annals-of-applied-statistics/volume-13/issue-3/Approximate-inference-for-constructing-astronomical-catalogs-from-images/10.1214/19-AOAS1258.full?tab=ArticleLink). [[ADS]](https://ui.adsabs.harvard.edu/abs/2018arXiv180300113R/abstract)
> 1. Regier, J., Pamnany, K., Fischer, K., Noack, A., Lam, M., Revels, J., Howard, S., Giordano, R., Schlegel, D., McAuliffe, J., Thomas, R., & Prabhat, .. (2018). Cataloging the Visible Universe Through Bayesian Inference at Petascale. [In 2018 IEEE International Parallel and Distributed Processing Symposium (IPDPS) (pp. 44-53)](https://ieeexplore.ieee.org/document/8425159). [[ADS]](https://ui.adsabs.harvard.edu/abs/2018arXiv180110277R/abstract)
> 1. Regier, J., Miller, A., McAuliffe, J., Adams, R., Hoffman, M., Lang, D., Schlegel, D., & Prabhat, M. (2015). Celeste: Variational inference for a generative model of astronomical images. [In Proceedings of the 32nd International Conference on Machine Learning (pp. 2095–2103). PMLR](https://proceedings.mlr.press/v37/regier15.html). [[ADS]](https://ui.adsabs.harvard.edu/abs/2015arXiv150601351R/abstract)
