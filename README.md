Getting and Cleaning Data Course Project
=============================

# Overview

This repo was created for purposes of submitting the course project in the Getting and Cleaning Coursera course.
The repo contains the script for analyzing a given data set and explanation of the script.

The data set given in the course project is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The original data set contains information about 30 different subjects, performing 6 different activities that which are recorded using a a smartphone's sensors to acquire positioning and movement data in 3-dimensional space.
A more complete description of the original data set is given in the link above. The reader here is assumed to be familiar with the original data set.

The purpose of the script given here is to tidy up the data in several ways, as requested in the course project, and described below.
The result of this script is written to a file which can then be used for further analysis.

The resulting dataset is described in the codebook.md file, also in this repo.

# Repository Contents
The repository contains 3 files:

* `run_analysis.r': An R script file containing the script that runs the analysis.
* `README.md` (this file): Describing the repository and the analysis done in detail.
* `Codebook.md`: A file describing the resulting data set - the result of the script described here.

# Analysis Script

The analysis is given in the [run_analysis.R](https://github.com/slior/CourseraExtractingDataProject/blob/master/run_analysis.r) file.
It is written in R version 3.0.3 (2014-03-06) -- "Warm Puppy", 64 bit version.
It was written and tested using RStudio version 0.98.501, on a Windows 7 64 bit Home version.

## Assumptions
The script assumes that the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was downloaded and extracted to a local directory.
It assumes that the working directory set in R is the directory to which the script was extracted and that the files are in the same directory structure and name as given in the original zip file.

The script also contains a helper variable `rowcount`, used for debugging purposes. It is used to limit the number of rows read and manipulated, so the script be be re-run quickly.
Setting it to -1 (as submitted), will run the analysis over the entire data set.
I have deliberatly left this helper variable there, with its references in the code, even though it is not required - to help with further modifications.

## Analysis Performed
The script performs the analysis as requested in the course project (and understood by me).

The analysis is performed in 5 different steps (also documented in the script)

### Step 1: Combining the training and test sets.
In this step, the original training and test measurments are read (the data set was originally intended for machine learning purposes which usually provide a training set for building a classifier and a separate testing set for testing it).
Both sets have the same structure and variable names. The test set is simply smaller.

Both sets are read for their respective files (`train/X_train.txt` and `test/X_test.txt`).
The original text files are simply space delimited file, with an observation no each row.
To these we add the respective subject information, which is given in separate file (`train/subject_train.txt` and `test/subject_test.txt`).
The subject informatio is read separately and added using the column bind (`cbind`) function.

After adding the subject information, the two sets are simply appended together (`rbind`).

The result of this step is stored in the **`all`** variable - a data frame containing all the variable + the corresponding subject id (a number in the range of 1 to 30).

### Step 2: Extracting the Mean and Standard Deviation Measures
In this step, we extract only the interesting data for our purposes (defined by the course project - the actual analysis to be performed is unknown).
In our case, this is all the mean and standard deviation variables, as calculated on the original raw data, and available in the original data set.

This step involves basically finding the correct measures. This is done by searching for the relevant variable names (feature names in the original data set).
The feature names are given in a text file (`features.txt`) in the original data set. This file is organized with a feature name per row, matching the variables in the original data set.
We simply read the file which has the feature (=variable) names and index per name. The file is sorted by the feature index.
We find the indices for the variable names that contain either the string `mean()` or `std()` in their name.
These indices are then used to subset the data from the original data set, read in the previous step.
Note that we need to account for the additional "subject" column that was added in the previous step, so the indices are shifted right (+1) when subsetting the data.

The result of this step is stored in the **`interesting_data`** variable: the subject id with the mean and standard deviation (std) variables.

### Step 3: Adding the Activity Information
The activity information is recorded separately in the original data set (added manually in the original experiments).
We are required to add it to the data set, with the useful activity names - "STANDING", "WALKING", etc.

The activity labels - numbers in the range 1 to 6 - are stored in a separate files, for the training and test sets (`train/y_train.txt` and `test/y_test.txt`). Each row has one number, corresponding to an activity of the matching measurements in the original data file (*X_train.txt* or *X_test.txt*).
The activity labels are read into data frame and then matched with an activity dictionary (**`activity_dict`**).
This join operation is done using the `merge` function over the `label` variable (the activitiy label).
After we have this information, we discard the `label` variable and left with the more understandable activity name variable.

It's important to note that the merge function doesn't guarantee the original order, so after this step, the order of the rows doesn't match the original order.
This is ok, since we're not relying on this order to match any more data, as we have until this step.
The order of columns is preserved though.

The result of this step is stored in the **`interesting_data_w_activities`** variable.

### Step 4:  Label the Data with Descriptive Names
In this step we simply take the variable names, as given in the original `features` vectors we read.
We read the relevant names (using the same indices as in step 2) into a character vector.

The "fixing" of the names includes:
* Replacing the 't' and 'f' prefixes with more descriptive prefixes: 't' -> 'time', 'f' -> 'freq'
* Removing the redundant parenthesis.
* Replacing any hyphens with underscores
* Replacing '*BodyBody*' with '*Body*', since this seems more like a typo, and doesn't contribute to the information.

The resulting names are pretty close to the original one. This is intended for easier traceability into the original data set (one can easily do a textual search where needed).
The names are, however, more easily read - words are separated by underscores, and no redundant text or symbols.

The subject variable is named *subject*, and the activity name is named *activity_name*.

The result of step is also in the **`interesting_data_w_activities`** variable - we're simply changing the data frame names.
Note that this step ends with one tidy data set, but one which isn't submitted into the project evaluation.

### Step 5: Averaging all Variables by Subject and Activity
This step involves creating a *separate* data set, which takes the result of the previous four steps and reshapes them.
We are required to provide a data set which averages all variables per activity and subject pair.
Since we have 30 subjects and 6 activities, this results in 180 observations in total. Where each variable for an observation is the average (mean) of the relevant variable in the previous step result (`interesting_data_w_activities`).

The result of step #4 is taken and melted (`melt` function), using the `activity_name` and `subject` variables as ID variables.
We then use the `dcast` function to aggregate by the activity name and subject variable on the `variable` variable (the result of `melt`). We provide the `mean` function as the aggregate function to use.

The result of this step - **`result`** - is written to a text file, using `write.table`.
The file is named **`analysis_results`**.
And this concludes the analysis script.
