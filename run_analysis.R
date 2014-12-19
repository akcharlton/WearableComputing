setwd("C:/Users/Class/datasciencecoursera/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset")
library(dplyr)
library(tidyr)

## Read in the files:
activity_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")
subject_train <- read.table("./train/subject_train.txt")
activity_train <- read.table("./train/y_train.txt")
data_train <- read.table("./train/X_train.txt")
subject_test <- read.table("./test/subject_test.txt")
activity_test <- read.table("./test/y_test.txt")
data_test <- read.table("./test/X_test.txt")

## Convert to data frames
df_subj_tr <- tbl_df(subject_train)
df_act_tr <- tbl_df(activity_train)
df_data_tr <- tbl_df(data_train)
df_subj_test <- tbl_df(subject_test)
df_act_test <- tbl_df(activity_test)
df_data_test <- tbl_df(data_test)


## Remove original tables just converted to dataframes
rm("subject_train")
rm("activity_train")
rm("data_train")
rm("subject_test")
rm("activity_test")
rm("data_test")

## Name Columns
names(df_data_tr) <- features[,2]
names(df_subj_tr) <- "Subject"
names(df_act_tr) <- "Activity"
names(df_data_test) <- features[,2]
names(df_subj_test) <- "Subject"
names(df_act_test) <- "Activity"

## Merge columns of train files:
df_merged_tr <- data.frame(df_subj_tr, df_act_tr, df_data_tr)

##Merge columns of test files
df_merged_test <- data.frame(df_subj_test, df_act_test, df_data_test)

## Merge train and test files
merged_data <- rbind_list(df_merged_tr, df_merged_test)

## Select and combine only columns with "mean" or "std"
data <- select(merged_data, Subject, Activity, contains("mean"), contains("std"))

## Replace activity number with description
data$Activity <- activity_labels[data$Activity,2]

average <- data %>%
  gather(metric_type, value, -(c(Subject,Activity))) %>%
  group_by(Subject, Activity, metric_type) %>%
  summarize(mean(value))
