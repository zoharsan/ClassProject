# ClassProject
Repository for Project submission for Coursera class Getting and Cleaning Data

## Script run_analysis.R

This repository contains the run_analysis.R script which follows each step required for the class project. Note that the first command setwd() which sets the working directory is optional, but points R to the root of the Samsung data set and allows to navigate with relative paths from that point on.

If this script is to be copied and ran on another system, the setwd() would be the only one which needs to be customized.
The script contains generous explanatory comments for each step.

## Variables Codebook

This data set summarizes various accelerometer and gyroscope measurements captured by a Samsung smartphone carried by a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

- Variable Activity: Captures the Activity of the volunteer
- Variable Subject: Identifies the volunteer.

The original variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc_XYZ
tGravityAcc_XYZ
tBodyAccJerk_XYZ
tBodyGyro_XYZ
tBodyGyroJerk_XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc_XYZ
fBodyAccJerk_XYZ
fBodyGyro_XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The script extracts only the mean and the standard deviation of these various measurements in a first stage:

mean(): Mean value
std(): Standard deviation

The naming convention for the mean measurement variable is to append 'Mean' to each measurement Example: tBodyAccMean_X.

The naming convention for the standard deviation variable is to append 'Std' to each measurement. Example: tBodyAccStd_X.

After extraction of these variables, an additional summarization by calculating the mean after grouping by the subject, and the activity. These variable names are prefixed with 'MEAN_'. Example : MEAN_tBodyAccMean_X.

For further information on the original data set, please consult:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

