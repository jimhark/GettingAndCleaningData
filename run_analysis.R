############################
##  Project
############################

# The requirements are:
#
#   1. Merges the training and the test sets to create one data set.
#
#   2. Extracts only the measurements on the mean and standard deviation for
#      each measurement.
#
#   3. Uses descriptive activity names to name the activities in the data set
#
#   4. Appropriately labels the data set with descriptive variable names.
#
#   5. From the data set in step 4, creates a second, independent tidy data set
#      with the average of each variable for each activity and each subject.
#
# I have marked code that's directly related to a requirement with a
# comment that contains a tag like "requirement #1" (of course the number
# varies). You can easily find these tags by searching for "requirement #".
#
# I have attacked these requirements using this overall approach:
#
#     A. Build a Data Frame with ALL the data.
#
#         a) If any future work is needed against this data I don't want to
#            ever have to look at the data format, I want to be able to start
#            with this data frame.
#
#         b) Create a data frame that meets the revelant project requirements
#
#             i. Appropriately label the data set with descriptive variable
#                names, and do it early. (requirement #4)
#
#             ii. Use descriptive activity names (requirement #3)
#
#             iii. Merges the training and the test sets (requirement #1)
#
#     B. Extract only mean and standard deviation measurements for each
#        observation. (requirement #2)
#
#     C. Create a tidy data set with the average of each variable for each
#        activity and each subject. (requirement #5)
#

# Data was retrieved using:
#
#   >wget --no-check-certificate https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip
#   unzip "UCI HAR Dataset.zip"
#
# Script requires working directory to be the data directory
#
# setwd("UCI HAR Dataset")


# Generates 'clean', descriptive names (implements requirement #4)
GetCleanNames <- function(features) {
    # create unique valid names from features
    uniqueFeatureNames <- make.names(features[,2], unique=TRUE)

    # Change sequence of multiple dots to single dot
    oneDotFeatureNames <- gsub("\\.+", ".", uniqueFeatureNames)

    # Remove any trailing dot
    cleanFeatureNames <- gsub("\\.$", "", oneDotFeatureNames)

    # Fix apparent name error where 'Body' appears twice
    cleanFeatureNames <- gsub("BodyBody", "Body", cleanFeatureNames, fixed=TRUE)

    # We could add additional name fix-ups here, if we wanted to expand
    # abbreviations # or change case, etc.

    # We now have usable names with a clear mapping to the source data
    # documentation which makes a good trade-off between usability (the names
    # are not too long to type) and readablility (the names are reasonably
    # clear, if not perfectly so). Longer descriptions can be found in the code
    # book (see CodeBook.md).

    cleanFeatureNames
}

# read data from a file and set data frame's variable names
#     setname is one of 'test' or 'train'
#     fileNameTag is one of "X", "Y", "subject"
#
GetData <- function(setname, fileNameTag, variableNames=fileNameTag) {
    path <- paste0(setname, "/", fileNameTag, "_", setname, ".txt")
    data <- read.table(path)
    names(data) <- variableNames
    data
}

# build Data Frame for given set ('test' or 'train')
GetActivityDataFrame <- function(setname, cleanVariableNames, activityLabels) {
    xData <- GetData(setname, "X", cleanVariableNames)
    subject <- GetData(setname, "subject")
    activity <- GetData(setname, "Y", "activity")

    # Activity is stored using numeric codes. Convert to factor so we can use
    # descriptive activity names (implements requirement #3)
    activity$activity <- factor(activity$activity,
        levels = 1:nrow(activityLabels),
        labels = activityLabels[,2])

    # combine activity, subject, and xData (in that order)
    activityDf <- cbind(activity, subject, xData)

    activityDf
}


# Test if string s contains term t. Terms are . separated.
HasTerm <- function(s, t) {
    rx <- paste0("(\\.|^)", t, "(\\.|$)")
    grepl(rx, s)
}


# Given the activityDf, select needed data. Currently we select
# columns for mean and standard deviation measurements (and keep
# the "activity" and "subject" labels) (implements requirement #2)
#
GetSelectData <- function(activityDf) {
    names <- names(activityDf)

    # measurements that are a function of std or mean
    selectedMeasurementCols <- HasTerm(names, "std") | HasTerm(names, "mean")

    # labels so we can analize the data later
    labelCols <- names %in% c("activity", "subject")

    selectedCols <- selectedMeasurementCols | labelCols

    selectActivityDf <- activityDf[, selectedCols]

    selectActivityDf
}

# Average each variable for each activity and each subject. (requirement #5)
#
GetAggregateActivity <- function(df) {

    # aggregate the data frame. We remove the labels becuase if we don't we
    # get a failure trying to calculate the 'mean' of the labels.
    adf <- with(df,
        aggregate(
            df[,c(-1,-2)],  # remove labels or they will be included
            by=list(activity, subject),
            FUN=mean
        )
    )

    # Tidy up the names (else default is "Group.1" and "Group.2")
    names(adf)[1:2] <- c("activity", "subject")

    # While we're tidying up, sort the dataset by 'activity' and 'subject'
    orderedAdf <- adf[order(adf$activity, adf$subject),]

    orderedAdf
}


# Activity Labels are: WALKING, STANDING, etc.
activityLabels <- read.table("activity_labels.txt")

# source of descriptive variable names (not directly usable)
features <- read.table("features.txt")
cleanVariableNames <- GetCleanNames(features)

activityTestDf <- GetActivityDataFrame("test", cleanVariableNames, activityLabels)
activityTrainDf <- GetActivityDataFrame("train", cleanVariableNames, activityLabels)

# combine the 'test' and 'train' data (final step of requirement #1)
activityDf <- rbind(activityTestDf, activityTrainDf)

# select columns for mean and standard deviation measurements
# (implements requirement #2)
selectActivityDf <- GetSelectData(activityDf)

# Average each variable for each activity and each subject. (requirement #5)
aggregateActivityDf <- GetAggregateActivity(selectActivityDf)

## Uncomment the following line if you wish to write the data
# write.table(aggregateActivityDf, "AggregateActivity.txt", row.name=FALSE)
