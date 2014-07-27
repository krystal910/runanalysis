README: run_analysis
===========
**Course Project for Getting and  Cleaning Data **

----

***The purpose of this readme file is to explain how the run_analysis.R script in this repo works.***  

The R script `run_analysis.R`  uses the working directory which should contain the source data collected from the Samsung Galaxy S smartphone.  A full description of this data is available on the original download site.  

This script also requires the following packages:

- `plyr`
- `reshape2`

**NOTE: The script has code to load the above packages but will error if they are not installed.  **

-----

###Source Data  
If the dataset has not already been downloaded and unzipped, code has been provided (currently commented out in the R script) that will download and unzip the files to the current working directory.

Once the source data is in the current working directory, the full `run_analysis.R` script can be executed.  Details of what this script does is in the next section.    

###Data Import
The first step that this script performs is to import the relevant datasets:
  
1. Test Data  
  subject_test.txt -  subject that performed the activity   
  x_test.txt - contains the test results for the test dataset  
  y_test.txt - activity that was performed   
  
2. Train Data  
  subject_train.txt - subject that performed the activity  
  x_train.txt - contains the test results for the training dataset   
  y_train.txt - activity that was performed     
  
3. Reference Data  
  features.txt - reference table for the name of the measurement in result dataset   
  activity_labels.txt - reference table for the name of the activity performed 


The above files are combined to form a full dataset that contains the named results, activity performed and subject. 

###Processing Data

After the import, the run_analysis.R script processess the full dataset and executes the following transformations: 

1. Extracts only the measurements on the mean and standard deviation for each measurement. 
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names. 

A second independant tidy dataset is then generated that contains the average of each variable for each activity 
and each subject:
  
Finally, this transformed data is written to a file called:  

1. tidydata.txt 
2. tidydata_means.txt 

----
