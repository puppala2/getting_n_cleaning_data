# run_analysis.R

library(dplyr)
# Merges the training and the test sets to create one data set.
setwd("C:/R study material/Data/UCI HAR Dataset")
curwd <- getwd()

activity_names_df <- read.table("activity_labels.txt", header = F, stringsAsFactors = F, sep = " ")
variable_names_df <- read.table("features.txt", header = F, stringsAsFactors = F, sep = " ")

subject_index_test_df <- read.table("./test/subject_test.txt", header = F, stringsAsFactors = F, sep = " ")
activity_index_test_df <- read.table("./test/y_test.txt", header = F, stringsAsFactors = F, sep = " ")
test_df <- read.table("./test/X_test.txt", header = F, stringsAsFactors = F, sep = " ")

names(subject_index_test_df) <- "subjectid"
names(activity_index_test_df) <- "activityid"
jj <- cbind(subject_index_test_df, activity_index_test_df)
test_df1 <- data.frame(test_df[,2:length(test_df)])
test_df1 <- cbind(jj, test_df1)

subject_index_train_df <- read.table("./train/subject_train.txt", header = F, stringsAsFactors = F, sep = " ")
activity_index_train_df <- read.table("./train/y_train.txt", header = F, stringsAsFactors = F, sep = " ")
train_df <- read.table("./train/X_train.txt", header = F, stringsAsFactors = F, sep = " ")

names(subject_index_train_df) <- "subjectid"
names(activity_index_train_df) <- "activityid"
kk <- cbind(subject_index_train_df, activity_index_train_df)
train_df1 <- data.frame(train_df[,2:length(train_df)])
train_df1 <- cbind(kk, train_df1)

total_df <- data.frame(rbind(train_df1, test_df1))

# Extracts only the measurements on the mean and standard deviation for each measurement. 

myvars <- c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,296,297,298,347,348,349,350,351,352,375,376,377,426,427,428,429,430,431,454,455,456,505,506,515,518,519,528,531,532,541,544,545,554,557,558,559,560,561,562,563)

subset_df <- select(total_df, myvars)

# Uses descriptive activity names to name the activities in the data set

actv_vect <- subset_df$activityid
actv_char <- vector(mode = "character", length = length(actv_vect))
for (i in 1:length(actv_vect)) {
  if (actv_vect[i] == 1) {actv_char[i] <- "WALKING"}
  else if (actv_vect[i] == 2) {actv_char[i] <- "WALKING_UPSTAIRS"}
  else if (actv_vect[i] == 3) {actv_char[i] <- "WALKING_DOWNSTAIRS"}
  else if (actv_vect[i] == 4) {actv_char[i] <- "SITTING"}
  else if (actv_vect[i] == 5) {actv_char[i] <- "STANDING"}
  else if (actv_vect[i] == 6) {actv_char[i] <- "LAYING"}
}

subset_df <- cbind(actv_char, subset_df)

subset_df <- select(subset_df, -3)

# Appropriately labels the data set with descriptive variable names. 

