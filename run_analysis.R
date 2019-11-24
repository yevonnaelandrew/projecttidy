library(dplyr)
library(tidyr)

# Merges the training and the test sets to create one data set.

features <- read.table("features.txt")
features <- as.character(features$V2)

dataxtest <- read.table("./test/X_test.txt")
dataytest <- read.table("./test/y_test.txt")
subjecttest <- read.table("./test/subject_test.txt")
wholetest <- cbind(subjecttest,dataytest,dataxtest)
colnames(wholetest) <- c("Subject", "Label", features)

dataxtrain <- read.table("./train/X_train.txt")
dataytrain <- read.table("./train/y_train.txt")
subjecttrain <- read.table("./train/subject_train.txt")
wholetrain <- cbind(subjecttrain,dataytrain,dataxtrain)
colnames(wholetrain) <- c("Subject", "Label", features)

whole <- rbind(wholetest, wholetrain)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
wantpattern <- grepl("mean|std", colnames(whole))
wantwhole <- cbind(whole[,1:2], whole[wantpattern])

#Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table("activity_labels.txt")
for (lab in 1:6) {
  wantwhole$Label <- gsub(lab, activitylabels[lab, 2], wantwhole$Label)
  lab = lab + 1
}

#Appropriately labels the data set with descriptive variable names. 
#Already done above

#Creates a second, independent tidy data set with the
##average of each variable for each activity and each subject.
wantgrouped <- wantwhole %>%
  group_by(Label, Subject) %>%
  summarise_all(list(mean))

wantgroupedtidy <- wantgrouped %>%
  gather("tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-meanFreq()", key = "VARIABLE", value  = "AVG OF VARIABLE")

write.table(wantgroupedtidy, file = "final.txt", row.names = FALSE)