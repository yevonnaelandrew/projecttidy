CodeBook for "Getting and Cleaning Data Course Project"

Library Used: dplyr, tidyr

FROM UCI Dataset, picked only that used in this project:

features <- 'features.txt': List of all features.

activitylabels <- 'activity_labels.txt': Links the class labels with their activity name.

dataxtrain <- 'train/X_train.txt': Training set.

dataytrain <- 'train/y_train.txt': Training labels.

dataxtest <- 'test/X_test.txt': Test set.

dataytest <- 'test/y_test.txt': Test labels.

subjecttrain <- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

subjecttest <- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
