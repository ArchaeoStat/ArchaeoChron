# ArchaeoChron
Bayesian Modeling of Archaeological Chronologies

ArchaeoChron provides a list of functions for the Bayesian modeling of archaeological chronologies. The Bayesian models are implemented in 'JAGS' ('JAGS' stands for Just Another Gibbs Sampler. It is a program for the analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation. See <http://mcmc-jags.sourceforge.net/> and "JAGS Version 4.3.0 user manual", Martin Plummer (2017) <https://sourceforge.net/projects/mcmc-jags/files/Manuals/>.). The inputs are measurements with their associated standard deviations and the study period. The output is the MCMC sample of the posterior distribution of the event date with or without radiocarbon calibration. 


If this is your first time using 'ArchaeoChron', take a moment reading the vignette we wrote about the estimation of a cobination of dates (mainly Gaussian). If you have any questions, feel free to contact us (anne.philippe@univ-nantes.fr).


ArchaeoChron is currently developed by Anne Philippe and Marie-Anne Vibet, members of the Laboratoire de mathématiques Jean Leray, Université de Nantes, France.


If you find bugs or want to suggest new features please visit the ArchaeoPhases GitHub issues page (https://github.com/ArchaeoStat/ArchaeoChron/issues) or contact us (anne.philippe@univ-nantes.fr).
