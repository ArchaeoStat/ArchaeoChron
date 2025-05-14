\donttest{
eve <- eventModel_C14(
  M = 4500,
  s = 35,
  studyPeriodMin = 700,
  studyPeriodMax = 1100,
  calibCurve = "intcal20",
  numberSample = 5000
)
plot(eve)
}
