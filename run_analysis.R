# Set Working Directory
setwd("C:/Gopal/Coursera/CleaningData/UCI HAR Dataset")

# Read the 561 Column Names from features.txt
features <- read.table("features.txt")

# train/X_train.txt': Training set, train/y_train.txt': Training labels.
trainingSet <- read.table("train/X_train.txt", col.names = features[, 2])
trainingLabels <- read.table("train/y_train.txt", col.names="Label")

# test/X_test.txt': Test set, test/y_test.txt': Test labels.
testSet <- read.table("test/X_test.txt", col.names = features[, 2])
testLabels <- read.table("test/y_test.txt", col.names = "Label")

# train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
trainingSubjects <- read.table("train/subject_train.txt", col.names = "Subjects")

# test/subject_test.txt
testSubjects <- read.table("test/subject_test.txt", col.names = "Subjects")

# Add the columns first for each set and then add rows to new set
fullDataSet <- rbind(cbind(trainingSubjects, trainingLabels, trainingSet), 
              cbind(testSubjects, testLabels, testSet))

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# Get the Columns than have Mean or Std in Column Names
colIndexes <- grepl("mean|std", features[, 2]);
mergedColIndexes <- c(TRUE, TRUE, colIndexes)
meanData <- fullDataSet[,mergedColIndexes]

# 3) Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("activity_labels.txt", col.names = c("ActivityID", "ActivityDesc"))
meanData$Label <- activityLabels[meanData$Label, 2]

# 4) Appropriately labels the data set with descriptive variable names.
names(meanData) <- gsub("^t", "time", names(meanData))
names(meanData) <- gsub("^f", "frequency", names(meanData))

# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(meanData, by = list(meanData[, "Subjects"], meanData[ , "Label"]), FUN=mean)
write.table(tidyData, file = "tidydata.txt", row.name=FALSE)
