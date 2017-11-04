library(neuralnet)

data1=read.csv('auto-mpg.csv')

#formula <- displacement~horsepower+weight
#m<-model.matrix(~ horsepower+cylinders+displacement, data1)

mono <- neuralnet(mpg ~ displacement, data, hidden=0)
mono$result
plot(mono)
