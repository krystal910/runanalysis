##   You should create one R script called run_analysis.R that does the following.

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject


## Download and unzip the data - can be uncommented if data has not been downloaded

  #fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #download.file(fileUrl, destfile = paste(c(getwd(),"/UCI_Dataset.zip"),collapse=""), method = "curl")
  #unzip(paste(c(getwd(),"/UCI_Dataset.zip"),collapse=""),exdir = paste(c(getwd()),collapse=""))


library(plyr)
library(reshape2)

## Step 1 - Loading and Merging the datasets

  ## Load labels

  labels <- read.table(paste(c(getwd(),"/UCI HAR Dataset/activity_labels.txt"),collapse=""))
  features <- read.table(paste(c(getwd(),"/UCI HAR Dataset/features.txt"),collapse=""))


  ##Add column names

  colnames(labels) = c("activity_id","activity")
  colnames(features) = c("feature_id","features")


  ## Load test data files

  subject_test <- read.table(paste(c(getwd(),"/UCI HAR Dataset/test/subject_test.txt"),collapse=""))
  x_test <- read.table(paste(c(getwd(),"/UCI HAR Dataset/test/x_test.txt"),collapse=""))
  y_test <- read.table(paste(c(getwd(),"/UCI HAR Dataset/test/y_test.txt"),collapse=""))

  ##Add column names

  colnames(x_test) <- features[,2]
  colnames(y_test) <- "activity"
  colnames(subject_test) <- "subject"


  ##Combine test datasets

  test_data <- cbind(subject_test, y_test, x_test)


  ## Load train data files

  subject_train <- read.table(paste(c(getwd(),"/UCI HAR Dataset/train/subject_train.txt"),collapse=""))
  x_train <- read.table(paste(c(getwd(),"/UCI HAR Dataset/train/x_train.txt"),collapse=""))
  y_train <- read.table(paste(c(getwd(),"/UCI HAR Dataset/train/y_train.txt"),collapse=""))

  ##Add column names

  colnames(x_train) <- features[,2]
  colnames(y_train) <- "activity"
  colnames(subject_train) <- "subject"


  ##Combine train datasets

  train_data <- cbind(subject_train, y_train, x_train)


  ##Merge train and test sets

  full_data <- rbind(test_data,train_data)


## Step 2 - Extract only the measurements on the mean and standard deviation for each measurement.

  ## Search for column names containing mean() and std()

  subset <- cbind(full_data[1:2],full_data[ , grepl( "mean\\(\\)|std\\(\\)" , names(full_data), ignore.case=TRUE)])


## Step 3 - Uses descriptive activity names to name the activities in the data set

  ## Swap activity id for activity name

  for (i in 1:nlevels(labels$activity))
  {
    subset$activity <- gsub(i, as.character(labels$activity[[i]]), subset$activity)
  }

## Step 4 - Appropriately labels the data set with descriptive variable names.

  ## Column labels were added to the merged dataset in step 1

## Step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject

  ## Melt the dataset by subject and activity

  melt_data <- melt(subset, id=c("subject","activity"),measure.vars=names(subset[3:68]))

  ## Generate dataset containing mean for each activity and subject

  melt_means <- dcast(melt_data, subject+activity ~ variable,mean)


## Final Outputs

  write.table(subset, file = paste(c(getwd(),"/tidydata.txt"),collapse=""), sep=",")
  write.table(melt_means, file = paste(c(getwd(),"/tidydata_means.txt"),collapse=""), sep=",")


