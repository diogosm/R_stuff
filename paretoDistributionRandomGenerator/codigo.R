if(!require("fitdistrplus")) install.packages("fitdistrplus")
if(!require("VGAM")) install.packages("VGAM")

library("VGAM")
library("fitdistrplus")

## Pareto CDF
ppareto <- function(x, scale, shape)
{
  ifelse(x > scale, 1 - (scale / x) ^ shape, 0)
}

## inverse CDF
qpareto <- function(y, scale, shape)
{
  ifelse(
    y >= 0 & y <= 1,
    scale * ((1 - y) ^ (-1 / shape)),
    NaN
  )
}

n <- 1000
scale <- 0.1
shape <- 3 
lower_bound <- 0
upper_bound <- 1

(quantiles <- ppareto(c(lower_bound, upper_bound), scale, shape))
uniform_random_numbers <- runif(n, quantiles[1], quantiles[2])    
truncated_pareto_random_numbers <- qpareto(uniform_random_numbers, scale, shape)

hist(truncated_pareto_random_numbers)

min(truncated_pareto_random_numbers)
max(truncated_pareto_random_numbers)

plot(ecdf(truncated_pareto_random_numbers))

n <- 1000
scale <- 0.1
shape <- 4
lower_bound <- 0
upper_bound <- 1

(quantiles <- ppareto(c(lower_bound, upper_bound), scale, shape))
uniform_random_numbers <- runif(n, quantiles[1], quantiles[2])    
truncated_pareto_random_numbers <- qpareto(uniform_random_numbers, scale, shape)

min(truncated_pareto_random_numbers)
max(truncated_pareto_random_numbers)

lines(ecdf(truncated_pareto_random_numbers),col=27)

