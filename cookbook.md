Description of variables:
========================
A. run_analysis.R
- train_data_file: file containing data of 70% of the volunteers
- train_label_file: file containing labels for training dataset
- test_datafile: file containing data of 30% the volunteers
- test_labelfile: file containing labels for test datasets
- feature_file: file containing features such as mean and standard deviation
- activity_labelfile: file containing labels for 6 activities such as walking, walking_upstairs, walking_downstairs,sitting, standing and laying

- train_subject_file: subject numbers (1-30) for training
- test_subject_file: subject numbers (1-24) for test
- all_data: merged data for both training and test subjects
- all_labels: merged labels for both training and test subjects
- all_subjects: merged subjects for both training and test subjects 
- activity_labels: = getActivity(path,activity_labelfile)

Description of functions:
=========================
B. run_analysis_assoc.R
- "mergeData" merges file1 and file2 in the specified path using "rbind"   
- "extract_means_std" extracts the mean and stdev for each measurement
- "getActivity" obtains six types of activities: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
