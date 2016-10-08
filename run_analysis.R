## Tidy part 1

# Separating only the std and mean names from the features set
feature_col<- read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/features.txt")
requiredobs_features<-grep("std|mean",feature_col$V2)

## Tidy part 2

# Getting only the std and mean meaures from train dataset 
train_col<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/train/X_train.txt")
requiredObs_train<-train_col[,Requiredobs_features]
# Getting only the std and mean measures from test dataset
test_col<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/test/X_test.txt")
requiredObs_test<-test_col[,Requiredobs_features]

## Tidy part 3

# Now let us combine the two datasets
all_obs<-rbind (requiredObs_train,requiredObs_test)

## Tidy part 4

# Provide column names to combined datasets (all_obs)
colnames(all_obs)<-feature_col[requiredobs_features,2]

## Tidy part 5

# Read and combine the activity codes from the train and test datasets 
acticode_train<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/train/y_train.txt")
acticode_test<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/test/y_test.txt")
acticode_all<-rbind(acticode_train,acticode_test)

## Tidy part 6

# Read the activity labels and attach to activity codes
label_act<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/activity_labels.txt")
acticode_all$activity<-factor(acticode_all$V1,levels = label_act$V1,labels = label_act$V2)

## Tidy part 7

# Read subject Ids from train and test datasets and combine them
subj_train<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/train/subject_train.txt")
subj_test<-read.table("F:/BENHUR FOLDER/Coursera/Getting and Cleaning data/UCI HAR Dataset/test/subject_test.txt")
subj_all<-rbind(subj_train,subj_test)

## Tidy part 8

# Adding activity column values to subjects ID (subj_all) and give names to both
subj_act<-cbind(subj_all,acticode_all$activity)
colnames(subj_act)<-c("subject_ID","activity")

## Tidy part 9

#Combine the desired datasets
#Finding the mean of measures of interest in the combined data which is grouped by each activity and subject ID
#created a txt file for the new output
combined_data<-cbind(subj_act,all_obs)
Output_data <- aggregate(combined_data[,3:81], by = list(combined_data$subject_ID, combined_data$activity), FUN = mean)
colnames(Output_data)[1:2]<-c("subject_ID","activity")
write.table(Output_data,file="mean_result.txt",row.names = FALSE)


