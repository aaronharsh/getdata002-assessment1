Getting and Cleaning Data -- 1st Assessment
=====================================

This repo holds files for the first peer assessment of the getdata-002 course.

## How to run

In this repo you'll find a file named **run_analysis.R**, designed to make tidy the
raw data stored in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Make sure the raw data is downloaded and unzipped into the current directory.  The **run_analysis.R** script expects to see a directory named **UCI HAR Dataset** in the current directory, and looks inside for the data files.  If the results of the list ```list.files()``` include the string ```"UCI HAR Dataset"``` then you're probably in good shape to run the script.

When run, the script will create two new tidy data files in the current directory: **observation_detail.txt** and **observation_summary.txt**.  The **observation_detail.txt** file includes tidied data, one row per observation in the raw dataset.  The **observation_summary.txt** file includes a summarized version with means of the values in each column, grouped by Subject and Activity.