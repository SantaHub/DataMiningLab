library(RSNNS)
set.seed(2)

data(iris)
#shuffle the vector
df <- iris[sample(nrow(iris)),]

dfValues <- df[,1:4]
dfTargets <- decodeClassLabels(df[,5])

df <- splitForTrainingAndTest(dfValues, dfTargets, ratio=0.15)

#normalize data
df <- normTrainingAndTestSet(df)

model <- mlp(df$inputsTrain, df$targetsTrain, size=5, learnFunc="Quickprop", learnFuncParams=c(0.1, 2.0, 0.0001, 0.1), 
             maxit=50, inputsTest=df$inputsTest, targetsTest=df$targetsTest)


predictions <- predict(model,df$inputsTest)
plotRegressionError(df$targetsTest[,2], predictions[,2])

confusionMatrix(df$targetsTrain,fitted.values(model))
cm <- confusionMatrix(df$targetsTest,predictions)
sum=0
for(row in 1:nrow(cm)) {
    sum = sum+(cm[row, row])
}

sprintf("Accuracy is : %f", (sum/nrow(df$targetsTest))*100 )

plotROC(fitted.values(model)[,2], df$targetsTrain[,2])
plotROC(predictions[,2], df$targetsTest[,2])

confusionMatrix(df$targetsTrain, encodeClassLabels(fitted.values(model),method="402040", l=0.4, h=0.6))


