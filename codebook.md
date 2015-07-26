#Codebook for smartphone data analysis

The following files are required by the run_analysis.R script:

activity_labels.txt - contains the description of the activities recorded
features.txt - contains descriptions of all the features captured

There are two sub folders, test and train each containing subject data, and X and Y data.

Under test and train there is also an Inertial Signals folder that is not required for
this analysis.

The first step is to load the activity_labels and set the column names to activityId and
description.

Next load the features and set the column names to featureId and featureName

Next read the xTest data and use the features featureName column to label the columns

Next read the yTest data and set the column name to activityId

Next read the subjectTest data and set the column name to subjectId

Next merge the yTest data and activity_labels data by using the activityId column name
to assign meaningful names to yTest activities

Now we use cbind to column bind the merged data from the previous step to the xTestData
and then we column bind the subjectTest data as well.

Next we repeat the above steps for the training data located in the train folder.

At this point we have two data frames containing the training and test data and we now
rbind (row bind) these together to form one data set and we convert to dplyr data frame
table

We are only interested in the mean and standard deviation recordings so we narrow our
feature selections down by using select to extract only those features.

Once we have our reduced features we want to tidy our data set down to the average 
of each variable for each activity and each subject so we group by the subjectId and
activity description and then pipe that into summarise and calculate the mean.

Finally the final tidy data set is written out to a text file called meanData.txt

The final variables in the data set are:

subjectId = id of the subject
description = activity description

###The following are the mean and standard deviation measurement variables from the original data features
tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyAccMag.mean..
tGravityAccMag.mean..
tBodyAccJerkMag.mean..
tBodyGyroMag.mean..
tBodyGyroJerkMag.mean..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.meanFreq...X
fBodyAcc.meanFreq...Y
fBodyAcc.meanFreq...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..
fBodyAccMag.meanFreq..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.meanFreq..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.meanFreq..
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.std..
tGravityAccMag.std..
tBodyAccJerkMag.std..
tBodyGyroMag.std..
tBodyGyroJerkMag.std..
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.std..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.std..
