This is the Codebook for the final project in Coursera's Getting and 
Cleaning data class.

The goal is to create a tidy data set of the mean and standard deviations
from the Human Activity Recognition Using Smartphones Data Set.

** THE DATA **

The R script run_analysis.R will download the data:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
to the subfolder /data/ of the working directory, and unzip the data.  The data is from  experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The dataset is composed of the files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

** THE FILE run_analysis.R **

run_analysis.R will create a tidy data set, contained in the tidySet.txt file, that contains
the mean and standard deviations from the original data set for each subject and activity.  The tidy set is created in steps

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Use descriptive activity names to name the activities in the data set

4. Appropriately label the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.