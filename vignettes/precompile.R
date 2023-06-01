# Vignettes have been precompiled
old_wd <- setwd("./vignettes")
knitr::knit("ArchaeoChron.Rmd.orig", output = "ArchaeoChron.Rmd")
setwd(old_wd)
