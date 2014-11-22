**Getting and Cleaning Data Project**

**Contents**

This Repo contains files, listed below, that are required for
the completion of Project 1 of the Coursera course �Getting and Cleaning Data�.

**README.md**: This file

**run_analysis.R**: R script to transform raw dataset into a
dataset conforming to the tidy data standard

**CodeBook.md**: Includes information about the raw and tidy datasets along
with a description of how the processes the raw dataset.

**LICENSE**: License terms for text and code

**tidy_data.txt: **The dataset produced by **run_analysis.R.**

**Project  Summary**

The project involves cleaning up a dataset from a real world study
that collected sensor data from participants wearing smartphone as they
performed basic physical tasks. The ultimate goal is to use this data to
predict a person�s activity based on sensor data recorded by a smartphone. More
information describing the dataset used in this project can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the original dataset can be download[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

 

**Running the Script**

Unzipped and place a copy of project data folder (�getdata_projectfiles_UCI
HAR Dataset�) in the R working directory along with the **run_analysis.R** script.  Run the script from the R command line. 

** **

**Script Performance**

**run_analysis.R** performs the following actions;

1. Imports the
training and the test sets from the working R directory. 

2. Merges the training
and the test sets to create one data set. 

3. Extracts only the
measurements on the mean and standard deviation for each measurement. 

4. Adds descriptive names
to the coded activities in the dataset 

5. Modifies data
labels to be more descriptive. 

6. Creates a second,
independent tidy dataset with the mean of each variable for each activity and
each subject. 

**Additional Information**

You can find detailed information
about the variables, data and transformations in the **CodeBook.md** file.
