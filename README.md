
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
      package version 0.2, <https://ArchaeoStat.github.io/ArchaeoChron/>.

    Une entrée BibTeX pour les utilisateurs LaTeX est

      @Manual{,
        author = {Anne Philippe and Marie-Anne Vibet},
        title = {{{ArchaeoChron: Bayesian Modeling of Archaeological Chronologies}}},
        year = {2023},
        organization = {Université de Nantes},
        address = {Nantes, France},
        note = {R package version 0.2},
        url = {https://ArchaeoStat.github.io/ArchaeoChron/},
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

## Usage

**ArchaeoChron** provides functions that return a Markov chain of the
posterior distribution of one of the following Bayesian models:

- `combination_Gauss()`: simple combination of Gaussian dates.

- `combinationWithOutliers_Gauss()`: combine Gaussian dates using the
  outliers model described in Bronk Ramsey (2009).

- `combinationWithRandomEffect_Gauss()`: combine Gaussian dates with a
  random effect (Congdon 2010).

- `eventModel_Gauss()`: combine Gaussian dates with an individual random
  effect (Lanos and Philippe 2017).

- `chrono_Gauss()`: simple chronology of Gaussian dates.

- `chronoOutliers_Gauss()`: chronology of Gaussian dates with outlier
  modeling (Bronk Ramsey 2009).

- `chronoEvents_Gauss()`: chronology of events combining Gaussian dates
  (Lanos and Philippe 2017).

- `eventModel_C14()`: combine radiocarbon dates.

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-bronkramsey2009" class="csl-entry">

Bronk Ramsey, Christopher. 2009. “Dealing with Outliers and Offsets in
Radiocarbon Dating.” *Radiocarbon* 51 (3): 1023–45.
<https://doi.org/10.1017/S0033822200034093>.

</div>

<div id="ref-congdon2010" class="csl-entry">

Congdon, Peter D. 2010. *Applied Bayesian Hierarchical Methods*. Chapman
and Hall/CRC. <https://doi.org/10.1201/9781584887218>.

</div>

<div id="ref-lanos2017" class="csl-entry">

Lanos, Philippe, and Anne Philippe. 2017. “Hierarchical Bayesian
Modeling for Combining Dates in Archeological Context.” *Journal de La
Société Française de Statistique* 158 (2): 72–88.
<http://www.numdam.org/item/JSFS_2017__158_2_72_0/>.

</div>

</div>
