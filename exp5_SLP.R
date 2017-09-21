#Use horsepower to calculate the displacement

dataset = read.csv('auto-mpg.csv')

#Node weights
set.seed(1)
weight = rnorm(7)

y=dataset$displacement
x=data.matrix(dataset[,-3])


#TO be used in loop
error = rnorm(398,1)

# errorcal <- function(ar){
#   return abs(y-ar)
# }

while( sum(error) != 0 ) {
  error=y-abs(x%*%weight)
  weight=weight + (error*0.1)
}