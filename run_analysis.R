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
y_train <- read.table("y_train.txt", col.names ="training_labels")

subtrain_x <- cbind(sub_train,y_train)
subtrain_xy <- cbind(subtrain_x, x_train)


sub_test<- read.table("subject_test.txt", col.names="subject")
x_test<- read.table("X_test.txt")
names(x_test)[1:561] <- features
y_test<- read.table("y_test.txt", col.names ="training_labels")

subtest_x <- cbind(sub_test, y_test)
subtest_xy <- cbind(subtest_x, x_test)

train_test<- rbind(subtest_xy,subtrain_xy)

newvars_mean <- train_test[,grepl("mean\\(\\)", names(train_test))] #refer to regular expression to explain the \\"
newvars_std <- train_test[,grepl("std\\(\\)", names(train_test))]

subject_traininglabels <- train_test[,c(1,2)]
mean_std <- cbind(newvars_mean, newvars_std) 


newdf <- cbind(subject_traininglabels,mean_std)

x <- mutate(newdf, training_labels = replace(training_labels, newdf$training_labels == 1, "WALKING"))
x2 <- mutate(x, training_labels = replace(training_labels, x$training_labels == 2, "WALKING_UPSTAIRS"))
x3<- mutate(x2, training_labels = replace(training_labels, x2$training_labels == 3, "WALKING_DOWNSTAIRS"))
x4<- mutate(x3, training_labels = replace(training_labels, x3$training_labels == 4, "SITTING"))
x5<- mutate(x4, training_labels = replace(training_labels, x4$training_labels == 5, "STANDING"))
x6<- mutate(x5, training_labels = replace(training_labels, x5$training_labels == 6, "LAYING"))

x6<- rename(x6, activity=training_labels)

new_act_name <- x6 

new_act_name
