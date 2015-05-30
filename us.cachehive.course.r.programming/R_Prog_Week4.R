# R Script used for completing the the programmin assignment for week 4.
# 
# Author: tim
###############################################################################



## data sub-directory
data_dir <- c("./data/")
directory <- c("outcome-of-care-measures.csv")
##data_dir <- c("")

## Get the list of files
data_dir <- paste(data_dir, directory, sep="")


outcome <- read.csv(data_dir, colClasses = "character")
##outcome <- read.csv(data_dir, colClasses = list, nrows=5)

##sapply(outcome, mode)
num_cols<-c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
		    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
			"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
	
##outcome <- transform(outcome, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))


by_state <- split(outcome, outcome$State)
by_state <-by_state$"MN"


by_out<-by_state[,c(2,11)]

by_out[,2]<- suppressWarnings(as.numeric(as.character(by_out[,2])))

by_out <- na.omit(by_out)

##by_out <- by_out[which.min(by_out[, 3]), , drop=FALSE]

by_out <- by_out[ order(by_out[2], by_out$Hospital.Name), ]

len <- nrow(by_out)
by_out["Rank"] <- c(1:len)
names( by_out) <- c("Hospital.Name", "Rate", "Rank")

## Check number request input variable
num <- as.integer(3)     ## Test case
##num < c("worst")          ## Test case
##num < c("best")           ## Test case
##if ( is.character(num) & tolower(num) == "best" ) {
if (identical(num, c("best"))) {
	num <- as.integer(1)
}

##if ( is.character( num) & tolower(num) == "worst" ) {
if (identical(num, c("worst"))) {
		num <- len
}

if ( num > len )
	return(NA)


by_out2 <- by_out[by_out$Rank == as.numeric(num),]

print(by_out2[, "Hospital.Name"])

##print(tail(by_out))
