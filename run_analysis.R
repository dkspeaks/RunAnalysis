# Run Analysis on Human Activity Recognition Using Smartphones Dataset
# Reading Training Data 
setwd("C:/Documents and Settings/Administrator/Desktop/RWork/Datacleaning/UCI HAR Dataset/train")
 Train_subject <- read.table("subject_train.txt")
Train_set <- read.table("X_train.txt")
Train_labels <- read.table("y_train.txt")


# Reading Test Data 
setwd("C:/Documents and Settings/Administrator/Desktop/RWork/Datacleaning/UCI HAR Dataset/test")
Test_subject <- read.table("subject_test.txt")
Test_set <- read.table("X_test.txt")
Test_labels <- read.table("y_test.txt")

# Merging Data

Data_subject <- rbind(Train_subject,Test_subject)
Data_set <- rbind(Train_set, Test_set)
Data_labels <- rbind(Train_labels, Test_labels)



# Assigning Feature names to variables (561) of the data set
setwd("C:/Documents and Settings/Administrator/Desktop/RWork/Datacleaning/UCI HAR Dataset")
Featnames <- read.table("features.txt")
subFeatnames <- Featnames[1:561,2]
Colmnames <- subFeatnames[1:561]
names(Data_set) = Colmnames
Data_set[1,1:5]
# Subsetting Data with columns containing 'mean' or 'standard deviaton'

library(operators)

nwData_set <- subset(Data_set, select=colnames(Data_set) %~% "mean|std")

# Assigning descriptive names to activities


n <- nrow(Data_labels)
i <- 1
for (i in 1:n) {if(Data_labels[i,]=="1")
{Data_labels[i,]<-"Walking"}

if(Data_labels[i,]=="2")
{Data_labels[i,]<-"WALKING_UPSTAIRS"}

if(Data_labels[i,]=="3")
{Data_labels[i,]<-"WALKING_DOWNSTAIRS"}

if(Data_labels[i,]=="4")
{Data_labels[i,]<-"SITTING"}

if(Data_labels[i,]=="5")
{Data_labels[i,]<-"STANDING"}

if(Data_labels[i,]=="6")
{Data_labels[i,]<-"LAYING"}
i <- i+1
}

# Create a tidy data set with the average of each variable for each activity and each subject.

#Step 1 - Merging three data sets - Subject, Activity, Mean & Std values

DT1 <- cbind(Data_subject,Data_labels)
names(DT1) = c("Subject", "Activity")
DT2 <- cbind(DT1,nwData_set)
dim(DT2)
# Step 2 - Re-shaping merged data set in wide form

library(reshape2)
 mdata <- melt(DT2, id=c("Subject", "Activity"))
 AvgData <- dcast(mdata, Subject+Activity ~ variable, mean)
 
 # Final Tidy Data Set
 
 write.table(AvgData, file="C:/Documents and Settings/Administrator/Desktop/RWork/Datacleaning/run_TidyData.txt", row.names = FALSE)
 
