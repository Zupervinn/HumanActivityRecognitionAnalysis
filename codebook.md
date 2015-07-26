

                              Data Dictionary - Run_Analysis of Human Activity Recognition Using Smartphones Dataset
						   
Summary: 180 rows 68 columns
There are 30 people performing 6 unique activities. Each person is listed 6 times - once for each activity. The variable of interests are the mean & standard deviation of the data collected by the smartphone. 


							   Below are list of all the variables broken down into 2 sets:
==========================================================================================================================================
NOTE: I had chosen to keep the variable names unchanged from the original "features.txt" file. Below is a list explaining each abbreviation.
==========================================================================================================================================
Acc = acceleration
Gyro = gyroscope 3-axial raw signal
t = time at constant rate of 50 hz
f = indicate frequency domain signals
Body = body
Gravity = gravity
Jerk = linear acceleration & angular velocity
Mag = magnitude 3 - dimensional signals
X,Y,Z = 3-axial signals in these directions. IE subject moving in X direction. 
							   
1.) List of ID variables:
subject - list of 1 to 30. Each number is used as an identifier for the person in the experiment.
activity - list of 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

2.) List of measured variables:
tBodyAcc-mean()-X           
tBodyAcc-mean()-Y          
tBodyAcc-mean()-Z           
tGravityAcc-mean()-X        
tGravityAcc-mean()-Y        
tGravityAcc-mean()-Z       
tBodyAccJerk-mean()-X       
tBodyAccJerk-mean()-Y       
tBodyAccJerk-mean()-Z       
tBodyGyro-mean()-X         
tBodyGyro-mean()-Y          
tBodyGyro-mean()-Z          
tBodyGyroJerk-mean()-X      
tBodyGyroJerk-mean()-Y     
tBodyGyroJerk-mean()-Z      
tBodyAccMag-mean()         
tGravityAccMag-mean()       
tBodyAccJerkMag-mean()     
tBodyGyroMag-mean()         
tBodyGyroJerkMag-mean()     
fBodyAcc-mean()-X           
fBodyAcc-mean()-Y          
fBodyAcc-mean()-Z           
fBodyAccJerk-mean()-X       
fBodyAccJerk-mean()-Y       
fBodyAccJerk-mean()-Z      
fBodyGyro-mean()-X          
fBodyGyro-mean()-Y          
fBodyGyro-mean()-Z          
fBodyAccMag-mean()         
fBodyBodyAccJerkMag-mean()  
fBodyBodyGyroMag-mean()     
fBodyBodyGyroJerkMag-mean() 
tBodyAcc-std()-X           
tBodyAcc-std()-Y            
tBodyAcc-std()-Z           
tGravityAcc-std()-X        
tGravityAcc-std()-Y        
tGravityAcc-std()-Z        
tBodyAccJerk-std()-X        
tBodyAccJerk-std()-Y        
tBodyAccJerk-std()-Z       
tBodyGyro-std()-X           
tBodyGyro-std()-Y           
tBodyGyro-std()-Z           
tBodyGyroJerk-std()-X      
tBodyGyroJerk-std()-Y      
tBodyGyroJerk-std()-Z      
tBodyAccMag-std()          
tGravityAccMag-std()       
tBodyAccJerkMag-std()      
tBodyGyroMag-std()         
tBodyGyroJerkMag-std()    
fBodyAcc-std()-X           
fBodyAcc-std()-Y          
fBodyAcc-std()-Z           
fBodyAccJerk-std()-X       
fBodyAccJerk-std()-Y       
fBodyAccJerk-std()-Z       
fBodyGyro-std()-X          
fBodyGyro-std()-Y          
fBodyGyro-std()-Z          
fBodyAccMag-std()          
fBodyBodyAccJerkMag-std()   
fBodyBodyGyroMag-std()      
fBodyBodyGyroJerkMag-std() 
==========================================================================================================================================

									       Explanation of the Data
										   
The output of run_analysis.R is a tidy dataset consisting of 180 observations and 68 different variables. The values are mean of the mean or mean of the standard deviation from data collected while the identifier performs each activity.

The ID variables are "subject" and "activity" located at the 1st and 2nd column of the dataset. 
The subject column consists of 30 subjects(people wearing the Galaxy SmartPhone in the experiment). Each of the 30 people were to perform 6 different activities and these activities are listed under "activity".
The subject column shows each identifier 6 times - each time performing a different activity. There are 30 unique identifiers and 6 activities which gives us 180 total possible observations. 

The measured variables are spread out starting from column 3 and ends in column 68. Each each value is the mean of the mean or mean of the standard deviation from data collected while Y person is performing X activity. 
For example, row 1 shows subject 1 performing activity "laying" (column 1 - 2). Column 3 shows mean of the mean from time body acceleration in direction X. Moving forward to to column 36 since column 3 to 35 is also the mean of the mean.
Starting from column 36 to 68 is the mean of the standard deviation. Column 36 shows mean of the standard deviation from time body acceleration in direction X. 
Note: A way to differentiate between mean of mean and mean of standard deviation is the mean() or std() towards the end of each variable.

===========================================================================================================================================
										    Raw data to tidy data transformation
1.) Merged training set with test set.
2.) Selected only the variables of interests: the mean or standard deviation. 
3.) Renamed each number in activity with description names and each variables with names in "features.txt"
4.) Mean of mean or mean of standard deviation for each subject and each activity is calculated.






