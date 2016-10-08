How to get the data and repeat the work done in this project
1. Download the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Unzip the data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and put it to your working directory
3. Execute the script stored in run_analysis.R

Steps Used

Many steps were used to tidy the datasets in different files and combine them into the desired result which is tidy and have columns of
students id,activities and means of all the measures of interest

Tidy part 1
Get feature names and separate only the std and mean measures from the features set

Tidy part 2
Get only the std and mean meaures from train and train feature datasets

Tidy part 3
combine the two datasets into one dataset

Tidy part 4
Provide column names to combined datasets

Tidy part 5
Read and combine the activity codes from the train and test datasets

Tidy part 6
Read the activity labels and attach to activity codes

Tidy part 7
Read subject Ids from train and test datasets and combine them

Tidy part 8
Add activity column to subjects ID and name the two columns

Tidy part 9
Combine the desired dataset with measures of interest which is grouped by subject_ID and activity

Result
The dataset is now ready for analysis and compute the mean of all measures of interest



