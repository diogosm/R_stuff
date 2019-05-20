##
## References =>
##	http://www.di.fc.ul.pt/~jpn/r/distributions/fitting.html
##	https://github.com/cran/fitdistrplus/blob/master/tests/t-fitdist.R
##	https://www.r-bloggers.com/fitting-distributions-with-r/
##	https://www.r-bloggers.com/goodness-of-fit-test-in-r/
##	http://www.sthda.com/english/wiki/chi-square-goodness-of-fit-test-in-r
##	https://rcompanion.org/rcompanion/b_03.html
##	https://r-forge.r-project.org/scm/viewvc.php/*checkout*/JSS/fitdistrplus/paper2JSS.pdf?root=riskassessment
##

if(!require("MASS")) install.packages("MASS")
if(!require("fitdistrplus")) install.packages("fitdistrplus")
if(!require("actuar")) install.packages("actuar")

library("MASS")
library("fitdistrplus")
library("actuar")

data=c()

for(i in seq(1,28)){
	data=append(data, 10.0)
}

for(i in seq(1,67)){
	data=append(data, 20.0)
}

for(i in seq(1,5)){
	data=append(data, 30.0)
}

for(i in seq(40.0,100.0,by=10.0)){
    data=append(data,i)
}

ans = fitdist(data, "pareto", start=list(shape=1, scale=500))
#fit_B = fitdist(data, "burr",   start = list(shape1 = 0.3, shape2 = 1, rate = 1))


par(mfrow=c(2,2))
plotdist(data, histo = TRUE, demp = TRUE)

#cdfcomp(list(ans, fit_B), xlogscale = TRUE, ylogscale = TRUE,
#	        legendtext = c("Pareto"), lwd=2)

fit_w  <- fitdist(data, "weibull")
fit_g  <- fitdist(data, "gamma")
fit_ln <- fitdist(data, "lnorm")

plot.legend <- c("Weibull", "lognormal", "gamma", "pareto")

denscomp(list(fit_w, fit_g, fit_ln, ans), legendtext = plot.legend)
cdfcomp (list(fit_w, fit_g, fit_ln, ans), legendtext = plot.legend, xlogscale=TRUE,ylogscale=TRUE)
qqcomp  (list(fit_w, fit_g, fit_ln, ans), legendtext = plot.legend)
ppcomp  (list(fit_w, fit_g, fit_ln, ans), legendtext = plot.legend)



