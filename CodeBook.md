Code Book
=========

This file describes the variables, the data, and any transformations or work that was performed to clean up the original data.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcceleromter-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAcceleromterJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAcceleromterMagnitude, tGravityAcceleromterMagnitude, tBodyAcceleromterJerkMagnitude, tBodyGyroscopeMagnitude, tBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccelerometer.XYZ
tGravityAccelerometer.XYZ
tBodyAccelerometerJerk.XYZ
tBodyGyroscope.XYZ
tBodyGyroscopeJerk.XYZ
tBodyAccelerometerMagnitude
tGravityAccelerometerMagnitude
tBodyAccelerometerJerkMagnitude
tBodyGyroscopeMagnitude
tBodyGyroscopeJerkMagnitude
fBodyAccelerometer.XYZ
fBodyAccelerometerJerk.XYZ
fBodyGyroscope.XYZ
fBodyAccelerometerMagnitude
fBodyAccelerometerJerkMagnitude
fBodyGyroscopeMagnitude
fBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

mean.: Mean value
std.: Standard deviation

