
The following codebook describes the data set resulting from the analysis given in the [accompanying analysis R script](https://github.com/slior/CourseraExtractingDataProject/blob/master/run_analysis.r).
The analysis itself is described in detail in the accompanying [README](https://github.com/slior/CourseraExtractingDataProject/blob/master/README.md) file.

# Overview

The following data set is derived from the original data set using the [script](https://github.com/slior/CourseraExtractingDataProject/blob/master/run_analysis.r) given in the repository.
It describes the result of an experiment conducted over 30 distinct human subject carrying a smartphone with gyroscope and accelerometer sensors.
The experiment consisted of each subject conducting a series of six different activities, and recording the readings from the sensors.

The raw data was then processed further, calculating more interesting variables, and divided into training and test sets.
A more comprehensive description of the original data set is provided [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The script in this repo combines the training and test set, extracts the mean and standard deviation measures, adds the relevant activity and subject information and tidies up the data set with easier-to-read names.
In addition, the script computes a new data set which averages the resulting mean and standard deviation measures for each pair of subject and activity, for a total of 180 observations.

## Format
The above mentioned script results in a file - `analysis_results.txt` - which contains the final data set (result of step 5).
It is simple text file, with each observation given in one row, and columns separated by space characters.
The first row of the file is the header row, providing the relevant column names (variable names).

# Variables

The following is a description of the data set resulting from the script, averaging the standard deviation and mean measures for each subject and activity pair.
The original data consists of 30 different subjects, with 6 different activities.

All the mean and standard deviation measures from the original set are extracted, for a total of 66 variables. Extra two columns are provided for the activity and subject for which the measures are given.

The variable names are constructed of the following factors:
1. Domain: The domain of the recorded signal - either time or frequency.
2. Sensor: Either a accelerometer or the gyroscope signals.
3. Body or Gravity Acceleration signal - for accelerator signals, the signal is further divided into the body acceleration and gravity acceleration signals.
4. Axis: Either X, Y or Z axes.
5. Jerk: A measure that is a derivation of the body linear acceleration and angular velocity in time. If true, then 'Jerk' will be part of the name. Otherwise no indication is given in the name.
6. Magnitude of the signals, using the Euclidean norm. If true, 'Mag' will be part of the name. Otherwise no indication is given in the name
6. Mean or standard deviation (*mean*/*std*).

This results in the following variable names:

Variable Name 				 |Domain (`time`/`freq`)| Sensor (`Acc`/`Gyro`)| Body/Gravity | Axis (`X`, `Y` or `Z`) | Jerk (`Jerk` or nothing) | Magnitude (`Mag` or nothing) | Mean/Standard Deviation (`mean`/`std`)
:----------------------------|:--------------------:|:--------------------:|:------------:|:----------------------:|:------------------------:|:----------------------------:|:--------------------------------------
time_BodyAcc_mean_X          |time     				| Acc                 | Body           | X      |              |  | mean
time_BodyAcc_mean_Y          |time   | Acc               | Body         | Y    |           |  | mean
time_BodyAcc_mean_Z          |time   | Acc               | Body         | Z    |           |  | mean
time_GravityAcc_mean_X		 |time   | Acc               | Gravity         | X    |           | | mean
time_GravityAcc_mean_Y       |time   | Acc               | Gravity         | Y    |           | | mean
time_GravityAcc_mean_Z       |time   | Acc               | Gravity         | Z    |           | | mean
time_BodyAccJerk_mean_X		 |time   | Acc               | Body         | X    | Jerk          | | mean
time_BodyAccJerk_mean_Y      |time   | Acc               | Body         | Y    | Jerk          | | mean
time_BodyAccJerk_mean_Z      |time   | Acc               | Body         | Z    | Jerk          | | mean
time_BodyGyro_mean_X		 |time   | Gyro               | Body         | X    |           | | mean
time_BodyGyro_mean_Y         |time   | Gyro               | Body         | Y    |           | | mean
time_BodyGyro_mean_Z         |time   | Gyro               | Body         | Z    |           | | mean
time_BodyGyroJerk_mean_X	 |time   | Gyro               | Body         | X    | Jerk      | | mean
time_BodyGyroJerk_mean_Y     |time   | Gyro               | Body         | Y    | Jerk      | | mean
time_BodyGyroJerk_mean_Z     |time   | Gyro               | Body         | Z    | Jerk      | | mean
time_BodyAccMag_mean		 |time   | Acc               | Body         |    | Jerk      |  Mag | mean
time_GravityAccMag_mean      |time   | Acc               | Gravity         |    | Jerk      | Mag | mean
time_BodyAccJerkMag_mean     |time   | Acc               | Body         |    | Jerk      | Mag | mean
time_BodyGyroMag_mean
time_BodyGyroJerkMag_mean
freq_BodyAcc_mean_X
freq_BodyAcc_mean_Y
freq_BodyAcc_mean_Z
freq_BodyAccJerk_mean_X
freq_BodyAccJerk_mean_Y
freq_BodyAccJerk_mean_Z
freq_BodyGyro_mean_X
freq_BodyGyro_mean_Y
freq_BodyGyro_mean_Z
freq_BodyAccMag_mean
freq_BodyAccJerkMag_mean
freq_BodyGyroMag_mean
freq_BodyGyroJerkMag_mean
time_BodyAcc_std_X
time_BodyAcc_std_Y
time_BodyAcc_std_Z
time_GravityAcc_std_X
time_GravityAcc_std_Y
time_GravityAcc_std_Z
time_BodyAccJerk_std_X
time_BodyAccJerk_std_Y
time_BodyAccJerk_std_Z
time_BodyGyro_std_X
time_BodyGyro_std_Y
time_BodyGyro_std_Z
time_BodyGyroJerk_std_X
time_BodyGyroJerk_std_Y
time_BodyGyroJerk_std_Z
time_BodyAccMag_std
time_GravityAccMag_std
time_BodyAccJerkMag_std
time_BodyGyroMag_std
time_BodyGyroJerkMag_std
freq_BodyAcc_std_X
freq_BodyAcc_std_Y
freq_BodyAcc_std_Z
freq_BodyAccJerk_std_X
freq_BodyAccJerk_std_Y
freq_BodyAccJerk_std_Z
freq_BodyGyro_std_X
freq_BodyGyro_std_Y
freq_BodyGyro_std_Z
freq_BodyAccMag_std
freq_BodyAccJerkMag_std
freq_BodyGyroMag_std
freq_BodyGyroJerkMag_std


