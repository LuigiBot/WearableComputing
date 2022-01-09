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


