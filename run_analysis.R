
# we load the library
library(dplyr)

# We indicate the path of the folder where the files are
setwd("C:/Users/usuario/Data_Science/r_prog/archivos_varios/getdata_projectfiles_UCI HAR Dataset/")

# Load the data frame
features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt", col.names = features$functions)
y_test <- read.table("test/y_test.txt", col.names = "code")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "code")

# Paso 1: Merges the training and the test sets to create one data set
x <- rbind(x_train, x_test)
#head(x)
y <- rbind(y_train, y_test)
#head(y)
Subject <- rbind(subject_train, subject_test)
#head(Subject)
Merged_Data <- cbind(Subject, y, x)
head(Merged_Data)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
head(TidyData)

#Step 3: Uses descriptive activity names to name the activities in the data set.
TidyData$code <- activities[TidyData$code, 2]
head(TidyData)

#Step 4: Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))
head(TidyData)

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
training <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(training, "training.txt", row.name=FALSE)
head(training)

# View structure
str(training)










