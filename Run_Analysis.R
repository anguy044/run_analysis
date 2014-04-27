## This program uses the collection of data from the accelerometers from the Samsung
## Galaxy S smartphone, obtained from the website:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## The dataset used for the project is:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

library(data.table)

## setting working directory, used for my personal testing. 
## setwd("C:/Users/Andrew/Desktop/DataScience/Getting and Cleaning Data/Peer Assignment 1")


## Part 1:
## merging the training and the test sets to create one data set

## Reading in test tables
testX <- read.table("./UCI_HAR_Dataset/test/X_test.txt",header=FALSE)
testY <- read.table("./UCI_HAR_Dataset/test/y_test.txt",header=FALSE)
testSub <- read.table("./UCI_HAR_Dataset/test/subject_test.txt",header=FALSE)

## Reading in train tables
trainX <- read.table("./UCI_HAR_Dataset/train/X_train.txt",header=FALSE)
trainY <- read.table("./UCI_HAR_Dataset/train/y_train.txt",header=FALSE)
trainSub <- read.table("./UCI_HAR_Dataset/train/subject_train.txt",header=FALSE)

## Merging test and train data
## NOTE: Will re-bind X, Y, and Subject later on as unsure if the assignment
## will allow combining all of the data later on in the code or if it has to be 
## done in part 1. 
## Combining data with all labels is done in part 4. 
X <- cbind(testX, testY)
X <- cbind(X, testSub)

Y <- cbind(trainX, trainY)
Y <- cbind(Y, trainSub)

XY <- rbind(X,Y)


##
## ------------------------------------------------------
##

## Part 2:
## Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI_HAR_Dataset/features.txt",header=FALSE)
meansd <- grep("-mean\\(\\)|-std\\(\\)", features[,2])

## Creating subset that contains mean and sd
Xms <- X[,meansd]

names(X) <- features[meansd, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


##
## ------------------------------------------------------
##

## Part 3:
## Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI_HAR_Dataset/activity_labels.txt",header=FALSE)
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[,1],2]
names(Y) <- "Activity"


##
## ------------------------------------------------------
##

## Part 4:
## Appropriately labels the data set with descriptive activity names. 
features <- read.table("./UCI_HAR_Dataset/features.txt",header=FALSE)
colnames(testX)<-features$V2
colnames(testY)<-c("Activity")
colnames(testSub)<-c("Subject")

colnames(trainX)<-features$V2
colnames(trainY)<-c("Activity")
colnames(trainSub)<-c("Subject")

## re-combining all data with all appropriate labels. 
newX <- cbind(testX, testY)
newX <- cbind(newX, testSub)

newY <- cbind(trainX, trainY)
newY <- cbind(newY, trainSub)

dataSet <- rbind(newX, newY)


##
## ------------------------------------------------------
##

## Part 5:
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

table <- data.table(dataSet)
tidyData <- table[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidyData, "tidy_data.txt")



