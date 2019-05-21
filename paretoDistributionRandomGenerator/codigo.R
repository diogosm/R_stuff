##
## References
##	https://stackoverflow.com/questions/14497349/draw-random-numbers-from-restricted-pareto-distribution
##

if(!require("fitdistrplus")) install.packages("fitdistrplus")
if(!require("VGAM")) install.packages("VGAM")
if(!require("ggplot2")) install.packages("ggplot2")
if(!require("RColorBrewer")) install.packages("RColorBrewer")
if(!require("wesanderson")) install.packages("wesanderson")

library("fitdistrplus")
library("VGAM")
library("ggplot2")
library("RColorBrewer")
library("wesanderson")

## Pareto CDF
ppareto <- function(x, scale, shape){
	ifelse(x > scale, 1 - (scale / x) ^ shape, 0)
}

## inverse CDF
qpareto <- function(y, scale, shape){
	ifelse(
		y >= 0 & y <= 1,
		scale * ((1 - y) ^ (-1 / shape)),
		NaN
	)
}

cairo_pdf("paretoCDF.pdf", width = 5, height = 5)
#pdf("paretoCDF.pdf")
#png("paretoCDF.png", width = 400, height = 400)

n = 10000
scale = 1e-3
shapes = c()
lower_bound = 0
upper_bound = 100
primeiro = 1
cores = brewer.pal(8,"Dark2")
#cores = c('#b2182b','#d6604d','#f4a582','#fddbc7','#d1e5f0','#92c5de','#4393c3','#2166ac')
#cores = rainbow(6)
linetype = c(1:8) 

plot(
	c(-1,2),
	c(-1,101),
	ylim=c(0.0,1.0),
	xlim=c(0.0,100.0),
	xlab="Energy level",
	ylab="Willingness to cooperate probability"
)

#par(xpd = NA)
#par(mar=c(0, 0, 0, 0));

for(shape in c(0.01,0.125,0.3)){
	cat("Shape is: ", shape, "\n")
	shapes = append(shapes, paste("α = ", shape))
	
	(quantiles = ppareto(c(lower_bound, upper_bound), scale, shape))
	uniform_random_numbers = runif(n, quantiles[1], quantiles[2])    
	truncated_pareto_random_numbers = qpareto(uniform_random_numbers, scale, shape)
	
	## plot ecdf pareto distribution
	lines(ecdf(truncated_pareto_random_numbers), col=cores[primeiro], lty=linetype[primeiro])
	
	primeiro = primeiro + 1
}

legend(
	65,
	0.21,
	legend=shapes,
	col=brewer.pal(8,"Dark2"),
	lty=1,
	cex=0.8	
)
#text(55, 0.9, "Less tolerant") #png
#text(18, 0.92, "High tolerant") #png
text(55, 0.9, "Less tolerant") #pdf
text(18.5, 0.92, "High tolerant") #pdf
grid(NULL,NULL,lty=6)
axis(side=1,at=seq(0.0,100.0,by=10))

## save image
dev.off()
