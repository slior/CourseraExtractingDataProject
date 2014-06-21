Getting and Cleaning Data Course Project
=============================

# Overview

This repo was created for purposes of submitting the course project in the Getting and Cleaning Coursera course.
The repo contains the script for analyzing a given data set and explanation of the script.

The data set given in the course project is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The original data set contains information about 30 different subjects, performing 6 different activities that which are recorded using a a smartphone's sensors to acquire positioning and movement data in 3-dimensional space.
A more complete description of the original data set is given in the link above.

The purpose of the script given here is to tidy up the data in several ways, as requested in the course project, and described below.
The result of this script is written to a file which can then be used for further analysis.

The resulting dataset is described in the codebook.md file, also in this repo.

# Analysis Script

The analysis is given in the [run_analysis.R](https://github.com/slior/CourseraExtractingDataProject/blob/master/run_analysis.r) file.
It is written in R version 3.0.3 (2014-03-06) -- "Warm Puppy", 64 bit version.
It was written and tested using RStudio version 0.98.501, on a Windows 7 64 bit Home version.

## Assumptions
The script assumes that the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was downloaded and extracted to a local directory.
It assumes that the working directory set in R is the directory to which the script was extracted and that the files are in the same directory structure and name as given in the original zip file.

## Analysis Performed