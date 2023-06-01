
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ArchaeoChron

<!-- badges: start -->

[![R-CMD-check](https://github.com/ArchaeoStat/ArchaeoChron/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ArchaeoStat/ArchaeoChron/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/ArchaeoStat/ArchaeoChron/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ArchaeoStat/ArchaeoChron)
[![Dependencies](https://tinyverse.netlify.com/badge/ArchaeoChron)](https://cran.r-project.org/package=ArchaeoChron)

<a href="https://ArchaeoStat.r-universe.dev" class="pkgdown-devel"><img
src="https://ArchaeoStat.r-universe.dev/badges/ArchaeoChron"
alt="r-universe" /></a>
<a href="https://cran.r-project.org/package=ArchaeoChron"
class="pkgdown-release"><img
src="http://www.r-pkg.org/badges/version/ArchaeoChron"
alt="CRAN Version" /></a> <a
href="https://cran.r-project.org/web/checks/check_results_ArchaeoChron.html"
class="pkgdown-release"><img
src="https://badges.cranchecks.info/worst/ArchaeoChron.svg"
alt="CRAN checks" /></a>
<a href="https://cran.r-project.org/package=ArchaeoChron"
class="pkgdown-release"><img
src="http://cranlogs.r-pkg.org/badges/ArchaeoChron"
alt="CRAN Downloads" /></a>

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

## Overview

**ArchaeoChron** provides a list of functions for the Bayesian modeling
of archaeological chronologies. The Bayesian models are implemented in
‘JAGS’ (‘JAGS’ stands for Just Another Gibbs Sampler. It is a program
for the analysis of Bayesian hierarchical models using Markov Chain
Monte Carlo (MCMC) simulation. See <http://mcmc-jags.sourceforge.net/>
and “JAGS Version 4.3.0 user manual”, Martin Plummer (2017)
<https://sourceforge.net/projects/mcmc-jags/files/Manuals/>.). The
inputs are measurements with their associated standard deviations and
the study period. The output is the MCMC sample of the posterior
distribution of the event date with or without radiocarbon calibration.

If this is your first time using **ArchaeoChron**, take a moment to read
the vignette we wrote about the estimation of a combination of dates
(mainly Gaussian). If you have any questions, feel free to contact us
(<anne.philippe@univ-nantes.fr>).

    To cite ArchaeoChron in publications use:

      Philippe A, Vibet M (2023). _ArchaeoChron: Bayesian Modeling of
      Archaeological Chronologies_. Université de Nantes, Nantes, France. R
      package version 0.1.0,
      <https://ArchaeoStat.github.io/ArchaeoChron>.

    Une entrée BibTeX pour les utilisateurs LaTeX est

      @Manual{,
        author = {Anne Philippe and Marie-Anne Vibet},
        title = {{{ArchaeoChron: Bayesian Modeling of Archaeological Chronologies}}},
        organization = {Université de Nantes},
        address = {Nantes, France},
        note = {R package version 0.1.0},
        url = {https://ArchaeoStat.github.io/ArchaeoChron},
      }

## Installation

You can install the released version of **ArchaeoChron** from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ArchaeoChron")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ArchaeoStat/ArchaeoChron")
```
