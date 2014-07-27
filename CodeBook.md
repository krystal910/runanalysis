Code Book for Tidy Dataset
===========


## Experiment Background and Raw Data  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label 
the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data.   

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain. See 'features_info.txt' for more details.   

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


##Data Transformation and Processing   

The below original data files were loaded:   

  `subject_test.txt`  
  `x_test.txt`  
  `y_test.txt`  
  `subject_train.txt`  
  `x_train.txt`  
  `y_train.txt`  
  `features.txt`  
  `activity_labels.txt`  

Once the above files were loaded, a number of data transformations were carried out and these transformations formed the 
basis for the final tidy dataset: 

 - Generate a complete test dataset by combining the subject and activity data with the result data and adding the 
 column names
 - Generate a complete training dataset by combining the subject and activity data with the result data and adding the 
 column names
 - Merge the test and train dataset to create a full dataset
 - Only variables that were measurements on the mean and standard deviation were kept - all others were discarded
 - Activity IDs (1-6) were swapped for the activity name
 - Measurement names were changed from the default import value  
 
 
Using the data resulting from the above transformations, a summary dataset was created which contains the average 
feature value per subject and per activity.  


##Final Outputs  

There are two final output files.  Each files contains 68 columns (details below).  The difference between the two is: 

 - tidydata.txt - has 10,299 rows containing the mean and standard deviation results for each subject and  activity for 
 each repetition.
 - tidydata_means.txt - contains the average value for each measurement for each subject and activity - 180 rows, 6 per 
 subject.


Variable    |      Type    |      Detail
-------------------------------    |      -------------------------------    |      -------------------------------
subject    |      integer     |      1 - 30
activity    |      character    |      6 levels - LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
tGravityAcc-std()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-mean()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-mean()-X    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-std()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-mean()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyAccMag-mean()    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerkMag-mean()    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerkMag-mean()    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-mean()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-mean()-X    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-std()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-mean()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyAccMag-mean()    |      numeric     |      Min = -1, Max = 1 
fBodyBodyGyroMag-mean()    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-mean()-Z    |      numeric     |      Min = -1, Max = 1 
tGravityAcc-mean()-X    |      numeric     |      Min = -1, Max = 1 
tGravityAcc-std()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-std()-X    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-mean()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-std()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-std()-X    |      numeric     |      Min = -1, Max = 1 
tBodyAccMag-std()    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerkMag-std()    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerkMag-std()    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-std()-X    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-mean()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-std()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-std()-X    |      numeric     |      Min = -1, Max = 1 
fBodyAccMag-std()    |      numeric     |      Min = -1, Max = 1 
fBodyBodyGyroMag-std()    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-std()-X    |      numeric     |      Min = -1, Max = 1 
tGravityAcc-mean()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-mean()-X    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-std()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-mean()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-mean()-X    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-std()-Y    |      numeric     |      Min = -1, Max = 1 
tGravityAccMag-mean()    |      numeric     |      Min = -1, Max = 1 
tBodyGyroMag-mean()    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-mean()-X    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-std()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-mean()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-mean()-X    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-std()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyBodyAccJerkMag-mean()    |      numeric     |      Min = -1, Max = 1 
fBodyBodyGyroJerkMag-mean()    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-mean()-X    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-std()-Y    |      numeric     |      Min = -1, Max = 1 
tGravityAcc-mean()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-mean()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyAccJerk-std()-Z    |      numeric     |      Min = -1, Max = 1 
tBodyGyro-std()-X    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-mean()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyGyroJerk-std()-Z    |      numeric     |      Min = -1, Max = 1 
tGravityAccMag-std()    |      numeric     |      Min = -1, Max = 1 
tBodyGyroMag-std()    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-mean()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyAcc-std()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyAccJerk-std()-X    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-mean()-Y    |      numeric     |      Min = -1, Max = 1 
fBodyGyro-std()-Z    |      numeric     |      Min = -1, Max = 1 
fBodyBodyAccJerkMag-std()    |      numeric     |      Min = -1, Max = 1 
fBodyBodyGyroJerkMag-std()    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-mean()-Y    |      numeric     |      Min = -1, Max = 1 
tBodyAcc-std()-Z    |      numeric     |      Min = -1, Max = 1 
tGravityAcc-std()-X    |      numeric     |      Min = -1, Max = 1 


