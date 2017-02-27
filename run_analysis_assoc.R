# run_analysis_assoc.R
# February  2017
# Week 4 Project - associated R script that helps the main script run_analysis.R

# Read two specified files,merge and return them
mergeData <- function(path, file1, file2){
        # file paths
        file1_path <- file.path(path,file1)
        file2_path <- file.path(path,file2)
        
        # training data1, test data2
        data1 = data2 = NULL
        data1 <- read.table(file1_path )
        #print(data1)
        data2 <- read.table(file2_path)  
        #print(data2)
        rbind(data1,data2)
}   

# Extracts only the measurements on the mean and standard deviation for each measurement
extract_means_std <- function(path,features_file){
        fullpath_feature_file <- file.path(path,features_file) 
        features <- read.table(fullpath_feature_file)
        #3     3                    tBodyAcc-mean()-Z
        #4     4                     tBodyAcc-std()-X
        colNum <-grep("mean|std",features[,2])
        colNames <- grep("mean|std",features[,2],value = TRUE) #fBodyBodyGyroJerkMag-meanFreq()
        colNames <- gsub("[()-]","",col_names) #fBodyBodyGyroJerkMagmeanFreq
        list("col_numbers"=colNum,"col_names"=colNames)
}

# Get activities: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
getActivity <- function(path, activity_file){
        actFilePath <- file.path(path,activity_file)  
        acts <- read.table(actFilePath)
        #print(acts)    
}