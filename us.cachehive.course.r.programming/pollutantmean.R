# Week 2 Part 1 Programming Homework Assignment
# R programming : Add comment
# Johns Hopkins Bloomberg School of Public Health
# by Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
# 
# Author: tim
# Function: pollutantmean
###############################################################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
	
	## 'pollutant' is a character vector of length 1 indicating
	## the name of the pollutant for which we will calculate the
	## mean; either "sulfate" or "nitrate".
	
	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used
	
	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	## NOTE: Do not round the result!
	#directory<-"specdata"
	
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

	## Extract the desired IDs into a separate dataframe object
	sub_df <- data.frame()
	for(j in 1:length(id)) {
		idx = df["ID"] == id[j]
		sub_df <- rbind(sub_df, df[idx,])	
	}
	
	## Perform the mean calculation on the specified pollutant
	s<-colMeans(sub_df[c(pollutant)], na.rm=TRUE)
	return(s)
}
