This is the Codebook for the final project in Coursera's Getting and 
Cleaning data class.

The goal is to create a tidy data set of the mean and standard deviations
from the Human Activity Recognition Using Smartphones Data Set.

** THE DATA **

The R script run_analysis.R will download the data:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
to the subfolder /data/ of the working directory, and unzip the data.  The data is from  experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The dataset is composed of the files:
- './data/features_info.txt': Shows information about the variables used on the feature vector.
- './data/unzipped/UCI HAR Dataset/features.txt': List of all features.
- './data/unzipped/UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.
- './data/unzipped/UCI HAR Dataset/train/X_train.txt': Training set.
- './data/unzipped/UCI HAR Dataset/train/y_train.txt': Training labels.
- './data/unzipped/UCI HAR Dataset/test/X_test.txt': Test set.
- './data/unzipped/UCI HAR Dataset/test/y_test.txt': Test labels.

The data in the tidy data set:

subjectID

activity
TimeBodyAccelerometer-mean()-X
TimeBodyAccelerometer-mean()-Y
TimeBodyAccelerometer-mean()-Z
TimeBodyAccelerometer-std()-X
TimeBodyAccelerometer-std()-Y
TimeBodyAccelerometer-std()-Z
TimeGravityAccelerometer-mean()-X
TimeGravityAccelerometer-mean()-Y
TimeGravityAccelerometer-mean()-Z
TimeGravityAccelerometer-std()-X
TimeGravityAccelerometer-std()-Y
TimeGravityAccelerometer-std()-Z
TimeBodyAccelerometerJerk-mean()-X
TimeBodyAccelerometerJerk-mean()-Y
TimeBodyAccelerometerJerk-mean()-Z
TimeBodyAccelerometerJerk-std()-X
TimeBodyAccelerometerJerk-std()-Y
TimeBodyAccelerometerJerk-std()-Z
TimeBodyGyroscope-mean()-X
TimeBodyGyroscope-mean()-Y
TimeBodyGyroscope-mean()-Z
TimeBodyGyroscope-std()-X
TimeBodyGyroscope-std()-Y
TimeBodyGyroscope-std()-Z
TimeBodyGyroscopeJerk-mean()-X
TimeBodyGyroscopeJerk-mean()-Y
TimeBodyGyroscopeJerk-mean()-Z
TimeBodyGyroscopeJerk-std()-X
TimeBodyGyroscopeJerk-std()-Y
TimeBodyGyroscopeJerk-std()-Z
TimeBodyAccelerometerMagnitude-mean()
TimeBodyAccelerometerMagnitude-std()
TimeGravityAccelerometerMagnitude-mean()
TimeGravityAccelerometerMagnitude-std()
TimeBodyAccelerometerJerkMagnitude-mean()
TimeBodyAccelerometerJerkMagnitude-std()
TimeBodyGyroscopeMagnitude-mean()
TimeBodyGyroscopeMagnitude-std()
TimeBodyGyroscopeJerkMagnitude-mean()
TimeBodyGyroscopeJerkMagnitude-std()
FrequencyBodyAccelerometer-mean()-X
FrequencyBodyAccelerometer-mean()-Y
FrequencyBodyAccelerometer-mean()-Z
FrequencyBodyAccelerometer-std()-X
FrequencyBodyAccelerometer-std()-Y
FrequencyBodyAccelerometer-std()-Z
FrequencyBodyAccelerometer-meanFreq()-X
FrequencyBodyAccelerometer-meanFreq()-Y
FrequencyBodyAccelerometer-meanFreq()-Z
FrequencyBodyAccelerometerJerk-mean()-X
FrequencyBodyAccelerometerJerk-mean()-Y
FrequencyBodyAccelerometerJerk-mean()-Z
FrequencyBodyAccelerometerJerk-std()-X
FrequencyBodyAccelerometerJerk-std()-Y
FrequencyBodyAccelerometerJerk-std()-Z
FrequencyBodyAccelerometerJerk-meanFreq()-X
FrequencyBodyAccelerometerJerk-meanFreq()-Y
FrequencyBodyAccelerometerJerk-meanFreq()-Z
FrequencyBodyGyroscope-mean()-X
FrequencyBodyGyroscope-mean()-Y
FrequencyBodyGyroscope-mean()-Z
FrequencyBodyGyroscope-std()-X
FrequencyBodyGyroscope-std()-Y
FrequencyBodyGyroscope-std()-Z
FrequencyBodyGyroscope-meanFreq()-X
FrequencyBodyGyroscope-meanFreq()-Y
FrequencyBodyGyroscope-meanFreq()-Z
FrequencyBodyAccelerometerMagnitude-mean()
FrequencyBodyAccelerometerMagnitude-std()
FrequencyBodyAccelerometerMagnitude-meanFreq()
FrequencyBodyAccelerometerJerkMagnitude-mean()
FrequencyBodyAccelerometerJerkMagnitude-std()
FrequencyBodyAccelerometerJerkMagnitude-meanFreq()
FrequencyBodyGyroscopeMagnitude-mean()
FrequencyBodyGyroscopeMagnitude-std()
FrequencyBodyGyroscopeMagnitude-meanFreq()
FrequencyBodyGyroscopeJerkMagnitude-mean()
FrequencyBodyGyroscopeJerkMagnitude-std()
FrequencyBodyGyroscopeJerkMagnitude-meanFreq()
angle(tBodyAccelerometerMean,gravity)
angle(tBodyAccelerometerJerkMean),gravityMean)
angle(tBodyGyroscopeMean,gravityMean)
angle(tBodyGyroscopeJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)


** THE FILE run_analysis.R **

run_analysis.R will create a tidy data set, contained in the tidySet.txt file, that contains
the mean and standard deviations from the original data set for each subject and activity.  The tidy set is created in steps

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Use descriptive activity names to name the activities in the data set

4. Appropriately label the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.