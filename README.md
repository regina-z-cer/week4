README
-------
Writtern for Week 4 project 
February 2017

How to run: source("./week4/run_analysis.R")

Main script: run_analysis.R
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Dependency script:run_analysis_assoc.R
- is a script needed by the main script: run_analysis.R
- contains 3 functions: mergeData, extract_means_std, and 

Data used:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
