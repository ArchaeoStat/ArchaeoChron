#' Event Model for Radiocarbon Dates
#'
#' @param M A [`numeric`] vector of measurements.
#' @param s A [`numeric`] vector of errors.
#' @param studyPeriodMin A length-one [`numeric`] vector specifying the start
#'  time of the study period.
#' @param studyPeriodMax A length-one [`numeric`] vector specifying the end
#'  time of the study period.
#' @param calibCurve A [`character`] string specifying the calibration curve to
#'  be used.
#' @param numberChains An [`integer`] giving the number of of parallel chains
#'  for the model (see [rjags::jags.model()]).
#' @param numberAdapt An [`integer`] giving the number of iterations for
#'  adaptation (see [rjags::jags.model()]).
#' @param numberUpdate An [`integer`] giving the number of iterations to update
#'  the model by.
#' @param variable.names A [`character`] vector giving the names of variables to
#'  be monitored (see [rjags::coda.samples()]).
#' @param numberSample An [`integer`] giving the number of iterations to
#'  monitor (see [rjags::coda.samples()]).
#' @param thin An [`integer`] giving the thinning interval for monitors
#'  (see [rjags::coda.samples()]).
#' @return An [`mcmc.list`][coda::mcmc.list()] object.
#' @example inst/examples/ex-event_c14.R
#' @author A. Philippe, M.-A. Vibet
#' @export
eventModel_C14 <- function(M, s, studyPeriodMin, studyPeriodMax, calibCurve = 'intcal13',
                           numberChains = 2, numberAdapt = 10000, numberUpdate = 10000,
                           variable.names = c('theta'), numberSample = 50000, thin = 10) {

  # Checking inputs
  if (length(M) != length(s))
    stop("Vector of measurements and vector of errors should have the same length")

  # Data
  N <- length(M)

  # Estimate S02 used in the shrinkage distribution
  ## Individual calibration
  ages <- ananke::c14_calibrate(values = M, errors = s, curves = calibCurve)
  s2hat <- seq_len(N)

  ## Estimation of the deviation of each date
  grid <- aion::time(ages, calendar = aion::BP())
  step <- min(abs(diff(grid))) # time between 2 consecutive time units
  for (j in seq_len(N)) {
    dens <- ages[, j, , drop = TRUE]
    s2hat[[j]] <- sum(step * grid^2 * dens) - (sum(step * grid * dens)^2)
  }

  ## Estimation of s02 for the shrinkage distribution
  s02 <- 1 / mean(1 / s2hat)

  # Calibration curve
  calCurve <- ananke::c14_curve(calibCurve)[[1L]]
  Xca <- 1950 - calCurve[, 1] # conversion in BC/AD format
  Gca <- calCurve[, 2]
  SDca <- calCurve[, 3]

  # Bayesian model
  model.file <- system.file("model", "eventModel_C14.txt", package = "ArchaeoChron")
  print('Bayesian modeling using JAGS')
  jags <- rjags::jags.model(
    file = model.file,
    data = list('M' = M, 'N' = N, 's' = s, 's02' = s02,
                'ta' = studyPeriodMin, 'tb' = studyPeriodMax,
                'Xca' = Xca, 'Gca' = Gca, 'SDca' = SDca),
    n.chains = numberChains,
    n.adapt = numberAdapt,
    quiet = TRUE
  )
  print('Update period')
  stats::update(object = jags, n.iter = numberUpdate)
  print('Acquire period')

  rjags::coda.samples(
    model = jags,
    variable.names = variable.names,
    n.iter = numberSample,
    thin = thin
  )
}
