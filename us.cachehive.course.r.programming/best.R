# TODO: Add comment
# 
# Author: tim
###############################################################################


best <- function(state, outcome) {
	## Read outcome data
	## Check that state and outcome are valid
	## Return hospital name in that state with lowest 30-day death
	## rate

	## Test for empty parameters.
	if (missing(state)) {
		stop("invalid state")
	}
	
	if (missing(outcome)) {
		stop("invalid outcome")
	}
	
	## data sub-directory
	data_dir <- c("./data/")
	directory <- c("outcome-of-care-measures.csv")
	##data_dir <- c("")
	
	## Get the list of files
	data_dir <- paste(data_dir, directory, sep="")
	
	##list<-rep("character", 46)
	##list[11]<-"numeric"
	##list[17]<-"numeric"
	##list[23]<-"numeric"
	
	df <- read.csv(data_dir, colClasses="character")
	##df <- read.csv(data_dir, na.strings="Not Available", stringsAsFactors=FALSE)
	
	num_cols<-c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
			"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
			"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
	
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
	
	## Create a new dataframe with just the desired state.
	idx_st <- c(df$State == state)
	state_df<- df[idx_st,]
	
	## Complain if we got nothing back.
	if (nrow(state_df) == 0)
	    stop("invalid state")
	
	## Figure out which column we should be looking at.
	col <- switch( tolower(outcome),
			"heart attack" = 11,
			"heart failure" = 17,
			"pneumonia" = 23)
	
	## Complain if we do not have a match.
	if (is.null(col))
		stop("invalid outcome")
	
	by_out<-state_df[,c(2,7,col)]
	
	by_out[,3]<- suppressWarnings(as.numeric(as.character(by_out[,3])))
	
	by_out <- na.omit(by_out)
	
	by_out <- by_out[which.min(by_out[, 3]), , drop=FALSE]
	
	by_out <- by_out[order(3),]
	
	##str(by_out)
	##by_out[1,by_out$Hospital.Name]
	
	by_out[1,1]
}