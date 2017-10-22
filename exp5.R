#Linear model. Linear Regression
#Using dataset to predict displacement
dataset = read.csv('auto-mpg.csv')

#dealing with missing values in the attribute horsepower
dataset$horsepower = ifelse(is.na(dataset$horsepower),ave(dataset$horsepower, FUN=function(x) mean(x, na.rm=TRUE)), dataset$horsepower)


library(caTools) # for the simple split function

set.seed(123)# for random split
split=sample.split(dataset$displacement, SplitRatio=2/3)

training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

liner_regressor = lm( displacement ~ . , data=training_set)

y_pred=predict(liner_regressor, newdata=test_set)

#Test Single row  ###
data=head(dataset,2)
data=within(data,rm("displacement")) #Remove single column
predict(liner_regressor,newdata = data)
###

y_true=test_set$displacement

# table(y_pred, y_true) # confusion matrix.
# plot(liner_regressor)
# 
# plot(data$displacement)

library(ggplot2)
ggplot()+
  geom_point(aes(x=test_set$horsepower , y=y_true),
             colour = 'red') +
  geom_line(aes(x = test_set$horsepower , y = y_pred),
            colour = 'blue') +
  ggtitle('plot') +
  xlab('Level') +
  ylab('Salary')

actuals_preds <- data.frame(cbind(actuals=y_true, predicteds=y_pred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)
cat('The accuracy is ' ,correlation_accuracy[1,2])