#' Bayesian Chronologies of Gaussian Dates Using the Event Model
#'
#' @param M A [`numeric`] vector of measurements.
#' @param s A [`numeric`] vector of errors.
#' @param measurementsPerEvent A [`numeric`] vector of giving the number of
#'  measurements per event.
#' @param studyPeriodMin A length-one [`numeric`] vector specifying the start
#'  time of the study period.
#' @param studyPeriodMax A length-one [`numeric`] vector specifying the end
#'  time of the study period.
#' @param refYear A [`numeric`] vector specifying the reference year. If `NULL`
#'  (the default), AD years are expected.
#' @param numberChains An [`integer`] giving the number of of parallel chains
#'  for the model (see [jags.model()]).
#' @param numberAdapt An [`integer`] giving the number of iterations for
#'  adaptation (see [jags.model()]).
#' @param numberUpdate An [`integer`] giving the number of iterations to update
#'  the model by.
#' @param variable.names A [`character`] vector giving the names of variables to
#'  be monitored (see [coda.samples()]).
#' @param numberSample An [`integer`] giving the number of iterations to
#'  monitor (see [coda.samples()]).
#' @param thin An [`integer`] giving the thinning interval for monitors
#'  (see [coda.samples()]).
#' @return An [`mcmc.list`][coda::mcmc.list()] object.
#' @author A. Philippe, M.-A. Vibet
#' @export
chronoEvents_Gauss <- function(M, s, measurementsPerEvent, studyPeriodMin, studyPeriodMax, refYear = NULL,
                               numberChains = 2, numberAdapt = 10000, numberUpdate = 10000,
                               variable.names = c('theta'), numberSample = 50000, thin = 10) {

  # Checking inputs
  if (length(M) != length(s))
    stop("Vector of measurements and vector of errors should have the same length")
  if (sum(measurementsPerEvent)!=length(M))
    stop("All the measurements should be affected to an event")
  if (!is.null(refYear) && length(M) != length(refYear))
    stop("Vector of measurements and vector of refYear should have the same length")

  # Data
  NbEvents <- length(measurementsPerEvent)
  pos <-  1 + c(0 , cumsum(measurementsPerEvent) )
  s02 <- 1:NbEvents
  for (i in 1:NbEvents) {
    s02[i] <- 1 / mean(1 / s[pos[i]:(pos[i + 1] - 1)]^2)
  }

  # Conversion in BC/AD format
  if (!is.null(refYear)) M <- refYear - M

  # Bayesian model
  model.file <- system.file(package = "ArchaeoChron", "model", "chronoEvents_Gauss.txt")

  print('Modeling done with JAGS following')
  jags <- jags.model(
    file = model.file,
    data = list('NbEvents' = NbEvents, 'M' = M, 's' = s, 'pos' = pos,
                's02' = s02, 'ta' = studyPeriodMin, 'tb' = studyPeriodMax),
    n.chains = numberChains,
    n.adapt = numberAdapt,
    quiet = TRUE
  )
  print('Update period')
  stats::update(object = jags, n.iter = numberUpdate)
  print('Acquire period')

  coda.samples(
    model = jags,
    variable.names = variable.names,
    n.iter = numberSample,
    thin = thin
  )
}
