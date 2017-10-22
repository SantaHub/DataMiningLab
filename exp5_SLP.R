#Use horsepower to calculate the displacement
#setwd("~/ML/LAB_ADML_temp/data")

dataset = read.csv('auto-mpg.csv')

#dealing with missing values in the attribute horsepower
dataset$horsepower = ifelse(is.na(dataset$horsepower),ave(dataset$horsepower, FUN=function(x) mean(x, na.rm=TRUE)), dataset$horsepower)

#Node weights
set.seed(1)
weight = rnorm(398)

y_true = dataset$displacement
x = dataset$horsepower

#TO be used in loop
err = rnorm(398,1)

updated=0
y_pred = x*weight

while(y_true != y_pred) {
  y_pred = x*weight
  
  if(y_true<y_pred){
    error = y_true - y_pred
    weight=weight+error*0.1
  }else{
    error=y_pred-y_true
    weight =  weight - error*0.1
  }
  
  updated = updated+1
  cat("y_pred",y_pred,"y_true",y_true,"weight",weight)
}

weight

#no sigmoid function needed here. the values are direct regression.