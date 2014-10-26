GettingAndCleaningData
======================

Class Project for Coursera Getting and Cleaning Data course


The requirements are:

  1. Merges the training and the test sets to create one data set.

  2. Extracts only the measurements on the mean and standard deviation for
     each measurement.

  3. Uses descriptive activity names to name the activities in the data set

  4. Appropriately labels the data set with descriptive variable names.

  5. From the data set in step 4, creates a second, independent tidy data set
     with the average of each variable for each activity and each subject.

I have marked code that's directly related to a requirement with a
comment that contains a tag like "requirement #1" (of course the number
varies). You can easily find these tags by searching for "requirement #".

I have attacked these requirements using this overall approach:

    A. Build a Data Frame with ALL the data.

        a) If any future work is needed against this data I don't want to
           ever have to look at the data format, I want to be able to start
           with this data frame.

        b) Create a data frame that meets the revelant project requirements

            i. Appropriately label the data set with descriptive variable
               names, and do it early. (requirement #4)

            ii. Use descriptive activity names (requirement #3)

            iii. Merges the training and the test sets (requirement #1)

    B. Extract only mean and standard deviation measurements for each
       observation. (requirement #2)

    C. Create a tidy data set with the average of each variable for each
       activity and each subject. (requirement #5)
