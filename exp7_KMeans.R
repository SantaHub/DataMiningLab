#K-Means 

data(iris) # Importing the iris dataset

iris <- scale(iris[]) # standardize variables

library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
iris$cluster1 <- as.factor(kc1$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$cluster1)) + geom_point() + ggtitle("2 Variables")