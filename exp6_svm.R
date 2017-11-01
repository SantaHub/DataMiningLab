#SVM

setwd("~/ML/LAB_ADML_temp/data")

#import dataset
dataset = read.csv('auto-mpg.csv')

library(caTools)
set.seed(123)# for random split
split=sample.split(dataset$displacement, SplitRatio=2/3)

training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

library(e1071)
regressor = svm(formula = displacement ~ .,
                data = training_set,
                type='eps-regression')

#Predicting result
y_pred= predict(regressor, test_set)

library(ggplot2)
ggplot()+
  geom_point(aes(x=c(1:126) , y=test_set$displacement),
             colour = 'red') +
  geom_point(aes(x = c(1:126) , y = y_pred),
            colour = 'blue') +
  ggtitle('plot') +
  xlab('Labels') +
  ylab('Displacement')

actuals_preds <- data.frame(cbind(actuals=test_set$displacement, predicteds=y_pred )) 
correlation_accuracy <- cor(actuals_preds)
cat('The accuracy is ' ,correlation_accuracy[1,2])


