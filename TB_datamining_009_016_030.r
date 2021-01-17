#set and get location
getwd()
setwd("D:/UAS_DM")

#importing library packages
install.packages("C50")
install.packages("printr")


library(C50)
library(printr)


#reading the file
datasets <- read.csv("mass.csv",na.strings = "?", sep = ",")


#melihat struktur pada sebuah object
str(datasets)

#pembuatan model
datasets$severity <- as.factor(datasets$severity)
model <- C5.0(severity ~., data=datasets)

#menghilangkan baris yang memiliki NA
datasets <- na.omit(datasets)
str(datasets)

#melihat hasil model
model
summary(model)

#gambar model
plot(model)

#membuat dataset
datatesting <- datasets[,1:5]

#prediksi
predictions <- predict(model, datatesting)

#bandingkan hasil prediksi dengan dataset
table(predictions, datasets$severity)

#mengetahui rule model 
rulemodel <- C5.0(severity ~., data = datasets, rules = TRUE)
rulemodel

summary(rulemodel)
