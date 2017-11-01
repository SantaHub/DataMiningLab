data = iris
#import data
library(cluster)

#execution
result <- pam(data[1:4], 3, metric = "euclidian", do.swap = TRUE)

result1 <- pam(data[1:4], 3, metric = "manhattan", do.swap = TRUE)

#print results
summary(result)

#plot clusters
plot (data, col = result$clustering)
#add the medoids to the plot
points(result$medoids, col = 1:4, pch = 4)

table(result$clustering, data[,5])

plott <- clusplot(data,result$clustering,color = TRUE, shape = TRUE, labels = 2)
plott
