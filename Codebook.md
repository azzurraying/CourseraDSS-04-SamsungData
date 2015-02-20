##################################
# Explanation of variable names: #
##################################

A group of 30 volunteers performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using the device's embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity.

The 6 Activities performed (or Activity types or Activity labels) were:
 1. WALKING
 2. WALKING_UPSTAIRS
 3. WALKING_DOWNSTAIRS
 4. SITTING
 5. STANDING
 6. LAYING

The following acceleration and angular velocity data were measured multiple times for each Activity performed by each Subject, and their mean and standard deviation were estimated, totalling 66 variables:

tBodyAcc-X
tBodyAcc-Y
tBodyAcc-Z
tGravityAcc-X
tGravityAcc-Y
tGravityAcc-Z
tBodyAccJerk-X
tBodyAccJerk-Y
tBodyAccJerk-Z
tBodyGyro-X
tBodyAccJerk-Y
tBodyAccJerk-Z
tBodyGyroJerk-X
tBodyAccJerk-Y
tBodyAccJerk-Z
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-X
fBodyAcc-Y
fBodyAcc-Z
fBodyAccJerk-X
fBodyAccJerk-Y
fBodyAccJerk-Z
fBodyGyro-X
fBodyGyro-Y
fBodyGyro-Z
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

##########################################################
# The tidy dataset repo consists of the following files: #
##########################################################

Samsung_tidy_data.txt
	Tidy data containing mean values of the 66 variables (mean and standard deviation of 3-axial linear acceleration and 3-axial angular velocity measurements) for each of 6 Activities, for all 30 Subjects.
run_analysis.R
	R code that manipulates raw test and training data to returns the tidy data
README.md
	Methodology for cleaning up the data
Codebook.md
	Explanation of variables in final dataset and in the code

####################################################
# Column heading explanation for the tidy dataset: #
####################################################

Subject
	Subject ID of 30 volunteers who participated in the experiment
Activity
	Activity label for 6 types of activities
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
	Mean, for each Activity type, of body acceleration signal means measured in 3 dimensions
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
	Mean, for each Activity type, of body acceleration signal standard deviations measured in 3 dimensions
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
	Mean, for each Activity type, of gravity acceleration signal means measured in 3 dimensions
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
	Mean, for each Activity type, of gravity acceleration signal standard deviations measured in 3 dimensions
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
	Mean, for each Activity type, of jerk signal means (time derivation of body linear acceleration and angular velocity)
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
	Mean, for each Activity type, of jerk signal standard deviations
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z

tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
	Mean, for each Activity type, of jerk signal means (time derivation of body linear acceleration and angular velocity)
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
	Mean, for each Activity type, of jerk signal standard deviations

tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
	Mean, for each Activity type, of these three-dimensional signal means and standardard deviations, calculated using the Euclidean norm

fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
	Mean, for each Activity type, of frequency domain signal means and standard deviations (after Fast Fourier Transform (FFT) was applied to some of the above signals)

###############################################
# Objects generated from run_analysis script: #
###############################################

fileURL
	URL of download link for zipped data
zip
	Downloaded zipped data

act_label
	Dataframe containing descriptive names for 6 activity types
features
	Dataframe containing descriptive names for 561 variables from 3-axial linear acceleration and 3-axial angular velocity measurements
time_var_names
	Character vector extracted from "features", containing descriptive names for 561 variables from 3-axial linear acceleration and 3-axial angular velocity measurements

subject_test
	Dataframe containing Subject IDs for the test data
time_freq_domain
	Dataframe containing the 561 variables measured for the test Subjects
act_index
	Dataframe containing the numercically labelled test Activity types (1 - 6) corresponding to the 561 variables measured
testdata
	Dataframe containing the 561 variables measured for test Subjects for 6 Activities

subject_tr
	Dataframe containing Subject IDs for the training data
time_freq_domain_tr
	Dataframe containing the 561 variables measured for the training Subjects
act_index_tr
	Dataframe containing the numercically labelled training Activity types (1 - 6) corresponding to the 561 variables measured
traindata
	Dataframe containing the 561 variables measured for training Subjects for 6 Activities

combineddata
	Dataframe containing the 561 variables measured for both test and training Subjects for 6 Activities
combineddata_sort
	Dataframe containing the 561 variables measured for both test and training Subjects for 6 Activities, sorted in ascending Subject IDs (1 to 30).
mean_colindex
	Integer vector containing indices of columns corresponding to mean values for all measurements
stdev_colindex
	Integer vector containing indices of columns corresponding to standard deviation values for all measurements
meanstd_colindex
	Integer vector containing indices of columns corresponding to mean and standard deviation values for all measurements
meanstd_colnames
	Character vector containing names of columns corresponding to mean and standard deviation values for all measurements
combineddata_meanstd
	Dataframe containing 66 variables (a subset of the 561) corresponding to mean and standard deviation values for all measurements

lev_sub
	Integer vector corresponding to the levels of Subject IDs (there are 30)
lev_act
	Integer vector corresponding to the levels of Activity types (there are 6)

sub_block
	List of 30 dataframes, each containing the 66 variables for 6 Activities measured for one Subject
sub_actmean_block
	List of 6 dataframes, each containing the 66 variables measured for one Activity type, for a given Subject in the current loop
empty_act
	Matrix storing mean values of the 66 variables for 6 Activities, for one given Subject in the current loop
sub_block2
	Matrix storing mean values of the 66 variables for 6 Activities, together with Subject ID in the current loop
empty_sub
	Matrix accumulating mean values of the 66 variables for 6 Activities over all 30 Subjects

datamean
	Tidy dataframe containing mean values of the 66 variables for each of 6 Activities, for all 30 Subjects.