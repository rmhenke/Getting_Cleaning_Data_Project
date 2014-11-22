
#run_analysis.R 


### Enter path to directory containing the unzipped folder "getdata_projectfiles_UCI HAR Dataset". Default assumes file is in working directory, but not limited too.

run_analysis <- function(data_file_path = getwd()){ 
        

#**Step 1. 1.Merges the training and the test sets to create one data set.
        
        
###Construction of merged data table
      
                # assemble file path strings 
                
                features_path <-  paste0(data_file_path, "/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
                activity_label_path <-  paste0(data_file_path, "/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

                data_train_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt")  
                activity_code_train_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")   
                subject_ID_train_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt") 

                data_test_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/x_test.txt")  
                activity_code_test_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")   
                subject_ID_test_path <- paste0(data_file_path,"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")


                #Read train and test data

                data_train <- read.table(data_train_path, colClasses="numeric")
                subject_ID_train <- read.delim(subject_ID_train_path, header=FALSE, colClasses = "numeric")
                activity_code_train <- read.delim(activity_code_train_path, header=FALSE, colClasses = "numeric") 

                data_test <- read.table(data_test_path, colClasses="numeric")
                subject_ID_test <- read.delim(subject_ID_test_path, header=FALSE, colClasses = "numeric")
                activity_code_test <- read.delim(activity_code_test_path, header=FALSE, colClasses = "numeric") 

        ##Construct train & test tables        

                # assemble train table | format: Subject, Activty, data labels
                
                train_table <- cbind(subject_ID_train, activity_code_train,data_train)

                # assemble test table | format: Subject, Activty, data labels
        
               
                test_table <- cbind(subject_ID_test, activity_code_test, data_test)

        ##Merge & label train/test tables

                #merge

                mmerged_table <- rbind(train_table, test_table)

                # Add column names

                features_raw <- read.table(features_path, strip.white = TRUE, stringsAsFactors = FALSE)
                features <- c("subject_ID","activity", features_raw$V2)
                colnames(mmerged_table) <- features


#**Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 


### subset mmerged table to include columns only with "subject", "activity", "mean", and "std" | Decided to include meanFeq() therefore 
### my decission to search "mean" and not "mean\\(\\)"

        ## generate logical vector to use as filter 

                colNames <- (grepl("mean",colnames(mmerged_table)) | grepl("std",colnames(mmerged_table)) | grepl("subject",colnames(mmerged_table)) | grepl("activity",colnames(mmerged_table)))
           
        ## subset list
        
                mmerged_table <- mmerged_table[ , colNames]


#**Step 3. Uses descriptive activity names to name the activities in the data set


### replaces numeric activity code in column "activity" with activity descriptive labels

        ##read activity labels
        activity_label <- read.table(activity_label_path, stringsAsFactors = FALSE)

        ## replace activity code with activity labels
        mmerged_table$activity <- activity_label[mmerged_table$activity, 2]


#**Step4.Appropriately labels the data set with descriptive variable names.


###cleans up descriptive variable names. Goal was to increase readability of names 
### Formatted by separating code elements with underscores: t_BodyAcc_Mean_X =signal analyzed: time domain signal | measurement: Body Acceleration | value type: mean | axis measured: X

        ## Changed t to t_, f to f_, mean to Mean, std to StdDev & replaced dashes with underscores , Removed "()" and Body duplication error ("BodyBody") from original feature names

        names(mmerged_table) <- gsub("mean", "Mean", names(mmerged_table))
        names(mmerged_table) <- gsub("std", "Std", names(mmerged_table))
        names(mmerged_table) <- gsub("-", "", names(mmerged_table))
        names(mmerged_table) <- gsub("BodyBody", "Body", names(mmerged_table))
        names(mmerged_table) <- gsub("\\(\\)", "", names(mmerged_table))
        

#*Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### find the mean for each combination of subject and label

        ##calculates the mean for each variable for each activity and each subject

        tidy_data_mean <- aggregate(mmerged_table[, 3:(length(names(mmerged_table))-1)], 
                      by=list(subject = mmerged_table$subject, activity = mmerged_table$activity), mean)

                ##Modify column names by adding "Avg" code term in front of "Mean" and "Std". This reflexs the change in data
                ##that occurred in the preceeding step. Mean of Mean and Mean of Std. "Avg" was choosen over "Mean" for clarity "AVgMean" vs "MeanMean" (might look like a typo)      

                names(tidy_data_mean) <- gsub("Mean", "AvgMean", names(tidy_data_mean))
                names(tidy_data_mean) <- gsub("Std", "AvgStd", names(tidy_data_mean))


        tidy_data <- tidy_data_mean[order(as.numeric(tidy_data_mean$subject), tidy_data_mean$activity),]

### Save tidy_data

        write.table(tidy_data, file ="tidy_dataset.txt",row.name=FALSE, sep = "\t")
}

run_analysis()

