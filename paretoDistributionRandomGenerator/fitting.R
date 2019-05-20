##
## References = http://www.di.fc.ul.pt/~jpn/r/distributions/fitting.html
##

if(!require("MASS")) install.packages("MASS")
if(!require("fitdistrplus")) install.packages("fitdistrplus")
if(!require("actuar")) install.packages("actuar")

library("MASS")
library("fitdistrplus")
library("actuar")

data=c()

for(i in seq(1,28)){
	data=append(data, 10)
}

for(i in seq(1,67)){
	data=append(data, 20)
}

for(i in seq(1,5)){
	data=append(data, 30)
}

for(i in seq(40,100,by=10)){
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



