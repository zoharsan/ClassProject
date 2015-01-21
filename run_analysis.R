#run_analysis.R
#Coursera Project

#Set the working directory to the root of the data set
#This step is optional and may need to be customized to point
#to the Samsung dataset root directory but
#allows the script to run with relative paths from now on
setwd("D:/Rwd/Project03/Dataset")

#Read the test data set subject into a data frame
df_test_subject<-read.table("test/subject_test.txt")

#Read the activity labels for the test data set into a data frame
df_activity_labels<-read.table("test/y_test.txt")

#Read actual test data set into a data frame
df_test_dataset<-read.table("test/X_test.txt")

#Merging subjects and activity labels into a single DF
df_test_ds<-cbind(df_test_subject,df_activity_labels)

#Merging complete test data set into data frame
df_test_ds<-cbind(df_test_dataset,df_test_ds)

#Read the training data set subject into a data frame
df_train_subject<-read.table("train/subject_train.txt")

#Read the activity labels for the training data set into a data frame
df_activity_labels<-read.table("train/y_train.txt")

#Read actual training data set into a data frame
df_train_dataset<-read.table("train/X_train.txt")

#Merging subjects and activity labels into a single DF
df_training_ds<-cbind(df_train_subject,df_activity_labels)

#Merging complete training data set into data frame
df_training_ds<-cbind(df_train_dataset,df_training_ds)

#Merge both test and training data sets into a single data set
#STEP 1 OF PROJECT COMPLETE AT THIS STAGE
df_merged_ds<-rbind(df_test_ds,df_training_ds)

#Loading features info into a df
df_features_info<-read.table("features.txt")

#Subsetting vector for mean features info into a df
df_features_mean<-df_features_info[c(grepl("mean",df_features_info$V2)),]
#Need to cleanup meanFreq values
df_features_mean<-df_features_mean[c(!grepl("meanFreq",df_features_mean$V2)),]

#Subsetting vector for std features info into a df
df_features_std<-df_features_info[(grepl("std",df_features_info$V2)),]

#Merging both std and mean features vector
df_features_extract<-rbind(df_features_mean,df_features_std)

#Using features df above to extract relevant mean and std columns from df
#Keeping columns related to subject and activity for following steps
#STEP 2 OF PROJECT COMPLETE AT THIS STAGE
df_mean_std_extract<-df_merged_ds[,c(df_features_extract$V1,562,563)]

#Loading activity labels into a df
df_activity_labels<-read.table("activity_labels.txt")

#Merging activity_labels with previous data frame to label each activity appropreiately
#Note V1.2 column represents the activity label number in original data set, and V1 represents 
#the activity label number in the activity labels df
#Also need to suppress the first column containing the numeric label value as a result of the
#merge. STEP 3 OF PROJECT COMPLETE AT THIS STAGE
df_act_label_ds=merge(x=df_mean_std_extract,y=df_activity_labels,by.x="V1.2",by.y="V1",all=TRUE)
df_act_label_ds<-df_act_label_ds[,-1]

#Appropriately labels the data set with descriptive variable names
#Reuse the data frame which already exists with descriptive variables names, 
#Clean-up names to remove special characters
#Replacing '-mean()' with 'Mean'
dfc1<-gsub('-mean\\(\\)','Mean',df_features_extract[,2])
#Replacing '-std()' with 'Std'
dfc2<-gsub('-std\\(\\)','Std',dfc2)
#Replacing '-' with '_'
dfc3<-gsub('-','_',dfc2)
#Adding labels for the last two columns Subject and Activity
dfc3[67:68]<-c("Subject","Activity")

#Assigning final labels vector to data frame column names
#STEP 4 OF PROJECT COMPLETE AT THIS STAGE
colnames(df_act_label_ds)<-dfc3

#For step 5, need to use dplyr
library("dplyr")

#Create aggregate group by Activity and Subject
df_aggr_ds<-group_by(df_act_label_ds,Activity,Subject)

#Use summarise_each to get a mean for each column based on previous group by
final_ds<-summarise_each(df_aggr_ds,funs(mean))

#Need to modify labels for final_fs
#Will do string manipulation on features label vector dfc3 created previously
#First remove the last 2 Subject and Activity columns

dfc4<-dfc3[-(67:68)]

#Now append MEAN_ to each measurement
dfc4<-paste("MEAN_",dfc4,sep='')

#Label each column correctly in the final dataset
#starting at column 3 since Activity and Mean have become first and second column
#STEP 5 COMPLETE AT THIS STAGE

colnames(final_ds)[3:68]<-dfc4

#Writing final data set to file
write.table(final_ds,"final_dataset_step5.txt",row.name=FALSE)
