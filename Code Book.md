**run_analysis.R** script file is used for loading and cleaning the data as required by the Project Assignment Description

1.  ***Downloading and Extracting the Dataset***

    The data is downloaded from the link provided and loaded in the UCI HAR Dataset Folder.

2.  ***Variable Assignment***

    Load the data to the variables from the below shown files

    `x_train`\<-`train\X_train.txt`

    `x_test`\<-`test\X_test.txt`

    `y_train`\<-`train\y_train.txt`

    `y_test`\<-`test\y_test.txt`

    `features`\<-`features.txt`

    `subject_train`\<-`train\subject_train.txt`

    `subject_test`\<-`test\subject_test.txt`

    `activities`\<-`activity_labels.txt`

3.  ***Activities code to Activities names***

    All the activities code have been appropriately changed to their respective names by using the data from `activity_label.txt` saved in `activities` variable

4.  ***Merging Training and Testing Data***

    `datas`\<-`x_train` + `x_test`

    `values`\<-`y_train` + `y_test`

    `subject`\<-`subject_train`+ `subject_test`

    `complete_data` \<- `subject` + `values` + `datas`

5.  ***Extracting mean and Standard Deviation for each measurement***

    `tidy`variable has been created to store only the -mean and -std extension to the column name of the `complete_data`

6.  ***Re-labeling variable names***

    The following column names have been expanded to make clear sense

    -   Acc - Accelerometer

    -   Gyro - Gyroscope

    -   BodyBody - Body

    -   Mag - Magnitude

    -   t - Time

    -   f - Frequency

    -   tBody - TimeBody

    -   angle - Angle

    -   gravity - Gravity

7.  ***Creating FinalData.txt***

    Create the `final_data` variable by grouping and summarizing the `tidy` variable. Write the `FinalData.txt` from the `final_data` variable.
