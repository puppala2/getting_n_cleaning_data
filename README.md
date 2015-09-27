Introduction:
======================================

This is the programming assignment for the third course in Data Science Coursera course. The assignment requires to download the data collected using Samsung smart phones by using 30 volunteers. The smart phones are equipped with the accelerometers and gyroscopes, which will generate the data when the 30 subjects are in 6 different activities. The task includes downloading the data, understand the requirements, understand the data structure, read the data into R data sets, clean the data, merge the data, generate tidy data, and finally generate the summary data.


For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

 
Downloading Data:
======================================

The data was downloaded from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is available in a .zip file. 

Understanding and Reading Data:
======================================

There are two datasets, 1) the training dataset - with about 70% of the population, and 2) the test dataset.
The metadata, explaining the variables and the structure of the data is provided in features, and features_info files.
The data files are space delimited, therefore used load.table dunction with sep=" " option. The data files did not include variable headers.
Index files to map the subjectID and Activity are provided in separate dfata files.

Cleaning Data:
======================================

Both the train and the test files had duplicate delimiters next to each other, due to which I had to use a text editor to clean the data using find/replace, before generating the data sets.
X_train had 561 variables and 7352 observations, X_test had 561 variables and 2947 observations.
Variable 556 has an un_necessary '(' which was manually deleted.
After reading the data into R, an aditional variable has been generated, which is removed in line 28.

Merging Data:
======================================

Before merging the train and the test data, merger the subjectID and activity index columns with the measured data, using cbind()
Merged test and train data using rbind()

Subsetting Data:
======================================

Manually identified the variables which are either 'mean' or 'Std Deviation' and created a column index vector.
Using the vactor extracted the required columns using select() from dplyr package.

Descriptive Activity Names and Column Names:
======================================

Generated char vector and cbind() to get the activity names. Deleted numeric vactor from the data frame.
Renamed column names using names()

Final Dataset and Statistical Measures:
======================================

To generate the mean values on the mean and std variables on subject and activity, used dplyr's broup_by().
Used summarize() with mean function to generate the final statistics. The final dataset is summary_df, with 88 columns and 180 rows.

Code book:
======================================

Code book with the name codebook.txt is provided with all the variables.