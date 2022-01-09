# Description of the run_analysis script

The run_analysis script will be break down into steps:
1. The script first looks for the *UCI HAR Dataset* folder. If that folder is not found, we unzip the zipfile found in our repository. This helps us that, in the event we want to update the data, we can just set up a zipfile with the latest data.
2. After that, we extract all the data from the different files:
   1. activity_labels, where the values of the activities are located
   2. features, where the name of each column in the dataset is located
   3. dataTrain, dataTest where the values of the features for each observation is located.
   4. activityTrain, activityTest where the values found for the activities (unnamed) for each observation are located.
   5. subjectTrain, subjectTest where the subject involved in each observation is located.

3. After that, we merge all the similar data located in the test and the train folder. (dataTest and dataTrain, activityTest and activityTrain, subjectTest and subjectTrain). The order that they are merged is not important. They are merged by using row bind, meaning that simply the lines are added at the end of the first table. The new tables are called *data features*, *dataActivity*, and *dataSubject*.

4. After having just one dataset for each type of data, we name the columns with the correct name obtained from the activity_labels and the features tables. The name of the dataSubject column (not specified anywhere) is 'Subject', for easiness. The names in the dataActivity is 'Activity'. The names in dataFeatures is obtained from the features table (2nd column, since the first column is just the number of the row). **NOTE:** After this step, a lot of the stuff done could be done in a one-liner using the dplyr package and the '%>%' operator. It was not done this way, since in the exercise review, it'd be easier for the reviewer the steps taken; however, I didn't want to just leave it that way without giving an explanation.

5. We merge the columns from the three tables in one using column bind (NOTE: Previous iterations of the script got checks checking the number of the rows of each table, for them to be the same. I decided to erase them, when the script was getting too cumbersome, and didn't really had an idea of what to do if the rows were not the same, so decided to take the default approach from R, that's to throw an error). This data is saved on **data_merged**.

6. Afterwards, WE ONLY SELECT DATA FROM THE COLUMNS WITH MEAN(), STD(), Activity and Subject. That's because we're only interested in the average and the standard deviation for each variable, additionally which activity and subject was done with each observation. Done with:
**select(grep("mean\\(\\)|std\\(\\)|Subject|Activity", colnames(data_merged)))**

7. We update the activity column by changing the values from the Activity table (1..6) to the equivalent value from the activity_labels table (**Activity = activity_labels$V2[Activity]**)

8. We renamed some columns in order to make them easier to read for the person who's working with the tidy data set. In summary, the following changes were made:
  -  Acc  -> Accelerometer  
  -  -mean() -> Mean  
  -  -std() -> StdDeviation  
  -  Gyro -> Gyroscope  
  -  everything starting with t -> Time  
  -  everything starting with f -> Frequency  
  -  Mag -> Magnitude  
  -  BodyBody -> Body  
  I couldn't find nothing else that seemed weird, but can be easily added if needed.
  
9. The data was melted with the ids of Subject and Activity, so that we could get all the data summarized per subject per activity. Finally, the melted data was dcasted as **dcast(tidy_set_melted, Subject + Activity ~ variable, mean)**.

10. We write the table in tidy_data_set.txt using write.table.


# Cookbook for the variables in tidy_data_set.txt

All the variables were captured at a constant rate of 50 Hz. Then filtered using a median filter, and a 3rd order low pass Butterworth filter (for more information on the raw signals, the features_info.txt found inside the .zip file can be read).

-  **TimeBodyAccelerationMean-X, Mean-Y, Mean-Z**: The mean of the signals (from the time domain) obtained for the body acceleration, in the X, Y and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyAccelerationStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: The standard deviation of the time domain signals obtained for the body acceleration in the X, Y and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationMean-X, Mean-Y, Mean-Z**: The mean of the time domain signals obtained for the gravity acceleration in the X, Y and Z directions.  The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: The standard deviation of the time domain signals obtained for the gravity acceleration in the X, Y and Z directions.  The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyAccelerationJerkMean-X, Mean-Y, Mean-Z**: The mean of the time-derived body linear acceleration, for the X, Y, and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyAccelerationJerkStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: The standard deviation of the time-derived body linear acceleration, for the X, Y, and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeMean-X, Mean-Y, Mean-Z**: The mean of the time domain body gyroscope angular velocity in the X, Y and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: The standard deviation of the time domain body gyroscope angular velocity in the X, Y and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeJerkMean-X, Mean-Y, Mean-Z**: The mean of the time-derived body angular velocity of the gyroscope in the X, Y, and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeJerkStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: The standard deviation of the time-derived body angular velocity of the gyroscope in the X, Y, and Z directions. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyAccelerationMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeBodyAccelerationMean-X, -Y and -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyAccelerationMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from TimeBodyAccelerationStdDeviation-X, -Y and -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeGravityAccelerationMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from TimeGravityAccelerationStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationJerkMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeGravityAccelerationJerkMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeGravityAccelerationJerkMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from TimeGravityAccelerationJerkStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeBodyGyroscopeMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from TimeBodyGyroscopeStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeJerkMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeBodyGyroscopeJerkMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **TimeBodyGyroscopeJerkMagnitudeMean**: The magnitude of the three euclidean signals obtained from TimeBodyGyroscopeJerkStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationMean-X, Mean-Y, Mean-Z**: Fast Fourier Transform of TimeBodyAccelerationMean. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: Fast Fourier Transform of TimeBodyAccelerationStdDeviation. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationJerkMean-X, Mean-Y, Mean-Z**: Fast Fourier Transform of TimeBodyAccelerationJerkMean. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationJerkStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: Fast Fourier Transform of TimeBodyAccelerationJerkStdDeviation. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyGyroscopeMean-X, Mean-Y, Mean-Z**: Fast Fourier Transform of TimeBodyGyroscopeMean. The average of all the readings for the specific combination of Activity-Subject is taken into account.
fea
-  **FrequencyBodyGyroscopeStdDeviation-X, StdDeviation-Y, StdDeviation-Z**: Fast Fourier Transform of TimeBodyGyroscopeStdDeviation. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationMagnitudeMean**: The magnitude of the three euclidean signals obtained from FrequencyBodyAccelerationMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from FrequencyBodyAccelerationStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationJerkMagnitudeMean**: The magnitude of the three euclidean signals obtained from FrequencyBodyAccelerationJerkMean-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyAccelerationJerkMagnitudeStdDeviation**: The magnitude of the three euclidean signals obtained from FrequencyBodyAccelerationJerkStdDeviation-X, -Y, -Z, using the Euclidean Norm. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyGyroscopeMagnitudeMean**: Fast Fourier Transform of TimeBodyGyroscopeMagnitudeMean. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyGyroscopeMagnitudeStdDeviation**: Fast Fourier Transform of TimeBodyGyroscopeMagnitudeStdDeviation. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyGyroscopeJerkMagnitudeMean**: Fast Fourier Transform of TimeBodyGyroscopeJerkMagnitudeMean. The average of all the readings for the specific combination of Activity-Subject is taken into account.

-  **FrequencyBodyGyroscopeJerkMagnitudeStdDeviation**: Fast Fourier Transform of TimeBodyGyroscopeJerkMagnitudeStdDeviation. The average of all the readings for the specific combination of Activity-Subject is taken into account.


