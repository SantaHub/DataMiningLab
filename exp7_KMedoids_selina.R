#import data
data = read.csv('glasses.csv')

#execution
result <- pam(data[1:9], 6, FALSE, "euclidean")

#print results
summary(result)

#plot clusters
plot (data, col = result$clustering)
#add the medoids to the plot
points(result$medoids, col = 1:9, pch = 4)

table(result$clustering, data$Type)

library(cluster)
plott <- clusplot(data,result$clustering,color = TRUE, shape = TRUE, labels = 2)
plott


# data(iris)
# kmeans(iris[,3:4],3)
# pam(iris[,3:4] , k=3)
# 
# data<-data(iris)
# install.packages("clue")
# install.packages("lpSolve")
# library(clue,lpSolve)
# kmedoids(head(iris,10),3)
# 
# factor(iris)
# factor(sample(1:100, 10))