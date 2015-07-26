# R_SamsungDataAnalysis
R Getting and Cleaning Data course project

The run_analysis.R file processes the UCI Samsung smartphone data which can be downloaded at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Information about this data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The run_analysis.R file needs to be put into your working directory and the smartphone data needs to be in this same folder.

Run the run_analysis.R file in R by typing source("run_analysis.R")

Running the script will output a new file called meanData.txt which contains the average of each variable for each activity and each subject

The steps accomplished in run_analysis are:

1) The first step is to load the activity_labels and set the column names to activityId and
description.

2) Next load the features and set the column names to featureId and featureName

3) Next read the xTest data and use the features featureName column to label the columns

4) Next read the yTest data and set the column name to activityId

5) Next read the subjectTest data and set the column name to subjectId

6) Next merge the yTest data and activity_labels data by using the activityId column name
to assign meaningful names to yTest activities

7) Now we use cbind to column bind the merged data from the previous step to the xTestData
and then we column bind the subjectTest data as well.

8) Next we repeat the above steps for the training data located in the train folder.

9) At this point we have two data frames containing the training and test data and we now
rbind (row bind) these together to form one data set and we convert to dplyr data frame
table

10) We are only interested in the mean and standard deviation recordings so we narrow our
feature selections down by using select to extract only those features.

11) Once we have our reduced features we want to tidy our data set down to the average 
of each variable for each activity and each subject so we group by the subjectId and
activity description and then pipe that into summarise and calculate the mean.

12) Finally the final tidy data set is written out to a text file called meanData.txt
