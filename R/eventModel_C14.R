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
eventModel_C14 <- function(M, s, studyPeriodMin, studyPeriodMax, calibCurve = 'intcal13',
                           numberChains = 2, numberAdapt = 10000, numberUpdate = 10000,
                           variable.names = c('theta'), numberSample = 50000, thin = 10) {

  # Checking inputs
  if (length(M) != length(s))
    stop("Vector of measurements and vector of errors should have the same length")

  # Data
  N <- length(M)

  # Estimate S02 used in the shrinkage distribution
  ## Individual calibration using BchronCalibrate
  ages <- Bchron::BchronCalibrate(ages = M, ageSds = s, calCurves = rep(calibCurve, N))
  s2hat <- 1:N
  ## Estimation of the deviation of each date
  for (j in 1:N) {
    step <- ages[[j]]$ageGrid[2] - ages[[j]]$ageGrid[1] # time between 2 consecutive time units
    s2hat[j] <- sum(step * ages[[j]]$ageGrid^2 * ages[[j]]$densities) -
      (sum(step * ages[[j]]$ageGrid * ages[[j]]$densities)^2)
  }
  ## Estimation of s02 for the shrinkage distribution
  s02 <- 1 / mean(1 / s2hat)

  # Calibration curve
  pathToCalCurves <- system.file(package = "ArchaeoChron", "data")
  calCurveFile <- paste(pathToCalCurves, '/', calibCurve, '.RData', sep = '')
  if (!file.exists(calCurveFile))
    stop(paste('Calibration curve file', calibCurve, 'not found.'))
  x <- load(calCurveFile)
  calCurve <- get(x)
  Xca <- 1950 - calCurve[, 1] # conversion in BC/AD format
  Gca <- calCurve[, 2]
  SDca <- calCurve[, 3]

  # Bayesian model
  model.file <- system.file(package = "ArchaeoChron", "model", "eventModel_C14.txt")
  print('Bayesian modeling using JAGS')
  jags <- jags.model(
    file = model.file,
    data = list('M' = M, 'N' = N, 's' = s,'s02' = s02,
                'ta' = studyPeriodMin, 'tb' = studyPeriodMax,
                'Xca' = Xca, 'Gca' = Gca, 'SDca' = SDca),
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
