#Project Information
##General
This code book contains information pertaining to the dataset present in the **tidy_data.txt** file located in this repo. The file contains data produced by the **run_analysis.R** script run on the dataset in the study published by Anguita et al.. The study collected sensor data from smartphones worn by participates as they were guided through basic physical activities. The goal was to use smartphone sensor data to predict future activities.
A detailed description of the data variables and collections techniques utilized in the study by Anguita et al. can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The original dataset from the study can be download here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[1]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. **_Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine_**. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
##Analysis
The **run_analysis.R** script processes the original Anguita et al. data folder by;
1. Merging the test and training datasets (files:X_train.txt and X_test.txt)
2.  Extracting only statistically processed sensor data (mean and std containing columns)
3. Converting the numeric “activity” code to descriptive activity names as defined in activity_labels.txt
4. Adding descriptive variable names, removing unnecessary symbols, and redundant terms.
5. Summarizes the data by finding an average of each variable for each activity and subject.  The resulting data is formatted as long tidy data and saved to “tidy_data_txt. The file has 80 variables and 180 rows. Each column has a label and the coding nomenclature is shown below;
“subject”- A unique participate ID# (1-30)
“activity”- A label describing activity performed (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
The remaining columns contain processed sensor data collected from the smartphone’s accelerometer and gyroscope. The accelerometer provides both static (Gravity) and dynamic (Body) acceleration information recorded in **standard gravity units 'g'**. This is complimented by the gyroscopes ability to detect pitch, roll and yaw from its measurement of angular velocity (**recorded as radians/second**). These 3 parameters are coded in the dataset by the abbreviations “GravityAcc”, “BodyAcc”, and “BodyGyro” respectively. Below is listed a code breakdown of the column names along with examples related to the accelerometer data.
**Naming Code**

“t” or “f”                 	= time or frequency domain 
“BodyAcc”			= Reading/Sensor
“Mag”           		= magnitude of the vector sum from all 3 axes (X,Y,Z )
“Jerk”           		= the derivative of acceleration (BodyAcc reading) with respect to time
“MeanFreq”              = weighted average of the frequency components    
“Mean”				= mean
“Std”            		= standard deviation
“X”, “Y”, “Z”  		= axis of measurement
“Avg”                        =as prefix indicates mean of mean (“AvgMean”) or mean of Std (“AvgStd”) calculated in summary step 
                                  described above.

**Examples**

tBodyAccAvgMeanX      – mean of the mean dynamic component reading of acceleration along the X axis
tBodyAccAvgMeanY      – mean of the mean dynamic component reading of acceleration along the Y axis
tBodyAccAvgMeanZ      – mean of the mean dynamic component reading of acceleration along the Z axis
             
tBodyAccAvgStdX          – mean of the mean dynamic component reading of acceleration along the X axis
tBodyAccAvgStdY          – mean of the mean dynamic component reading of acceleration along the Y axis
tBodyAccAvgStdZ          – mean of the mean dynamic component reading of acceleration along the Z axis

tBodyAccMagAvgMean 			– mean of the vector sum of tBodyAccMeanX, tBodyAccMeanY, and tBodyAccMeanZ 
tBodyAccMagAvgStd 		 	– mean of std of the vector sum of tBodyAccMeanX, tBodyAccMeanY, and tBodyAccMeanZ
              
tBodyAccJerkAvgMeanX		– mean of the mean Jerk value along the X axis.
tBodyAccJerkAvgMeanY		– mean of the mean Jerk value along the Y axis.
tBodyAccJerkAvgMeanZ		– mean of the mean Jerk value along the Z axis.

tBodyAccJerkAvgStdX			– mean of the stand deviation of the Jerk value along the X axis.
tBodyAccJerkAvgStdY			– mean of the stand deviation of the Jerk value along the Y axis.
tBodyAccJerkAvgStdZ			– mean of the stand deviation of the Jerk value along the Z axis.

tBodyAccJerkMagAvgMean		– mean of the vector sum of tBodyAccJerkMeanX, tBodyAccJerkMeanY, and tBodyAccJerkMeanZ 
tBodyAccJerkMagAvgStd           – mean of std of the vector sum of tBodyAccJerkMeanX, tBodyAccJerkMeanY, 
                                                       and BodyAccJerkMeanZ


“GravityAcc”  and “BodyGyro” sensors data columns follow the same naming convention.

