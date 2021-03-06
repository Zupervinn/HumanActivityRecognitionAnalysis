library(plyr)
library(dplyr)
library(data.table)
library(tidyr)
library(reshape2)

features <- read.table("features.txt") %>% select(V2) 
features <- features[, "V2"]
features <- as.vector(features) 

sub_train <- read.table("subject_train.txt", col.names="subject")
x_train <- read.table("X_train.txt")
names(x_train)[1:561] <- features
y_train <- read.table("y_train.txt", col.names ="activity")

sub_test<- read.table("subject_test.txt", col.names="subject")
x_test<- read.table("X_test.txt")
names(x_test)[1:561] <- features
y_test<- read.table("y_test.txt", col.names ="activity")

subtrain_x <- cbind(sub_train,y_train)
subtrain_xy <- cbind(subtrain_x, x_train)


subtest_x <- cbind(sub_test, y_test)
subtest_xy <- cbind(subtest_x, x_test)

train_test<- rbind(subtest_xy,subtrain_xy)

newvars_mean <- train_test[,grepl("mean\\(\\)", names(train_test))]
newvars_std <- train_test[,grepl("std\\(\\)", names(train_test))]

subject_activity <- train_test[,c(1,2)]
mean_std <- cbind(newvars_mean, newvars_std) 

newdf <- cbind(subject_activity,mean_std)

x <- mutate(newdf, activity = replace(activity, newdf$activity == 1, "WALKING"))
x2 <- mutate(x, activity = replace(activity, x$activity == 2, "WALKING_UPSTAIRS"))
x3<- mutate(x2, activity = replace(activity, x2$activity == 3, "WALKING_DOWNSTAIRS"))
x4<- mutate(x3, activity = replace(activity, x3$activity == 4, "SITTING"))
x5<- mutate(x4, activity = replace(activity, x4$activity == 5, "STANDING"))
x6<- mutate(x5, activity = replace(activity, x5$activity == 6, "LAYING"))

tidydata<- x6 

melt<- melt(tidydata, id=c("subject", "activity"), measure.vars= names(tidydata[3:68]) )

tidydata_mean<- dcast(melt, subject + activity ~variable, mean)
