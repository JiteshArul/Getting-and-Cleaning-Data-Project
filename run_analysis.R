library("dplyr")

##Reading and labeling 
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
x_test<-read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE)
features<-read.table("UCI HAR Dataset/features.txt",header = FALSE)
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE,col.names = "subject")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE,col.names = "subject")
names(x_train)<-features[,2]
names(x_test)<-features[,2]
datas<-rbind(x_train,x_test)
values<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
names(values)<-c("Activity")
activities<-read.table("activity_labels.txt",col.names = c("code","activity"))
for(i in activities$code){
  values$Activity<-replace(values$Activity,values$Activity==i,activities$activity[activities$code==i])
}
##merge training and testing data sets
complete_data<-cbind(subject,values,datas)

##Extract only mean and std for each measurement
tidy <- complete_data %>% select(subject, Activity, contains("mean"), contains("std"))

##Appropriately labels the data set with descriptive variable names.
names(tidy)[2]<-"activity"
names(tidy)<-gsub("Acc","Accelerometer",names(tidy))
names(tidy)<-gsub("Gyro","Gyroscope",names(tidy))
names(tidy)<-gsub("BodyBody","Body",names(tidy))
names(tidy)<-gsub("Mag","Magnitude",names(tidy))
names(tidy)<-gsub("^t","Time",names(tidy))
names(tidy)<-gsub("^f","Frequency",names(tidy))
names(tidy)<-gsub("tBody","TimeBody",names(tidy))
names(tidy)<-gsub("angle","Angle",names(tidy))
names(tidy)<-gsub("gravity","Gravity",names(tidy))

##Creating final Summarized Data
final_data<- tidy %>% group_by(subject,activity) %>% summarise_all(funs(mean))
write.table(final_data,"FinalData.txt",row.names = FALSE)
