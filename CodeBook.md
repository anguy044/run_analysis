Link to dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description of data set: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R Script, Run_Analysis.R performs the following functions:

1) Merging the training and test sets to create a new set by reading in the files from the source and collumn binding the data based on type. I.E Test variables or Train varialbes. 
  test variables: X_test.txt, Y_test.txt, subject_test.txt
  train variables: X_train.txt, Y_train.txt, subject_train.txt

2) Extracts the mean and standard deviation information from the set using the grep command. 

3) Reading in the activity labels from activity_labels.txt and associating them with the dataset. 
  walking, walkingupstars, walkingdownstairs,sitting, standing, laying
  
4) Label the data set with descriptive names. Afterwards merges the information into 1 dataset that includes all test and train variables as well as descriptive names. 

5) Create a second data set with the average of each measurement for each acitivity and each subject and returns it as tidy_data.txt file. 


The Collumns in the dataset are: 
ActivityName
SubjectID
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagMean
fBodyAccMagStd
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd
