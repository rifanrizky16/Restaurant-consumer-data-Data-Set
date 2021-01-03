lokasi <- "D:/tugas"
setwd(lokasi)
getwd()
dataset <- read.csv("rating_final.csv",sep =",") 
dataset$userID <- as.factor(dataset$userID)
dataset$placeID <- as.factor(dataset$placeID)
dataset$rating <- as.factor(dataset$rating)
dataset$food_rating <- as.factor(dataset$food_rating)
dataset$service_rating <- as.factor(dataset$service_rating)
library(C50)
library(printr)
model <- C5.0(food_rating~., data=dataset)
model
summary(model)
plot(model)
datatesting <- dataset[,1:5]
predictions <- predict(model, datatesting)
table(predictions, dataset$service_rating)
