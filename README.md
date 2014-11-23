getclean
========

Repository containing the submission for Module 3 Getting and Cleaning data

How it works
============
1. In your home directory create the subsdirector ./Coursera/Module 3/Project, where the data from the assigment will be loaded
2. Load the UCI HAR data indicated as indicated in the assignment, the subdirectory Project should now have a subdir UCI HAR Dataset, with two subdirs train and test, respectively for the train and test data
3. set your working directory to the home directory
4. run the script, q <- run_analysis()
5. the output table q is the tidy data set
6. write the tidy data set with write.csv(q,"q.csv)
 
Code book
=========
the variables are named <activity>.<subjectid>, where

* <activity> is the label of the activity, with possible values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* <subject> is the subject identification with possible values: 1 to 30

the observations are the means and standard deviations of the parameters or features of the accelerometers
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

A cell represents the average of each variable for each activity and each subject

Steps in the script
===================
1. make sure the working directory is your home directory

2.
* read activity labels and features, i.e. variable names
* al vector representing activity labels
* ft vector representing features

3.
* read train set data
* trgst vector representing subject train data
* trgxt vector representing x train data
* trgyt vector representing y train data

4.
* read test set data
* tstst vector representing subject test data
* tstxt vector representing x test data
* tstyt vector representing y test data

5.
* merge train and test set data
* st vector representing subject data
* xt vector representing x data
* yt vector representing y data

6.
* replace the activity values with descriptive activity labels
* ytl is a vector where each number is replaced by its corresponding activity label using gsub

7.
* merge the data frames st, subject, x data and y data into one data frame called df

8.
* step meaningful dimension names
* create vector co2, the second set of colum names derived from the features.txt table respresenting the column names
* convert all to lowercase

9.
* create the row names by pasting "obs" with the row number, representing the observation number

10.
* create all, column names, the ID, followed by the features, follwed by the activity label

11.
* set meaningful dimension names

12.
* subset the data by...
* creating a logical vector mn representing those column names where mean() is present as TRUE
* creating a logical vector sd representing those column names where std() is present as TRUE
* creating a logical vector mnsd representing ythose columns mean() or std()
* the subset the data frame with the selected columns
* do not forget to reinclude the Subject ID, column 1, and Activity Label, the last column

13.
* make a tidy data set
* split the data set follwoing the activity label and the id

14.
* calculate the column Means but excluding the ID and Activity label column by only using columns 2 till 67
* as ID is in the first column -1- and activity label in the last -68- 

15.
* this retuns the table q
