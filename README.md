# GettingAndCleaningData
Final assignment submissions
GETTING AND CLEANING DATA PROJECT
CRITERIA
1.	The submitted data set is tidy.
2.	The Github repo contains the required scripts.
3.	GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4.	The README that explains the analysis files is clear and understandable.
5.	The work submitted for this project is the work of the student who submitted it.

INSTRUCTIONS
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You should create one R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Good luck!

INPUT
Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

ANALYSIS SCRIPT
run_analysis.R: this script takes the input data, and creates the output file
An R script has been created to download data, which is untidy, performs some analysis and save the new data in a clean format. The script does the following.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

DATA ANALYSIS EXPLANATION
The first part of the script is to download needed packages and load them in to library. This is necessary to ensure that the script runs on most computer and versions of R with no assumptions of already installed packages.
The script then opens the URL connection and downloads the file into the working directorhy of R. It checks to see if a ProjectData directory is available, and if not, it creates this directory and subsequently unzips the downloaded file. This makes it easy to identify all the files you are working with at a later date.
Read data sets and combine them
Read subjects and combine them
Read data labels and combine them
Read features list
Part 2
Subset only only std and mean features from list
Creates a data frame with subset data and two additional columns for calculations
Loop through subjects, then subloop through activities
For each activity in a subject, get the full list of measurements
Calculate the mean of each of these activities
Place the means in subsequent columns of the subject/activity row
Part 3
Rename features to be more human readable
Read activity list
Rename activities to be more human readable
Rename data labels with activity name
Merge data, subjects, and labels to single tiny data set
Write tiny data set to file

OUTPUT
Tidy dataset: tidy.txt

CODE BOOK
CodeBook.md: describes the variables, the data, and any transformations or work that you performed to clean up the data
