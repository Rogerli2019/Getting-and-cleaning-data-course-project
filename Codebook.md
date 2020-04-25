Codebook for getting and cleaning data course project
================

## Sourse of the data

One of the most exciting areas in all of data science right now is
wearable computing - see for example this article . Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the
Samsung Galaxy S smartphone. A full description is available at the site
where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Original files

The dataset includes the following files: 1. ‘README.txt’ 2.
‘features\_info.txt’: Shows information about the variables used on
the feature vector. 3. ‘features.txt’: List of all features. 4.
‘activity\_labels.txt’: Links the class labels with their activity
name. 5. ‘train/X\_train.txt’: Training set. 6. ‘train/y\_train.txt’:
Training labels. 7. ‘test/X\_test.txt’: Test set. 8. ‘test/y\_test.txt’:
Test labels.

## Transformation

The transformation process contains five steps: 1. Merges the training
and the test sets to create one data set. 2. Extracts only the
measurements on the mean and standard deviation for each measurement. 3.
Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. We
get ‘merged\_data\_1.txt’ file in this step 5. From the data set in step
4, creates a second, independent tidy data set with the average of each
variable for each activity and each subject. We get the
‘Mean\_data\_2.txt’ file in this step.

The transformation requires the loading of the dplyr package.

## Ending files and variables

The ‘merged\_data\_1.txt’ file is the tidy data set after combining
trainning and testing dataset and the corresponding feature list and
acitivity id. The activity including 6 types:
WALKING,WALKING\_UPSTARIS,WALKING\_DOWNSTRAIRS,SITTING AND LAYING.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.The detailed
variables name can be found on the column names of the final files.

The ‘Mean\_data\_2.txt’ file is the result of the average of each
variable for each activity and subject.
