## code to prepare `DATASET` dataset goes here

cuers <- read.csv("data-raw/cuers.csv")
usethis::use_data(cuers, overwrite = TRUE)

sunspot <- read.csv("data-raw/sunspot.csv")
usethis::use_data(sunspot, overwrite = TRUE)
