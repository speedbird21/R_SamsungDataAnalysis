rm(list=ls())

library(plyr);
library(dplyr);
library(tidyr);
library(reshape);
library(data.table);

activity_labels<-read.table("activity_labels.txt", col.names = c("activityId", "description"))
features<-read.table("features.txt", col.names = c("featureId", "featureName"))

xTest<-read.table("./test/X_test.txt", col.names = features$featureName)
yTest<-read.table("./test/Y_test.txt", col.names = c("activityId"))
subjectTest<-read.table("./test/subject_test.txt", col.names = c("subjectId"))

testData <-merge(yTest, activity_labels, by.X="activityId", by.Y="activityId")
testData <-cbind(testData,xTest)
testData <-cbind(subjectTest, testData)

rm(xTest)
rm(yTest)
rm(subjectTest)

xTrain<-read.table("./train/X_train.txt", col.names = features$featureName)
yTrain<-read.table("./train/Y_train.txt", col.names = c("activityId"))
subjectTrain<-read.table("./train/subject_train.txt", col.names = c("subjectId"))

trainData <-merge(yTrain, activity_labels, by.X="activityId", by.Y="activityId")
trainData <-cbind(trainData,xTrain)
trainData <-cbind(subjectTrain, trainData)

rm(xTrain)
rm(yTrain)
rm(subjectTrain)

allData<-tbl_df(rbind(testData, trainData))

rm(testData)
rm(trainData)

nData<-select(allData, subjectId, description, contains("Mean"), contains("std"), -starts_with("angle"))

finalData<- nData %>% group_by(subjectId, description) %>% summarise_each(funs(mean))
write.table(finalData, file="meanData.txt", row.names = FALSE)