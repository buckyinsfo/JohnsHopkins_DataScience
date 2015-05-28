# TODO: Add comment
# 
# Author: tim
###############################################################################


best <- function(state, outcome) {
	## Read outcome data
	## Check that state and outcome are valid
	## Return hospital name in that state with lowest 30-day death
	## rate

	if (missing(state)) {
		stop("Need to specify state in call to best.")
	}
	
	if (missing(outcome)) {
		stop("Need to specify outcome in call to best.")
	}
	
	## data sub-directory
	data_dir <- c("./data/")
	directory <- c("outcome-of-care-measures.csv")
	##data_dir <- c("")
	
	## Get the list of files
	data_dir <- paste(data_dir, directory, sep="")
	
	list<-rep("character", 46)
	list[11]<-"numeric"
	list[17]<-"numeric"
	list[23]<-"numeric"
	
	
	df <- read.csv(data_dir, colClasses="character")
	##df <- read.csv(data_dir, na.strings="Not Available", stringsAsFactors=FALSE)
	
	
	num_cols<-c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
			"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
			"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
	
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
	##df <- transform(df, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia=as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
	
	if (missing(state)) {
		stop("invalid state")
	}
	
	if (missing(outcome)) {
		stop("invalid outcome")
	}
	
	idx_st <- c(df$State == state)
	state_df<- df[idx_st,]
	
	if (nrow(state_df) == 0)
	    stop("invalid state")
	
	
	col <- switch( tolower(outcome),
			"heart attack" = 11,
			"heart failure" = 17,
			"pneumonia" = 23)
	
	if (is.null(col))
		stop("invalid outcome")
	
	state_df<-state_df[,c(2,7,col)]
	##min_val<-min(state_df[,col])
	##idx_best <- state_df[col] == min_val
	##min_val<-min(as.numeric(as.character(state_df[,col])))
	##idx_best <- as.numeric(as.character(state_df[col])) == min_val
	##class(min_val)
	
	##out_df<-state_df[idx_best,]
	##out_df <- out_df[order(out_df$Hospital.Name, na.last=FALSE) , ]
	
	##state_df<-na.omit(state_df)
	##head(out_df)
	##out_df <- out_df[,order(out_df$Hospital.Name)]
	##class(out_df[1,]$Hospital.Name)
	##nrow(out_df)
	##c(out_df[,]$Hospital.Name)
	##as.character(out_df$Hospital.Name)
	##summary(out_df)
	##out_df$Hospital.Name
	##tmp_df <- state_df[order(col, na.last=FALSE)]
	##tmp_df$Hospital.Name
	state_df
	nrow(state_df)
}

