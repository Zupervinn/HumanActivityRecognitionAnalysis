# HumanActivityRecognitionAnalysis
Getting & Cleaning Data project - experiments

library(plyr) # Mutate & rename function
library(dplyr) # Mutate & rename function
library(reshape2) #melt & dcast function

######## reading and preparing files for analysis 


## reads the feature.txt file and turn it into a list so it can be used to rename x_train.
features <- read.table("features.txt") %>% select(V2) 
features <- features[, "V2"]
features <- as.vector(features) 

## reads subject_train.txt and renam column name to subject
## reads x_train.txt and rename all columns with list of names in features 
## reads y_train.txt and rename column name to activity 
sub_train <- read.table("subject_train.txt", col.names="subject")
x_train <- read.table("X_train.txt")
names(x_train)[1:561] <- features
y_train <- read.table("y_train.txt", col.names ="activity")

## reads subject_test.txt and renam column name to subject
## reads x_test.txt and renam all columns with list of names in features 
## reads y_test.txt and renamecolumn name to activity 
sub_test<- read.table("subject_test.txt", col.names="subject")
x_test<- read.table("X_test.txt")
names(x_test)[1:561] <- features
y_test<- read.table("y_test.txt", col.names ="activity")

######## merging data set above into 1 dataset


## merging subject_train.txt with y_train.txt 
## then merged it with x_train.txt
subtrain_x <- cbind(sub_train,y_train)
subtrain_xy <- cbind(subtrain_x, x_train)

## merging test_train.txt with y_test.txt 
## then merged it with x_test.txt
subtest_x <- cbind(sub_test, y_test)
subtest_xy <- cbind(subtest_x, x_test)

## merging subtest_xy and subtrain_xy to form 1 big dataset.
train_test<- rbind(subtest_xy,subtrain_xy)


######## Sorting Data: selecting only variable of interests using grepl function.

# selecting only variables names with mean() or std() in the variable name. Creating 2 data frame: 1 with mean() in variable name and 1 with std() in variable name.
newvars_mean <- train_test[,grepl("mean\\(\\)", names(train_test))]
newvars_std <- train_test[,grepl("std\\(\\)", names(train_test))]

# "subject" & "activity" column was omitted by previous script. subject_activity brings that data back.
# mean_sd combine ALL variables of interest. 
subject_activity <- train_test[,c(1,2)]
mean_std <- cbind(newvars_mean, newvars_std) 

# newdf merge all variables of interest placing subject and activity back into 1st and 2nd column 
newdf <- cbind(subject_activity,mean_std)


######## Replacing each value within activity column. 

# replacing 1 with WALKING, 2 with WALKING_UPSTAIRS, 3 with WALKING_DOWNSTAIRS, ETC. 
x <- mutate(newdf, activity = replace(activity, newdf$activity == 1, "WALKING"))
x2 <- mutate(x, activity = replace(activity, x$activity == 2, "WALKING_UPSTAIRS"))
x3<- mutate(x2, activity = replace(activity, x2$activity == 3, "WALKING_DOWNSTAIRS"))
x4<- mutate(x3, activity = replace(activity, x3$activity == 4, "SITTING"))
x5<- mutate(x4, activity = replace(activity, x4$activity == 5, "STANDING"))
x6<- mutate(x5, activity = replace(activity, x5$activity == 6, "LAYING"))

# changing x6 to a more meaningful name.
tidydata<- x6 


######## Finding average of each variable for each activity and each subject.

# melt function and set subject and activity as ID and remaining columns as measured variables.
melt<- melt(tidydata, id=c("subject", "activity"), measure.vars= names(tidydata[3:68]) )

# using dcast to get the mean of all the variables and arranging subject and activity in ascending orders. 
tidydata_mean<- dcast(melt, subject + activity ~variable, mean)
