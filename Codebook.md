
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

The first two variables identify the observation.
These are:
* Activity (`activity_name`): The name of the activity conducted. One of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Subject (`subject`): The ID of the subject. An integer number in the range of 1 to 30.

All the mean and standard deviation measures from the original set are extracted, for a total of 66 additional variables - the measures.
All values are numeric in the range of [-1,1].

The variable names are constructed of the following factors:
* Domain: The domain of the recorded signal - either time or frequency.
* Sensor: Either a accelerometer or the gyroscope signals.
* Signal Type: Body or Gravity Acceleration signal - for accelerator signals, the signal is further divided into the body acceleration and gravity acceleration signals.
* Axis: Either X, Y or Z axes.
* Jerk: A measure that is a derivation of the body linear acceleration and angular velocity in time. If true, then 'Jerk' will be part of the name. Otherwise no indication is given in the name.
* Magnitude of the signals, using the Euclidean norm. If true, 'Mag' will be part of the name. Otherwise no indication is given in the name
* Aggregation: Mean or standard deviation (*mean*/*std*).

The name of the variable is then generally constructed as (without spaces): *Domain*_*Signal Type* *Sensor* *Jerk* *Magnitue* _ *Aggregation* _ *Axis*

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
time_BodyGyroMag_mean		 |time   | Gyro               | Body         |    |       | Mag | mean
time_BodyGyroJerkMag_mean	 |time   | Gyro               | Body         |    | Jerk  | Mag | mean
freq_BodyAcc_mean_X			 |freq   | Acc               | Body         |  X  |   |  | mean
freq_BodyAcc_mean_Y			 |freq   | Acc               | Body         |  Y  |   |  | mean
freq_BodyAcc_mean_Z			 |freq   | Acc               | Body         |  Z  |   |  | mean
freq_BodyAccJerk_mean_X		 |freq   | Acc               | Body         |  X  | Jerk   |  | mean
freq_BodyAccJerk_mean_Y		 |freq   | Acc               | Body         |  Y  | Jerk   |  | mean	
freq_BodyAccJerk_mean_Z		 |freq   | Acc               | Body         |  Z  | Jerk   |  | mean
freq_BodyGyro_mean_X		 |freq   | Gyro               | Body         |  X  |    |  | mean
freq_BodyGyro_mean_Y		 |freq   | Gyro               | Body         |  Y  |    |  | mean
freq_BodyGyro_mean_Z		 |freq   | Gyro               | Body         |  Z  |    |  | mean
freq_BodyAccMag_mean		 |freq   | Acc               | Body         |    |    | Mag  | mean
freq_BodyAccJerkMag_mean	 |freq   | Acc               | Body         |    | Jerk   | Mag | mean
freq_BodyGyroMag_mean		 |freq   | Gyro               | Body         |    |    | Mag | mean
freq_BodyGyroJerkMag_mean	 |freq   | Gyro               | Body         |    |  Jerk  | Mag | mean
time_BodyAcc_std_X			 |time   | Acc               | Body         | X |  |  | std
time_BodyAcc_std_Y			 |time   | Acc               | Body         | Y |  |  | std
time_BodyAcc_std_Z			 |time   | Acc               | Body         | Z |  |  | std
time_GravityAcc_std_X		 |time   | Acc               | Gravity         | X |  |  | std
time_GravityAcc_std_Y		 |time   | Acc               | Gravity         | Y |  |  | std
time_GravityAcc_std_Z		 |time   | Acc               | Gravity         | Z |  |  | std
time_BodyAccJerk_std_X	 	 |time   | Acc               | Body         | X | Jerk |  | std
time_BodyAccJerk_std_Y		 |time   | Acc               | Body         | Y | Jerk |  | std
time_BodyAccJerk_std_Z		 |time   | Acc               | Body         | Z | Jerk |  | std
time_BodyGyro_std_X			 |time   | Gyro               | Body         | X |  |  | std
time_BodyGyro_std_Y			 |time   | Gyro               | Body         | Y |  |  | std
time_BodyGyro_std_Z			 |time   | Gyro               | Body         | Z |  |  | std
time_BodyGyroJerk_std_X		 |time   | Gyro               | Body         | X | Jerk |  | std
time_BodyGyroJerk_std_Y		 |time   | Gyro               | Body         | Y | Jerk |  | std
time_BodyGyroJerk_std_Z		 |time   | Gyro               | Body         | Z | Jerk |  | std
time_BodyAccMag_std			 |time   | Acc               | Body         |  |  | Mag | std
time_GravityAccMag_std		 |time   | Acc               | Gravity         |  |  | Mag | std
time_BodyAccJerkMag_std		 |time   | Acc               | Body         |  | Jerk | Mag | std
time_BodyGyroMag_std		 |time   | Gyro               | Body         |  |  | Mag | std
time_BodyGyroJerkMag_std	 |time   | Gyro               | Body         |  | Jerk | Mag | std
freq_BodyAcc_std_X			 |freq   | Acc               | Body         | X |  |  | std
freq_BodyAcc_std_Y			 |freq   | Acc               | Body         | Y |  |  | std
freq_BodyAcc_std_Z			 |freq   | Acc               | Body         | Z |  |  | std
freq_BodyAccJerk_std_X		 |freq   | Acc               | Body         | X | Jerk |  | std
freq_BodyAccJerk_std_Y		 |freq   | Acc               | Body         | Y | Jerk |  | std
freq_BodyAccJerk_std_Z 	 	 |freq   | Acc               | Body         | Z | Jerk |  | std
freq_BodyGyro_std_X			 |freq   | Gyro               | Body         | X |  |  | std
freq_BodyGyro_std_Y			 |freq   | Gyro               | Body         | Y |  |  | std
freq_BodyGyro_std_Z			 |freq   | Gyro               | Body         | Z |  |  | std
freq_BodyAccMag_std			 |freq   | Acc               | Body         |  |  | Mag | std
freq_BodyAccJerkMag_std		 |freq   | Acc               | Body         |  | Jerk | Mag | std
freq_BodyGyroMag_std		 |freq   | Gyro               | Body         |  |  | Mag | std
freq_BodyGyroJerkMag_std	 |freq   | Gyro               | Body         |  | Jerk | Mag | std


