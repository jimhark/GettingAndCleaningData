The source data is from UCI's Machine Learning Repository

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The data transformations are fully defined in the run_analysis.R script.

Only mean and standard deviation measurement columns are selectd.
Data is grouped by Activity and Subject and the aggregated mean are presented.

Note: Only aggregated mean are presented in the table.

Names have been somewhat simplified from their original form:

    Special characters have been replaced with '.'
    Multiple '.' characters have been replaced by a single '.'
    Any trailing '.' characters have been removed

One corection has been made to the names. Some of the original feature names have
BodyBody instead of Body:

    516 fBodyBodyAccJerkMag-mean()
    517 fBodyBodyAccJerkMag-std()
    518 fBodyBodyAccJerkMag-mad()
    ...

This has been corrected to a single 'Body'.

The final field names are:

    activity
    subject
    tBodyAcc.mean.X
    tBodyAcc.mean.Y
    tBodyAcc.mean.Z
    tBodyAcc.std.X
    tBodyAcc.std.Y
    tBodyAcc.std.Z
    tGravityAcc.mean.X
    tGravityAcc.mean.Y
    tGravityAcc.mean.Z
    tGravityAcc.std.X
    tGravityAcc.std.Y
    tGravityAcc.std.Z
    tBodyAccJerk.mean.X
    tBodyAccJerk.mean.Y
    tBodyAccJerk.mean.Z
    tBodyAccJerk.std.X
    tBodyAccJerk.std.Y
    tBodyAccJerk.std.Z
    tBodyGyro.mean.X
    tBodyGyro.mean.Y
    tBodyGyro.mean.Z
    tBodyGyro.std.X
    tBodyGyro.std.Y
    tBodyGyro.std.Z
    tBodyGyroJerk.mean.X
    tBodyGyroJerk.mean.Y
    tBodyGyroJerk.mean.Z
    tBodyGyroJerk.std.X
    tBodyGyroJerk.std.Y
    tBodyGyroJerk.std.Z
    tBodyAccMag.mean
    tBodyAccMag.std
    tGravityAccMag.mean
    tGravityAccMag.std
    tBodyAccJerkMag.mean
    tBodyAccJerkMag.std
    tBodyGyroMag.mean
    tBodyGyroMag.std
    tBodyGyroJerkMag.mean
    tBodyGyroJerkMag.std
    fBodyAcc.mean.X
    fBodyAcc.mean.Y
    fBodyAcc.mean.Z
    fBodyAcc.std.X
    fBodyAcc.std.Y
    fBodyAcc.std.Z
    fBodyAccJerk.mean.X
    fBodyAccJerk.mean.Y
    fBodyAccJerk.mean.Z
    fBodyAccJerk.std.X
    fBodyAccJerk.std.Y
    fBodyAccJerk.std.Z
    fBodyGyro.mean.X
    fBodyGyro.mean.Y
    fBodyGyro.mean.Z
    fBodyGyro.std.X
    fBodyGyro.std.Y
    fBodyGyro.std.Z
    fBodyAccMag.mean
    fBodyAccMag.std
    fBodyAccJerkMag.mean
    fBodyAccJerkMag.std
    fBodyGyroMag.mean
    fBodyGyroMag.std
    fBodyGyroJerkMag.mean
    fBodyGyroJerkMag.std

