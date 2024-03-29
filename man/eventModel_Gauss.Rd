% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eventModel_Gauss.R
\name{eventModel_Gauss}
\alias{eventModel_Gauss}
\title{Event Model for Gaussian Dates}
\usage{
eventModel_Gauss(
  M,
  s,
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
Event Model for Gaussian Dates
}
\author{
A. Philippe, M.-A. Vibet
}
