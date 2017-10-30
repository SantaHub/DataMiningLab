# Agglomerative clustering

iris
library(cluster)
agn <- agnes(x=iris,diss=FALSE,stand = TRUE, method = "average")
DendAgn <- as.dendrogram(agn)
