#Code Book for Tidy Dataset 

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


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

------

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

----

##Final Outputs  

The final tidy dataset is made up of 68 columns and just over 10,000 rows containing the mean and standard deviation 
results for each subject and activity for each repetition.  These measurements are:  

Variables               |                            |                              |                           
------------------------|----------------------------|------------------------------|---------------------------- 
subject                 |    activity                | tBodyAcc-mean()-X            |  tBodyAcc-mean()-Y          
tBodyAcc-mean()-Z       |    tBodyAcc-std()-X        | tBodyAcc-std()-Y             |  tBodyAcc-std()-Z           
tGravityAcc-mean()-X    |    tGravityAcc-mean()-Y    | tGravityAcc-mean()-Z         |  tGravityAcc-std()-X        
tGravityAcc-std()-Y     |    tGravityAcc-std()-Z     | tBodyAccJerk-mean()-X        |  tBodyAccJerk-mean()-Y      
tBodyAccJerk-mean()-Z   |    tBodyAccJerk-std()-X    | tBodyAccJerk-std()-Y         |  tBodyAccJerk-std()-Z       
tBodyGyro-mean()-X      |    tBodyGyro-mean()-Y      | tBodyGyro-mean()-Z           | tBodyGyro-std()-X          
tBodyGyro-std()-Y       |    tBodyGyro-std()-Z       | tBodyGyroJerk-mean()-X       | tBodyGyroJerk-mean()-Y     
tBodyGyroJerk-mean()-Z  |    tBodyGyroJerk-std()-X   | tBodyGyroJerk-std()-Y        | tBodyGyroJerk-std()-Z      
tBodyAccMag-mean()      |    tBodyAccMag-std()       | tGravityAccMag-mean()        | tGravityAccMag-std()       
tBodyAccJerkMag-mean()  |    tBodyAccJerkMag-std()   | tBodyGyroMag-mean()          | tBodyGyroMag-std()         
tBodyGyroJerkMag-mean() |    tBodyGyroJerkMag-std()  | fBodyAcc-mean()-X            | fBodyAcc-mean()-Y          
fBodyAcc-mean()-Z       |   fBodyAcc-std()-X         | fBodyAcc-std()-Y             | fBodyAcc-std()-Z           
fBodyAccJerk-mean()-X   |    fBodyAccJerk-mean()-Y   | fBodyAccJerk-mean()-Z        | fBodyAccJerk-std()-X       
fBodyAccJerk-std()-Y    |    fBodyAccJerk-std()-Z    | fBodyGyro-mean()-X           | fBodyGyro-mean()-Y         
fBodyGyro-mean()-Z      |    fBodyGyro-std()-X       | fBodyGyro-std()-Y            |  fBodyGyro-std()-Z          
fBodyAccMag-mean()      |    fBodyAccMag-std()       | fBodyBodyAccJerkMag-mean()   | fBodyBodyAccJerkMag-std()  
fBodyBodyGyroMag-mean() |    fBodyBodyGyroMag-std()  | fBodyBodyGyroJerkMag-mean()  | fBodyBodyGyroJerkMag-std() 


The final summary tidy dataset contains the same 68 columns above, however, it contains the average value for each 
measurement for each subject and activity - 180 rows, 6 per subject.  
