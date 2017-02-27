# run_analysis.R
# February 25, 2017
# Week 4 Project

#setwd("/Users/Genomics/Data_Science_Classes/data_cleaning/data/UCI_HAR_Dataset/")
library(dplyr)

# Dependency: utility script
#source("/Users/Genomics/Data_Science_Classes/data_cleaning/week4/run_analysis_assoc.R")
source("./run_analysis_assoc.R")
#path <- "/Users/Genomics/Data_Science_Classes/data_cleaning/week4/UCI_HAR_Dataset"

# The obtained dataset has been randomly partitioned into two sets, 
# where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# 70% of the volunteers
# 2.8858451e-001 -2.0294171e-002 -1.3290514e-001 -9.9527860e-001 -9.8311061e-001 -9.1352645e-001 
# -9.9511208e-001 -9.8318457e-001 -9.2352702e-001 
train_data_file <- "/train/X_train.txt"
# 5
# 5 etc.
train_label_file <- "/train/y_train.txt"

# 30% of the volunteers
#  2.5717778e-001 -2.3285230e-002 -1.4653762e-002 -9.3840400e-001 -9.2009078e-001 -6.6768331e-001 -9.5250112e-001 -9.2524867e-001 
test_datafile <- "/test/X_test.txt"
test_labelfile <- "/test/y_test.txt"

# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
features_file <- "/features.txt"

# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
activity_labelfile <- "/activity_labels.txt"
 
# 1-30       
train_subject_file <- "/train/subject_train.txt"
# 1-24?
test_subject_file <- "/test/subject_test.txt"

# 1. Merges the training and the test sets to create one data set.
# data files
all_data <- mergeData(path, train_data_file,test_datafile)
# labels
all_labels <- mergeData(path, train_label_file,test_labelfile)
# subjects 
all_subjects <- mergeData(path,train_subject_file,test_subject_file)

#activity text labels
activity_labels = getActivity(path,activity_labelfile)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
cols <- extract_means_std(path,features_file)
cols_to_keep <- cols[[1]]
# select the given columns as needed
all_data <- all_data %>% select(cols_to_keep)

# 3. Uses descriptive activity names to name the activities in the data set
# change the integer labels with text labels
all_labels <- activity_labels[match(all_labels[,1],activity_labels[,1]),2]

# Combine observations and labels
all_set <- cbind(all_data,all_labels,all_subjects)

# 4. Appropriately labels the data set with descriptive variable names.
cols_names <- cols[[2]]
names(all_set) <-c(cols_names,"activity_label","subject")

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
avg <- all_set %>% group_by(activity_label,subject) %>% 
        summarize_all(funs(mean))

#print(avg)
write.table(avg,file = "avg.txt", row.name=FALSE)

