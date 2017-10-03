data = read.csv('iris.data')

data$type = factor(data$type, 
                   levels = c('Iris-setosa','Iris-virginica','Iris-versicolor'),
                   labels = c(1,2,3))
head(data)

library(caTools)
set.seed(123)

split = sample.split(data$type, SplitRatio = 0.8)
training_set = subset(data, split==TRUE)
test_set = subset(data, split==FALSE)

library(h2o)
h2o.init(nthreads=-1)

classifier = h2o.deeplearning(y='type',
                              training_frame=as.h2o(training_set),
                              activation='Rectifier',
                              hidden=c(3, 3),
                              epochs=100,
                              train_samples_per_iteration=-2)
prob_pred = h2o.predict(classifier, newdata=as.h2o(test_set[-5]))


y_pred = as.vector(prob_pred)

cm = table(test_set[,5], prop_pred)
