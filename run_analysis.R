# R Script

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

setwd("/home/rich/Documents/programs/data_science/03_Getting_and_Cleaning_Data/Week_4/Getting_and_Cleaning_Data_Project")
if(!file.exists("data")){dir.create("data")}
if(!file.exists("./data/raw_data.zip"))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./data/raw_data.zip")
  unzip(zipfile = "./data/raw_data.zip", exdir = "./unzipped")
}

