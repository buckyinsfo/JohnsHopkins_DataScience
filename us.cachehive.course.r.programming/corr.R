# Week 2 Part 3 Programming Homework Assignment
# R programming : Add comment
# Johns Hopkins Bloomberg School of Public Health
# by Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
# 
# Author: tim
# Function: corr
###############################################################################

corr <- function(directory, threshold = 0) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
	
	## 'threshold' is a numeric vector of length 1 indicating the
	## number of completely observed observations (on all
	## variables) required to compute the correlation between
	## nitrate and sulfate; the default is 0
	
	## Return a numeric vector of correlations
	## NOTE: Do not round the result!a
	
	## data sub-directory
	data_dir<-c("./data/")
	##data_dir <- c("")
	
	## Get the list of files
	data_dir <- paste(data_dir, directory, sep="")
	files <- list.files(data_dir, full.names=TRUE)
	
	## Read the data files into a dataframe object
	df <- data.frame()
	for (i in 1:length(files)) { 
		df <- rbind(df, read.csv(files[i]))
	}
	
	#Remove incomplete cases.
	df <- na.omit(df)
	
	## Extract the IDs into a separate dataframe object.
	## Test to see if there are the minimum threshold 
	## number of samples and perform cor() method.
	id <- c(1:length(files))
	cr <- vector()
	for(j in 1:length(id)) {
		idx = df["ID"] == id[j]
		tmp_df<- df[idx,]
		
		if ( nrow(tmp_df) >= threshold[1]) {
			cr <- append(cr, cor( tmp_df$sulfate, tmp_df$nitrate) )
	    } 
		
		if(length(cr) == 0) {
			cr <- integer()
	    }
	}
	
	return(cr)
}