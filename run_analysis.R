# Submit:
# run_analysis R script
# A ReadMe markdown document on what was done to achieve a tidy dataset
# A Codebook markdown document describing what each variable means
# A tidy data text file

############################
# Download supporting data #
############################

# Use "downloader" package to decompress file.
install.packages("downloader")
library(downloader)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip <- download.file(fileURL, destfile = "./Dataset.zip", method = "curl")
dateDownloaded <- date()
# Unzips into current directory
unzip("dataset.zip", exdir = "./")

setwd("/Users/yingjiang/Dropbox/Education/Coursera/Data_science_C3/Project/UCI HAR Dataset")
act_label <- read.table("activity_labels.txt")
features <- read.table("features.txt")
time_var_names <- as.character(features$V2)

######################
# Download Test data #
######################

setwd("/Users/yingjiang/Dropbox/Education/Coursera/Data_science_C3/Project/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt", col.names = "Subject")
time_freq_domain <- read.table("X_test.txt", col.names = time_var_names)
act_index <- read.table("y_test.txt", col.names = "Activity label")
# Create the preliminary "test" dataset.
testdata <- cbind(subject_test, time_freq_domain, act_index)

# Convert Subject and Activity into factors.
testdata$Subject <- as.factor(subject_test$Subject)
testdata$Activity.label <- as.factor(act_index$Activity.label)
# Retain integer, instead of using descriptive labels, for activities, for now,
levels(testdata$Activity.label) <- as.character(act_label$V1)

#######################
# Download Train data #
#######################

# Same procedures as downloading test data.
setwd("/Users/yingjiang/Dropbox/Education/Coursera/Data_science_C3/Project/UCI HAR Dataset/train")
subject_tr <- read.table("subject_train.txt", col.names = "Subject")
time_freq_domain_tr <- read.table("X_train.txt", col.names = time_var_names)
act_index_tr <- read.table("y_train.txt", col.names = "Activity label")

traindata <- cbind(subject_tr, time_freq_domain_tr, act_index_tr)
traindata$Subject <- as.factor(subject_tr$Subject)
traindata$Activity.label <- as.factor(act_index_tr$Activity.label)
levels(traindata$Activity.label) <- as.character(act_label$V1)

#########################################################
# Extract the desired variables and compute their means #
#########################################################

# Combine test and train data into 1 dataframe.
combineddata <- rbind(testdata, traindata)
# Sort the rows by Subjects. Now we have data for Subjects 1-30 in order.
# Note: intersect(testdata$Subject, traindata$Subject) returns 0 bc the 2 datasets contain different Subjects.
combineddata_sort <- combineddata[order(as.numeric(as.character(combineddata$Subject))), ]

# Get the relevant variables, ie, mean and stdev columns from the features list.
mean_colindex <- grep("mean()", time_var_names, fixed = T) # Reminder: time_var_names is features$V2
stdev_colindex <- grep("std()", time_var_names)
# Get the relevant column indices and variable names.
meanstd_colindex <- sort(c(mean_colindex, stdev_colindex))
meanstd_colnames <- as.character(features$V2[meanstd_colindex])
# Create dataframe of the relevant variables for all Subjects and Activities.
combineddata_meanstd <- cbind(combineddata_sort$Subject, combineddata_sort$Activity, combineddata_sort[, meanstd_colindex+1])
colnames(combineddata_meanstd) <- c("Subject", "Activity", meanstd_colnames)

# Get the numbers of Subjects and Activity types.
# lev_sub <- levels(combineddata_meanstd$Subject)
lev_sub <- c(1:30)
lev_act <- levels(combineddata_meanstd$Activity)

# Split data by Subject. Creates a list with lev_sub elements.
# sub_split[[i]] to blocks of [[length(lev_sub)]], each containing a dataframe.
sub_block <- split(combineddata_meanstd, combineddata_meanstd$Subject)

# Make empty matrices to store Activity averages and Subject-activity overall averages.
empty_act <- matrix(nrow = length(lev_act), ncol = length(meanstd_colindex)+1)
empty_sub <- array(data = NA, dim = c(0, length(meanstd_colindex)+2))

for(i in 1:length(lev_sub)) {
    # Subset columns from the dataframe: [, 3:end]
    # Split by the Activity column of the dataframe sub_split[[1]].
    # Do colmeans to columns [, 3:end].
    # Creates 6x79 mean variable values, corresponding to the 6 activity levels and 79 variables. This is stored in a list of row vectors.
    sub_actmean_block <- by(sub_block[[i]][, 3:length(sub_block[[i]])], sub_block[[i]]$Activity, colMeans, simplify = TRUE)
    for(j in 1:length(lev_act)) {
        # Given the current Subject,
        # Create a vector consisting: current Activity type, means of each variable (column) corresponding to that Activity
        # Store the row in an empty matrix.
        empty_act[j, ] <- c(lev_act[j], sub_actmean_block[[j]])
    }
    # Create an array of variable means for all Activities for the current Subject.
    sub_block2 <- cbind(rep(lev_sub[i], length(lev_act)), empty_act)
    # Add the array onto the existing data.
    empty_sub <- rbind(empty_sub, sub_block2)
}

##########################
# Construct tidy dataset #
##########################

# Convert the array from the loops, which is in characters, into a dataframe.
# By default the strings will be coerced to factors.
datamean <- as.data.frame(empty_sub)
# Re-add column names.
colnames(datamean) <- c("Subject", "Activity", meanstd_colnames)
# Assign descriptive text as factor levels instead to replace the integers.
levels(datamean$Activity) <- as.character(act_label$V2)
# Re-convert data into numeric.
for(i in 3:ncol(datamean)) {
    datamean[, i] <- as.numeric(as.character(datamean[, i]))
}

##############################
# Write tidy dataset to file #
##############################

write.table(datamean, "Samsung_tidy_data.txt", sep = "\t", row.names=FALSE)
# csv file looks neater.
write.csv(datamean, "Samsung_tidy_data.csv", row.names = FALSE)