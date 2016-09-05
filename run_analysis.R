# Installs packages if needed

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("dplyr")) {
  install.packages("dplyr")
}

#loads required packages
library(data.table)
library(dplyr)

#Getting data from website
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "kproject.zip")
if(!file.exists("./projectdata")){dir.create("./projectdata")}
unzip(zipfile = "kproject.zip", exdir = "./projectdata")

#Getting the data into program
featureNames <- read.table("projectdata/UCI HAR Dataset/features.txt")
activityLabels <- read.table("projectdata/UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Reading training data
subjectTrain <- read.table("projectdata/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("projectdata/UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("projectdata/UCI HAR Dataset/train/X_train.txt", header = FALSE)

#Reading test data
subjectTest <- read.table("projectdata/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("projectdata/UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("projectdata/UCI HAR Dataset/test/X_test.txt", header = FALSE)

#merging training and tests
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#Naming the columns
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
MyCompleteData <- cbind(features,activity,subject)

#PART TWO(2)
#Extracts only the measurements on the mean and standard deviation for each measurement
#Extract the column indices that have either mean or std in them.

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(MyCompleteData), ignore.case=TRUE)
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
extractedData <- MyCompleteData[,requiredColumns]

#Part Three(3)
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)

#using more descriptive names
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

#Creating Tidy Data
#First, create subject as a factor variable for analysis

extractedData$Subject <- as.factor(extractedData$Subject)
NewExtractedData <- data.table(extractedData)
tidyData <- aggregate(. ~Subject + Activity, NewExtractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "./projectdata/Tidy.txt", row.names = FALSE)