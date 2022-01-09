run_analysis <- function(){
  library(dplyr)
  library(reshape2)
  
  #Unzipping the UCI HAR Dataset if it's not unzipped yet
  if(!dir.exists("UCI HAR Dataset")){
    unzip('getdata_projectfiles_UCI HAR Dataset.zip')
  } else {
    print("Directory already exists, not unzipping again")
  }
  
  # Reading the files from the unzipped package
  activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
  features <- read.table('UCI HAR Dataset/features.txt')
  dataTrain <- read.table('UCI HAR Dataset/train/X_train.txt')
  activityTrain <- read.table('UCI HAR Dataset/train/y_train.txt')
  dataTest <- read.table('UCI HAR Dataset/test/X_test.txt')
  activityTest <- read.table('UCI HAR Dataset/test/y_test.txt')
  subjectTrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
  subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt')
  
  #Merging all features, activity and subject sets.
  dataFeatures <- rbind(dataTest, dataTrain)
  dataActivity <- rbind(activityTest, activityTrain)
  dataSubject <- rbind(subjectTest, subjectTrain)
  
  #Renaming the columns in activity, subject and features
  colnames(dataSubject) <- c("Subject")
  colnames(dataActivity) <- c("Activity")
  colnames(dataFeatures) <- features$V2
  
  #Merging all data sets in the same data set (STEP 1)
  data_merged <- cbind(dataSubject, dataActivity, dataFeatures)
  
  #Selecting only the mean, std, the subject and the activity from the data set (STEP 2)
  data_merged_filtered <- data_merged %>% select(grep("mean\\(\\)|std\\(\\)|Subject|Activity", colnames(data_merged)))
  
  #Renaming activity labels to the labels that are in the activity_labels file (STEP 3)
  data_merged_filtered_renamed <- data_merged_filtered %>% mutate(Activity=activity_labels$V2[Activity])
  
  #Renaming feature labels for them to be understandable (STEP 4)
  names(data_merged_filtered_renamed) <- gsub("Acc", "Acceleration", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("-mean\\(\\)", "Mean", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("-std\\(\\)", "StdDeviation", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("Gyro", "Gyroscope", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("^t", "Time", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("^f", "Frequency", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("Mag", "Magnitude", names(data_merged_filtered_renamed))
  names(data_merged_filtered_renamed) <- gsub("BodyBody", "Body", names(data_merged_filtered_renamed))
 
  # Melting data set and summarizing it to just subject, activity and each variable mean
  tidy_set_melted <- melt(data_merged_filtered_renamed, id = c("Subject", "Activity"))
  tidy_set <- dcast(tidy_set_melted, Subject + Activity ~ variable, mean)
  
  # Writing tidy data set in an external file
  write.table(tidy_set, file="tidy_data_set.txt", row.names = FALSE)
}
