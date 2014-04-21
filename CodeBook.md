Getting and Cleaning Data -- 1st Assessment, Code Book
=====================================

# Observation Detail

Detailed data (one row per observation) is stored in the output file **observation_detail.txt**.  Fields included in the file are:

#### Subject

Integer values identifying the subject who carried out the experiment.

#### Activity

String values describing the activity engaged in by the subject at the moment of the observation.  Possible values are: 

* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

#### Accelerometer/gyroscope readings

The dataset also includes 66 fields describing the raw accelerometer and gyroscope signals associated with each observation.

To avoid plagiarism, and for the sake of brevity, I'll simply mention that you can find a more detailed description in the features_info.txt file stored in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Note that only the ```-mean``` and ```-std``` attributes are included in this dataset.

# Observation Summary

Summarized data (one row per Subject per Activity) is stored in the output file **observation_summary.txt**.  Fields in this file are identical to those in the Observation Detail file, except that the accelerometer/gyroscope readings in the summary files are the means of the readings in the detail files for the corresponding Subject/Activity.