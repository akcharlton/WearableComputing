The file run_analysis.R reads 8 text files as input:
1. activity_labels.txt- 6 x 2 matrix with 1:6 in first column and description in second column.
    Read into activity_labels.
2. features.txt - 561 x 1 matrix - each of the 561 metrics observed or calculated.
    Read into features.
3. subject_train.txt - 7352 x 1 matrix with subject # (1:30) performing activity in 70% observations in train category.
    Read into subject_train, converted to data frame df_subject_tr.
4. activity_train.txt - 7352 x 1 matrix with activity # (1:6) in 70% observations in train category.
    Read into activity_train, converted to data frame df_act_tr.
5. data_train.txt - 7352 x 561 matrix - 561 measurements for 7352 observations.
    Uses subject_train and activity_train to specifify subject and activity. Part of 70% in train category.
    Read into data_train, converted to data frame df_data_tr.
6. subject_test.txt - 2947 x 1 matrix with subject # (1:30) performing activity in 30% observations in test category.
    Read into subject_test, converted to data frame df_subject_test.
7. activity_test.txt - 2947 x 1 matrix with activity # (1:6) in 30% observations in test category.
    Read into activity_test, converted to data frame df_act_test.
8. data_test.txt - 2947 x 561 matrix - 561 measurements for 2947 observations.
    Uses subject_test and activity_test to specifify subject and activity. Part of 30% in test category.
    Read into data_test, converted to data frame df_data_test.

The values in "features" are used to name columns in df_data_tr and df_data_test.
The columns in df_subject_tr and df_subject_test are named "Subject".
The columns in df_act_tr and df_act_test are named "Activity".

df_merged_tr - training data frames df_subj_tr, df_act_tr, and df_data_tr are merged together to the right of each.
df_merged_test - test data frames df_subj_test, df_act_test, and df_data_test are merged together to the right of each.
merged_data - data frames df_merged_tr and df_merged_test are merged together on top of each other.

data - subset of merged_data containing metrics with "mean" or "std" in the name.
      Activity # replaced by descriptive name.

average - a data frame which displays the mean value of the metric for each subject, activity, and metric.
      Data gathered so that metric type is a column name and grouped by subject, activity, and metric.
      Mean calculated on grouped data.
