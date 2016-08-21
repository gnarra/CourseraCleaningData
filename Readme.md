# Getting and Cleaning Data Course Project

run_analysis.R assignment

You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is created in working directory with the name of tidyData.txt

## run_analysis.R Explanation

* It firsts sets the working directory to the directory that has the samsung data downloaded.

* It reads all the column names from "features.txt" file

* It reads the training data ( X_train.txt, y_train.txt). This method uses the column names that have been read from "features.txt"

* It reads the test data ( X_test.txt, y_test.txt). This method uses the column names that have been read from "features.txt"

* It reads all training subject data observations from "subject_train.txt" file

* It reads all test subject data observations from "subject_test.txt" file

* Step 1 from Assignment, it merges the training and test data using cbind and rbind functions.

* The script then finds all the columns that have "mean" or "std" in their names and returned as a Logical vector.

* The script then creates a column vector by adding two columns ("Subject", "Label") to the matched column Indexes from above step.

* The full merged data is then subsetted on the columns that have TRUE (mean and std columns) and teh resulting data is stored in meanData.

* The activity file is read into activityLabels which contains columns "ActivityID" and "ActivityDesc"

* The "Label" column in meanData is updated to match the activity description.

* The column names are expanded to spell put the "time" and "frequency" for shortcuts such as "^t" and "^f". The rest of the variables are self explanatory

* The script then calculates the average for each activity and each subject. This value is stored into tidyData and is written to todydata.txt file.

Note: the R script is built to run once the workign directory is set.
