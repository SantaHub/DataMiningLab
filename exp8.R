# Agglomerative clustering (AGNES)

iris
library(cluster)
agn <- agnes(x=iris,diss=FALSE,stand = TRUE, method = "average")
DendAgn <- as.dendrogram(agn)
pltree(agn,cex=0.6,main = "Dendragram of AGNES" )


# Divisive Hierarchical Clustering Algorithms (DIANA)
dna <- diana(iris)
pltree(dna, cex=.5, main="Dendrogram of Diana")
