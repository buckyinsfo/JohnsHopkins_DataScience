# Week 2 Part 2 Programming Homework Assignment
# R programming
# Johns Hopkins Bloomberg School of Public Health
# by Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
# 
# Author: tim
# Function: complete
###############################################################################

complete <- function(directory, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
	
	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used
	
	## Return a data frame of the form:
	## id nobs
	## 1  117
	## 2  1041
	## ...
	## where 'id' is the monitor ID number and 'nobs' is the
	## number of complete cases
	
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
	
	## Extract the desired IDs into a separate dataframe object
	sub_df <- data.frame()
	for(j in 1:length(id)) {
		## Prepare our output data with id and number of casaes for each.
		col_1 <- c(id[j])
		col_2 <- c(length(which(df$ID == id[j])))
		
		new.row <- data.frame(col_1, col_2)
		names(new.row) <- c("id", "nobs")
        sub_df <- rbind(sub_df, new.row)	
	}
	
	##print(sub_df)
	return(sub_df)
}
