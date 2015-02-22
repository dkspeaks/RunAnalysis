# RunAnalysis
Run Analysis on Human Activity Recognition Using Smartphones Dataset
==================================================================
Steps to go from Raw Data to Tidy Data

1. These files from the Training data set were read into R and saved
	subject_train.txt - Train_subject
	X_train.txt - Train_set 
	y_train.txt - Train_labels
	
2. These files from the Test data set were read into R and saved
	subject_test.txt - Test_subject
	X_test.txt - Test_set 
	y_test.txt - Test_labels
	
3. Files from the test and train datasets were Merged using Rbind to create
		Data_subject = Train_subject + Test_subject
		Data_set = Train_set + Test_set
		Data_labels = Train_labels + Test_labels
		
4. Feature names were extracted from the Test_labels dataset to assign column names to the 561 variables.
	This changes the column names from V1 to tBodyAcc-mean()-X and so on.
	
5. The merged and renamed dataset is sub-setted to extract variables pertaining to 'mean' or 'standard deviation'.
	The assumption is that the requirement is to extract all the variables that have the term 'mean' or 'standard deviation' in them.
	The sub-setting has been done using the %~% operator which does a column name match.
	79 columns were extracted through this.
	
6.  Descriptive names were assigned to the Data_labels dataset.
	1 is renamed as WALKING , 2 as WALKING_UPSTAIRS and so on using IF condition.
	
7. The three datasets (Data_subject, Data_set , Data_labels) were merged into a single dataframe using cbind.

8. The final dataset was re-shaped in Wide form as per Tidy data principles.
	melt and dcast functions were used to derive average(mean) values for combinations of each subject and activity.
	
9. Final dataset was written to a text file using write.table function in .txt format.


	
	
