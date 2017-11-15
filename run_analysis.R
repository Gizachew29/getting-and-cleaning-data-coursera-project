#Loading packages
library(data.table)
library(plyr)

#Checking if zip and directory exist, if not downloads and then unzips
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./dataset.zip")) {
    download.file(url, "dataset.zip", method = "curl")
}
if (!file.exists("./UCI HAR Dataset")) {
    unzip("dataset.zip")
}

#Date downloaded: "2017-11-14"
date_downloaded <- Sys.Date()

#Reading all files in "UCI HAR Dataset"
filepath <- "./UCI HAR Dataset/"

activity_labels <- fread(paste(filepath,"activity_labels.txt", sep = ""))
features <- fread(paste(filepath, "features.txt", sep = ""))

X_train <- fread(paste(filepath,"train/","X_train.txt", sep = ""))
y_train <- fread(paste(filepath,"train/","y_train.txt", sep = ""))
subject_train <- fread(paste(filepath,"train/","subject_train.txt", sep = ""))

X_test <- fread(paste(filepath,"test/","X_test.txt", sep = ""))
y_test <- fread(paste(filepath,"test/","y_test.txt", sep = ""))
subject_test <-fread(paste(filepath,"test/","subject_test.txt", sep = ""))

#Merging the "X" "Y" "Subject"
merged_X <- rbind(X_train,X_test)
merged_y <- rbind(y_train,y_test)
merged_subject <- rbind(subject_train, subject_test)

#Setting names
names(merged_y) <- "activity"
names(merged_X) <- features$V2
names(merged_subject) <- "subjectId"

#Merging final Dataset with only the mean and std feactures selected
merged_dataset <- cbind(merged_X,merged_y,merged_subject)

features_wanted <- features$V2[grep("(mean|std)\\(\\)",features$V2)]
features_wanted <- c(features_wanted,"activity","subjectId")

final_data <- subset(merged_dataset, select = features_wanted)

#Updating correct values for activity
final_data$activity <- activity_labels[final_data$activity, 2]

#Giving appropriate labels to columns
names(final_data) <- gsub("^t", "time", names(final_data))
names(final_data) <- gsub("^f", "frequency", names(final_data))
names(final_data) <- gsub("Acc", "Accelerometer",names(final_data))
names(final_data) <- gsub("Gyro", "Gyroscope", names(final_data))
names(final_data) <- gsub("Mag", "Magnitude", names(final_data))
names(final_data) <- gsub("BodyBody", "Body", names(final_data))

#Creating a second tidy data set with the average of each variable for each
#activity and each subject
tidy_data <- ddply(final_data, .(subjectId, activity), function(x) colMeans(x[,1:66]))

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
