## Getting and cleaning Data, Coursera June 2014
##
## Course Project
##
## Read in the datasets
## this script expects that the data files are located in subfolder off 
##   the user's home folder.
setwd("~/Coursera/Getting and Cleaning Data/data/UCI HAR Dataset/")
## this folder level contains the data files common to both the test and train datasets
## read the features file
features<-read.table("features.txt", header=FALSE,sep=" ")
## take a peek at the resulting dataset
head(features)
## Create a character vector from the second column of the data frame
## This vector will be used to name the columns of the train and test datasets
features<-as.character(features[,2])
## Many of the feature names contain characters that are not valid as column names: ( ) -
## Use make.names to correct the names
features<-make.names(features,unique=TRUE)
## make the names more descriptive by expanding Acc, Gyro and Mag to Accelerometer, Gyroscope and Magnitude respectively
features<-sub("Acc","Accelerometer",features)
features<-sub("Gyro","Gyroscope",features)
features<-sub("Mag","Magnitude",features)
## make.names changes ( ) and - to dots, resulting in many instances of .. and ... in the names
## change ... and .. to a single .
features<-sub("...",".",features,fixed=TRUE)
features<-sub("..",".",features,fixed=TRUE)

## read the activities file, naming the columns 'id' and 'ActivityName'
activities<-read.table("activity_labels.txt", header=FALSE,sep=" ",col.names=c("Activity","ActivityName"))
## take a peek at the resulting dataset
head(activities)
##
## now read in the test data, naming the columns using the features vector
test<-read.table("test/X_test.txt",header=FALSE,col.names=features)
## take a peek at the resulting dataset. Limit it to 2 rows due to large number of columns
head(test,2)
## read in the test activities
activities_test<-read.table("test/y_test.txt",header=FALSE)
## add the activities as a column to the test data frame
test<-cbind(activities_test,test)
## name the newly added column 'Activity'
names(test)[1]<- "Activity"

## read in the list of subjects
subject_test<-read.table("test/subject_test.txt",header=FALSE)
## add the subjects as a column to the test data frame
test<-cbind(subject_test,test)
## name the newly added column 'Subject'
names(test)[1]<- "Subject"
## free up space in the environment by removing the acitivies_test and subject_test vectors
rm(activities_test)
rm(subject_test)

##
## Now perform the same group of commands on the data in the train folder
## now read in the train data, naming the columns using the features vector
train<-read.table("train/X_train.txt",header=FALSE,col.names=features)
## take a peek at the resulting dataset. Limit it to 2 rows due to large number of columns
head(train,2)
## read in the test activities
activities_train<-read.table("train/y_train.txt",header=FALSE)
## add the activities as a column to the train data frame
train<-cbind(activities_train,train)
## name the newly added column 'Activity'
names(train)[1]<- "Activity"

## read in the list of subjects
subject_train<-read.table("train/subject_train.txt",header=FALSE)
## add the subjects as a column to the train data frame
train<-cbind(subject_train,train)
## name the newly added column 'Subject'
names(train)[1]<- "Subject"
## free up space in the environment by removing the acitivies_train and subject_train vectors
rm(activities_train)
rm(subject_train)

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

## write the tidy dataset to a file named "tidydata.txt"
write.table(t1,file="tidydata.txt",row.names=FALSE)

## Step 5
## Find the mean for all the columns, excluding the first 3 columns
summarize<-colMeans(t1[,c(-1,-2,-3)])