names(subset_df) <- c("actv_char", "subjectid",
                      "Time_Body_Accelerate_Mean_X",
                      "Time_Body_Accelerate_Mean_Y",
                      "Time_Body_Accelerate_Mean_Z",
                      "Time_Body_Accelerate_Stdv_X",
                      "Time_Body_Accelerate_Stdv_Y",
                      "Time_Body_Accelerate_Stdv_Z",
                      "Time_Gravity_Accelerate_Mean_X",
                      "Time_Gravity_Accelerate_Mean_Y",
                      "Time_Gravity_Accelerate_Mean_Z",
                      "Time_Gravity_Accelerate_Stdv_X",
                      "Time_Gravity_Accelerate_Stdv_Y",
                      "Time_Gravity_Accelerate_Stdv_Z",
                      "Time_Body_Accelerate_Jerk_Mean_X",
                      "Time_Body_Accelerate_Jerk_Mean_Y",
                      "Time_Body_Accelerate_Jerk_Mean_Z",
                      "Time_Body_Accelerate_Jerk_Stdv_X",
                      "Time_Body_Accelerate_Jerk_Stdv_Y",
                      "Time_Body_Accelerate_Jerk_Stdv_Z",
                      "Time_Body_Gyro_Mean_X",
                      "Time_Body_Gyro_Mean_Y",
                      "Time_Body_Gyro_Mean_Z",
                      "Time_Body_Gyro_Stdv_X",
                      "Time_Body_Gyro_Stdv_Y",
                      "Time_Body_Gyro_Stdv_Z",
                      "Time_Body_Gyro_Jerk_Mean_X",
                      "Time_Body_Gyro_Jerk_Mean_Y",
                      "Time_Body_Gyro_Jerk_Mean_Z",
                      "Time_Body_Gyro_Jerk_Stdv_X",
                      "Time_Body_Gyro_Jerk_Stdv_Y",
                      "Time_Body_Gyro_Jerk_Stdv_Z",
                      "Time_Body_Accelerate_Magnitude_Mean",
                      "Time_Body_Accelerate_Magnitude_Stdv",
                      "Time_Gravity_Accelerate_Magnitude_Mean",
                      "Time_Gravity_Accelerate_Magnitude_Stdv",
                      "Time_Body_Accelerate_Jerk_Magnitude_Mean",
                      "Time_Body_Accelerate_Jerk_Magnitude_Stdv",
                      "Time_Body_Gyro_Magnitude_Mean",
                      "Time_Body_Gyro_Magnitude_Stdv",
                      "Time_Body_Gyro_Jerk_Magnitude_Mean",
                      "Time_Body_Gyro_Jerk_Magnitude_Stdv",
                      "Freq_Body_Accelerate_Mean_X",
                      "Freq_Body_Accelerate_Mean_Y",
                      "Freq_Body_Accelerate_Mean_Z",
                      "Freq_Body_Accelerate_Stdv_X",
                      "Freq_Body_Accelerate_Stdv_Y",
                      "Freq_Body_Accelerate_Stdv_Z",
                      "Freq_Body_Accelerate_Mean_Freq_X",
                      "Freq_Body_Accelerate_Mean_Freq_Y",
                      "Freq_Body_Accelerate_Mean_Freq_Z",
                      "Freq_Body_Accelerate_Jerk_Mean_X",
                      "Freq_Body_Accelerate_Jerk_Mean_Y",
                      "Freq_Body_Accelerate_Jerk_Mean_Z",
                      "Freq_Body_Accelerate_Jerk_Stdv_X",
                      "Freq_Body_Accelerate_Jerk_Stdv_Y",
                      "Freq_Body_Accelerate_Jerk_Stdv_Z",
                      "Freq_Body_Accelerate_Jerk_Mean_Freq_X",
                      "Freq_Body_Accelerate_Jerk_Mean_Freq_Y",
                      "Freq_Body_Accelerate_Jerk_Mean_Freq_Z",
                      "Freq_Body_Gyro_Mean_X",
                      "Freq_Body_Gyro_Mean_Y",
                      "Freq_Body_Gyro_Mean_Z",
                      "Freq_Body_Gyro_Stdv_X",
                      "Freq_Body_Gyro_Stdv_Y",
                      "Freq_Body_Gyro_Stdv_Z",
                      "Freq_Body_Gyro_Mean_Freq_X",
                      "Freq_Body_Gyro_Mean_Freq_Y",
                      "Freq_Body_Gyro_Mean_Freq_Z",
                      "Freq_Body_Accelerate_Magnitude_Mean",
                      "Freq_Body_Accelerate_Magnitude_Stdv",
                      "Freq_Body_Accelerate_Magnitude_Mean_Freq",
                      "Freq_BodyBody_Accelerate_Jerk_Magnitude_Mean",
                      "Freq_BodyBody_Accelerate_Jerk_Magnitude_Stdv",
                      "Freq_BodyBody_Accelerate_Jerk_Magnitude_Mean_Freq",
                      "Freq_BodyBody_Gyro_Magnitude_Mean",
                      "Freq_BodyBody_Gyro_Magnitude_Stdv",
                      "Freq_BodyBody_Gyro_Magnitude_Mean_Freq",
                      "Freq_BodyBody_Gyro_Jerk_Magnitude_Mean",
                      "Freq_BodyBody_Gyro_Jerk_Magnitude_Stdv",
                      "Freq_BodyBody_Gyro_Jerk_Magnitude_Mean_Freq",
                      "Time_Body_Accelerate_Mean_Gravity_Angle",
                      "Time_Body_Accelerate_Jerk_Mean_Gravity_Mean_Angle",
                      "Time_Body_Gyro_Mean_Gravity_Mean_Angle",
                      "Time_Body_Gyro_Jerk_Mean_Gravity_Mean_Angle",
                      "Gravity_Mean_Angle_X",
                      "Gravity_Mean_Angle_Y",
                      "Gravity_Mean_Angle_Z"
)


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

grp_by_df <- group_by(subset_df, subjectid, actv_char)
summary_df <- summarize(grp_by_df, Time_Body_Accelerate_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Gravity_Accelerate_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_Freq_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_Freq_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Mean_Freq_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_Freq_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_Freq_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Jerk_Mean_Freq_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Stdv_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Stdv_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Stdv_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_Freq_X =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_Freq_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Gyro_Mean_Freq_Z =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_Body_Accelerate_Magnitude_Mean_Freq =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Accelerate_Jerk_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Accelerate_Jerk_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Accelerate_Jerk_Magnitude_Mean_Freq =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Magnitude_Mean_Freq =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Jerk_Magnitude_Mean =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Jerk_Magnitude_Stdv =  mean(Time_Body_Accelerate_Mean_X),
                        Freq_BodyBody_Gyro_Jerk_Magnitude_Mean_Freq =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Mean_Gravity_Angle =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Accelerate_Jerk_Mean_Gravity_Mean_Angle =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Mean_Gravity_Mean_Angle =  mean(Time_Body_Accelerate_Mean_X),
                        Time_Body_Gyro_Jerk_Mean_Gravity_Mean_Angle =  mean(Time_Body_Accelerate_Mean_X),
                        Gravity_Mean_Angle_X =  mean(Time_Body_Accelerate_Mean_X),
                        Gravity_Mean_Angle_Y =  mean(Time_Body_Accelerate_Mean_X),
                        Gravity_Mean_Angle_Z =  mean(Time_Body_Accelerate_Mean_X)
)
