Code Book
=========

This file describes the variables, the data, and any transformations or work that was performed to clean up the original data.

Variables 
=========

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

Subject is the id of the Subject performing the activity, 1-30<br/>
Activity is the activity performed 1-6<br/>
ActivityName is the descriptive name of the activity that was performed<br/>

Transformations
===============

The script expects the data to be found in a folder under the home folder
   ~/Coursera/Getting and Cleaning Data/data/UCI HAR Dataset
The features file was read and a character vector was created from the second column of the data frame. This vector will be used to name the columns of the train and test datasets
Many of the feature names contain characters that are not valid as column names: ( ) -
The function make.names was used to correct the names
The variable names were made more descriptive by expanding Acc, Gyro and Mag to Accelerometer, Gyroscope and Magnitude respectively.

The activities files was naming the columns 'Activity' and 'ActivityName'

Next the test data was read in, naming the columns using the features vector

Next the test activities file was read adn the activities was added as a column to the test data frame. The added column was named 'Activity'

Next the list of subjects was read in and add the subjects as a column to the test data frame, naming the newly added column 'Subject'.

Now perform the same group of commands on the data in the train folder

## there are now two data frame- test and train that have the same number and oder of columns
## merge these together vertically by row binding the data frames together
tidydata<-rbind(test,train)

## find the column names in features vector that contain '.mean.' or '.std.'
## these are the columns that are to be extracted from the full dataset
## add 2 to each element to skip past the Subject and Activity columns
meanstdCols<-grep("(\\.mean\\.)|(\\.std\\.)",features) + 2
## set up the list of columns to extract starting with the first two columns: Subject and Activity
colsToExtract<-c(1,2)
## append the mean and std columns
colsToExtract<-append(colsToExtract,meanstdCols)

## now subset the full data frame using the colsToExtract vector
t1<-tidydata[,colsToExtract]

## add in the descriptive Activity Name
t1<-merge(activities,t1,by="Activity")

## write the dataset to a file named "summarize.txt"
write.table(t1,file="tidydata.txt",row.names=FALSE)

## Step 5
## Find the mean for all the columns, excluding the first 3 columns
summarize<-colMeans(t1[,c(-1,-2,-3)])
