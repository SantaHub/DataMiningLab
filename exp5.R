dataset = read.csv('auto-mpg.csv')

#dealing with missing values in the attribute horsepower
dataset$horsepower = ifelse(is.na(dataset$horsepower),ave(dataset$horsepower, FUN=function(x) mean(x, na.rm=TRUE)), dataset$horsepower)


library(caTools) # for the simple split function

set.seed(123)# for random split
split=sample.split(dataset$displacement, SplitRatio=2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

liner_regressor = lm(formula = displacement~., data=training_set)

y_pred=predict(liner_regressor, newdata=test_set)

y_true=test_set$displacement

table(y_pred, y_true) # confusion matrix.