% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chronoOutliers_Gauss.R
\name{chronoOutliers_Gauss}
\alias{chronoOutliers_Gauss}
\title{Bayesian Chronologies of Gaussian Dates Using Oxcal Outlier Model}
\usage{
chronoOutliers_Gauss(
  M,
  s,
  outliersIndivVariance,
  outliersBernouilliProba,
  studyPeriodMin,
  studyPeriodMax,
  refYear = NULL,
  numberChains = 2,
  numberAdapt = 10000,
  numberUpdate = 10000,
  variable.names = c("theta"),
  numberSample = 50000,
  thin = 10
)
}
\arguments{
\item{M}{A [`numeric`] vector of measurements.}

\item{s}{A [`numeric`] vector of errors.}

\item{outliersIndivVariance}{A [`numeric`] vector.}

\item{outliersBernouilliProba}{A [`numeric`] vector.}

\item{studyPeriodMin}{A length-one [`numeric`] vector specifying the start
time of the study period.}

\item{studyPeriodMax}{A length-one [`numeric`] vector specifying the end
time of the study period.}

\item{refYear}{A [`numeric`] vector specifying the reference year. If `NULL`
(the default), AD years are expected.}

\item{numberChains}{An [`integer`] giving the number of of parallel chains
for the model (see [jags.model()]).}

\item{numberAdapt}{An [`integer`] giving the number of iterations for
adaptation (see [jags.model()]).}

\item{numberUpdate}{An [`integer`] giving the number of iterations to update
the model by.}

\item{variable.names}{A [`character`] vector giving the names of variables to
be monitored (see [coda.samples()]).}

\item{numberSample}{An [`integer`] giving the number of iterations to
monitor (see [coda.samples()]).}

\item{thin}{An [`integer`] giving the thinning interval for monitors
(see [coda.samples()]).}
}
\value{
An [`mcmc.list`][coda::mcmc.list()] object.
}
\description{
Bayesian Chronologies of Gaussian Dates Using Oxcal Outlier Model
}
\author{
A. Philippe, M.-A. Vibet
}
