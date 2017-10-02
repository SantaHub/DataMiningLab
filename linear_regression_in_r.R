library(openxlsx)
a <- read.xlsx('Folds5x2_pp.xlsx', 1)
head(a)
set.seed(123)#set the seed so that the results are reproducible.
split <- sample(nrow(a), size = floor(0.75 * nrow(a)))#randomly select 75% of the numbers in the sequence and store it in the variable split.
trainData <- a[split, ]#Now copy the split sample into trainData
testData <- a[-split, ]#copy remaining sample into trainData
predictionModel <- lm(PE ~ AT + V + AP + RH, data = trainData)
summary(predictionModel)
prediction <- predict(predictionModel, newdata = testData)
print("Predicted Values")
head(prediction)
print("Acual Values")
head(testData$PE)
#Predicting accuracy by using and checking Multiple R-squared 
#sum of square of residuals
#It is the difference between the predicted value and the actual value, and can be accessed by predictionModel$residuals.
Sum_of_residuals <- sum((testData$PE - prediction) ^ 2)
#total sum of squares
# calculated by summing the squares of difference between the actual value and the mean value.
Total_sum_of_squares <- sum((testData$PE - mean(testData$PE)) ^ 2)
R_square_value=1-(Sum_of_residuals/Total_sum_of_squares)
cat("Accuracy=",R_square_value*100)
