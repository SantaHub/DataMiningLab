#Agnes

library(cluster)

#Using agnes with different metrics type -Manhattan and Euclidian
agn_manhattan <- agnes(iris, metric = "manhattan", stand = TRUE)
agn_manhattan
plot(agn_manhattan)

agn_euci <- agnes(iris, metric = "euclidian", stand = TRUE)
agn_euci
plot(agn_euci)

# Dissimilarity Matrix Calculation. The distance between each observations
op <- par(mfrow=c(2,2))
agn2 <- agnes(daisy(iris), diss = TRUE, method = "complete")
plot(agn2) # The dissimilarity matrix clustered by agnes is plotted.

## alpha = 0.625 ==> beta = -1/4  is "recommended" by some

agnS <- agnes(iris, method = "flexible", par.meth = 0.625)
plot(agnS)
par(op) #graphical parameters -par