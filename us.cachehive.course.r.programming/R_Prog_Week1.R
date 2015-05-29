# R Script used for completing the quiz for week 1.
# 
# Author: tim
###############################################################################


label<-"Question 4"
x<-4
print(label)
print(x)

label<-"Question 5"
x <- c(4, "a", TRUE)
x
		
label<-"Question 8"
x <- list(2, "a", "b", TRUE)
y<-x[[2]]
print(label)
print(y)
		
label<-"Question 9"
x <- 1:4 
y <- 2:3
z<-x+y
print(label)
print(z)

######################################
data = gzfile(description = "./data/rprog-data-quiz1_data.zip", open = "r")
data <- read.csv("./data/hw1_data.csv")

label<-"Question 11"
labs<-names(data)
print(label)
print(labs)

label<-"Question 12"
x<-data[1:2,]
print(label)
print(x)

label<-"Question 13"
len<-nrow(data)
print(label)
print(len)

label<-"Question 14"
x<-data[152:153,]
#x<-data[[len]-1:[len],]
print(label)
print(x)

label<-"Question 15"
x<-data[47,"Ozone"]
print(label)
print(x)

label<-"Question 16"
are_na<-sum(is.na(data$Ozone))
print(label)
print(are_na)

label<-"Question 17"
s<-colMeans(data[c("Ozone")], na.rm=TRUE)
print(label)
print(s)

label<-"Question 18"
sub_data<-data[data$Ozone > 31 & data$Temp > 90,]
s<-colMeans(sub_data[c("Solar.R")], na.rm=TRUE)
print(label)
print(s)

label<-"Question 19"
sub_data<-data[data$Month == 6,]
s<-colMeans(sub_data[c("Temp")], na.rm=TRUE)
print(label)
print(s)

label<-"Question 20"
sub_data<-data[data$Month == 5,]
s<-max(sub_data[c("Ozone")], na.rm=TRUE)
print(label)
print(s)