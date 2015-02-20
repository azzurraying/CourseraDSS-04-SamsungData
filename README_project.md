README

1. The zipped data folder was downloaded and unzipped into the current directory.

2. Going into respective folders, the supporting data, test data and train data were respectively read into R.

3. The following columns are bound together to create a combined dataset:
** Subject IDs (30 in all)
** Types activities performed (6 in all)
** Measured variables (in 561 columns)

4. Tidy up the combined dataframe in 3.
** Sort the rows in order of Subjects, so that Subject 1's data come in the 1st block, etc.
** Create a subset of the dataframe, consisting only of the column variables that contain mean() or std() information.
** Name the column headings.

5. Calculate the mean of each variable (column) for each Activity performed by all Subjects.
** Break up the dataset by Subjects.
** For each subject, calculate the mean of each variable corresponding to all 6 activities.
** Loop through all subjects and repeat.
** A matrix of 6 Activities * 30 Subjects is created.

6. Create tidy dataset
** Convert the matrix of mean values into a dataframe.
** Label the 6 Activity types / Labels with descriptive names.
** Name all variables with corresponding column headings.
** Write to file.