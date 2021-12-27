# run_analysis.R
#
# this is the end of course project for Getting and Cleaning Data.
# this script will accomplish the following tasks on data taken from
# 

# 1. Merges the training and the test sets to create one data set.
#
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
#
# 3. Uses descriptive activity names to name the activities in the data set
#
# 4. Appropriately labels the data set with descriptive variable names. 
#
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject.

# 0.1 SET UP - CLEAR UP WORKSPACE, SET DIRECTORY, LOAD dplyr LIBRARY

rm(list = ls())
setwd("/home/rich/Documents/programs/data_science/03_Getting_and_Cleaning_Data/Week_4/Project")
library(dplyr)

# 0.2 DOWNLOAD THE DATA

if(!file.exists("data")){dir.create("data")}
if(!file.exists("./data/raw_data.zip"))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./data/raw_data.zip")
  unzip(zipfile = "./data/raw_data.zip", exdir = "./data/unzipped")
}


# 0.3 LOAD THE DATA IN R
features <- read.table("./data/unzipped/UCI HAR Dataset/features.txt")
activityLabels = read.table("./data/unzipped/UCI HAR Dataset/activity_labels.txt")

x_train <- read.table("./data/unzipped/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/unzipped/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/unzipped/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./data/unzipped/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/unzipped/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/unzipped/UCI HAR Dataset/test/subject_test.txt")

# 0.4 NAME ALL OF THE COLUMNS IN THE DATA

colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activityLabels) <- c("activityID", "activityType")

# 1. MERGING THE DATA INTO ONE DATA SET

trainData <- cbind(y_train, subject_train, x_train)
testData <- cbind(y_test, subject_test, x_test)
mergedData <- rbind(trainData, testData)

# 2. SELECTING THE DATA COLUMNS FOR MEAN AND STANDARD DEVIATION
#    (AND THE subjectID and activityID)

keeperSubjectID <- grepl("subjectID", colnames(mergedData))
keeperActivityID <- grepl("activityID", colnames(mergedData))
keeperMean <- grepl("[m,M]ean", colnames(mergedData))
keeperStdDev <- grepl("[s,S]td", colnames(mergedData))
keeperAll = keeperSubjectID | keeperActivityID | keeperMean | keeperStdDev

meanAndStdDev <- mergedData[ , keeperAll == TRUE]

# 3. USE DESCRIPTIVE ACTIVITY NAMES FOR THE COLUMNS OF THE DATA SET

colnames(meanAndStdDev)<-gsub("^t", "Time", colnames(meanAndStdDev))
colnames(meanAndStdDev)<-gsub("^f", "Frequency", colnames(meanAndStdDev))
colnames(meanAndStdDev)<-gsub("Acc", "Accelerometer", colnames(meanAndStdDev))
colnames(meanAndStdDev)<-gsub("Gyro", "Gyroscope", colnames(meanAndStdDev))
colnames(meanAndStdDev)<-gsub("Mag", "Magnitude", colnames(meanAndStdDev))
colnames(meanAndStdDev)<-gsub("BodyBody", "Body", colnames(meanAndStdDev))

# 4. APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE NAMES
#   in # 0.4, features were applied as the data labels for both x and y data
#   in # 3, descriptive names replaced initials and abbreviations in the labels

# 5. FROM THE DATA SET IN # 4, CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH
#    THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT, AND
#    FINALLY, OUTPUT THE TIDY DATA SET INTO A TEXT FILE

tidySet <- aggregate(. ~subjectID + activityID, meanAndStdDev, mean)
tidySet <- arrange(tidySet, subjectID, activityID)

# in order for tidySet to be truly tidy, we need to replace the 
# activityId (just a number) with the corresponding label
# this function will return the name of an activity, given its ID
labelActivity <- function(activityID)
{
  if(activityID < 1 | activityID > 6)
  {
    return("NA")
  }
  else
  {
    as.character(activityLabels[activityID,2])
  }
}
for(i in 1:dim(tidySet)[1])
{
  tidySet[i,2] <- labelActivity(tidySet[i,2])
}
tidySet <- rename(tidySet, activity = activityID)
# save tidySet twice, once in the data folder, and once in the parent folder
# so that it is easy to find for later analysis

write.table(tidySet, "./data/tidySet.txt", row.names = FALSE)
write.table(tidySet, "./tidySet.txt", row.names = FALSE)
