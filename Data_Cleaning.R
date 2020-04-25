## Load dplyr package
library(dplyr)

## Download dataset and unzip it
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

## unzip dataset
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Read files
## Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Reading feature vector and activity lables:
features <- read.table('./data/UCI HAR Dataset/features.txt')
activitylabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Rename the files
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activitylabels) <- c('activityId','activityType')

## 1.Merge data
train <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)
alldata<- rbind(train,test)

## Remove used raw data to save memory 
rm(y_train, subject_train, x_train,y_test, subject_test, x_test,train,test)

## 2.Extract measurements
selection <- grepl("activityId|subjectId|mean|std",colnames(alldata))
set <- alldata[, selection]

## 3.Uses descriptive activity names 
set$activityId <- factor(set$activityId,levels=activitylabels[,1],labels=activitylabels[,2])

## 4.Lables data set with descriptive variable
setname <- colnames(set)

setname <- gsub("[\\(\\)-]", "", setname)
setname <- gsub("^f", "frequencyDomain", setname)
setname <- gsub("^t", "timeDomain", setname)
setname <- gsub("Acc", "Accelerometer", setname)
setname <- gsub("Gyro", "Gyroscope", setname)
setname <- gsub("Mag", "Magnitude", setname)
setname <- gsub("Freq", "Frequency", setname)
setname <- gsub("mean", "Mean", setname )
setname <- gsub("std", "StandardDeviation", setname)
setname <- gsub("BodyBody", "Body", setname)
colnames(set) <- setname

## Create first merged tidy data 
write.table(set, "merged_data_1.txt",row.names = FALSE)

## 5.Create second clean tidy data set
setwithmean <- set %>% group_by(subjectId, activityId) %>%summarise_each(funs(mean))
setwithmean <- setwithmean[order(setwithmean$subjectId,setwithmean$activityId),]

write.table(setwithmean, "Mean_data_2.txt",row.names = FALSE)
