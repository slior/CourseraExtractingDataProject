



  rowcount <- -1 # for debugging purposes (limiting data volume), should be set to -1 if full analysis is required
  
  #   The following script reads the Human activity recognition dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  #   and tidies it up, for further analysis.
  #   The script:
  #       combines the training and test sets along with the subject and activity data;
  #       projects the mean and standard measures from the data set;
  #       provides more readable measure names,
  #       aggregates the mean for each variable over each subject and activity pair.
  #   
  #  Assumption: this is run where the working directory points to a directory where the data set zip file was extracted to.
  #  Otherwise, we need to be more defensive here - check for file existence, etc.
  
  #------------------------------------------------
  #Phase 1:  Merge train and test sets
  # Read train + test sets, and combine them with their respective subjects
  train_set <- read.table("train/X_train.txt",nrow=rowcount);
  subjects <- read.table("train/subject_train.txt",col.names=c("subject"),nrow=rowcount);
  train_set <- cbind(subjects,train_set);
  
  test_set <- read.table("test/X_test.txt",nrow=rowcount);
  subjects <- read.table("test/subject_test.txt",col.names=c("subject"),nrow=rowcount);
  test_set <- cbind(subjects,test_set);
  
  all <- rbind(train_set,test_set); # As described in the dataset description - both file are structured the same way
  
  #------------------------------------------------
  #Phase 2: Extracting only the mean and standard deviation measures
  # identify correct features by name
  features <- read.table("features.txt",col.names=c("index","name"));
  
  mean_feature_indices <- grep("mean()",features$name,fixed=TRUE); 
  std_feature_indices <- grep("std()",features$name,fixed=TRUE);
  
  interesting_data <- all[,c(1,mean_feature_indices+1,std_feature_indices+1)]; # column #1 is the subject column
  
  #------------------------------------------------
  #Phase 3: Add activity information, with descriptive activity names
  
  LABEL_COL_NAME <- "label"; #important since we're joining on this column
  
  train_activities_data <- read.table("train/y_train.txt",col.names=c(LABEL_COL_NAME),nrow=rowcount);
  test_activities_data <- read.table("test/y_test.txt",col.names=c(LABEL_COL_NAME),nrow=rowcount)
  all_activities <- rbind(train_activities_data,test_activities_data);
  
  activity_dict <- read.table("activity_labels.txt",col.names=c(LABEL_COL_NAME,"name")); #mapping activity labels to names
  
  # merge the activity dictionary by the activity label, and then drop the label column
  interesting_data_w_activities <- merge(activity_dict,cbind(interesting_data,all_activities))[,-1]
  
  #Note: from this point on, order of data is not as in the original file(s)!
  
  #------------------------------------------------
  #Phase 4: label the data with descriptive variable names
  
  names <- as.character(features[c(mean_feature_indices,std_feature_indices),"name"])
  
  #more descriptive prefixes
  names <- gsub("(^t)(.+)$","time_\\2",
           gsub("(^f)(.+)$","freq_\\2",
                names,
                perl=TRUE),
           perl=TRUE)
  
  names <- sub("()","",names,fixed=TRUE)            #remove redundant parenthesis
  names <- gsub("-","_",names,fixed=TRUE)           #replace all hyphens with underscores
  names <- sub("BodyBody","Body",names,fixed=TRUE)  #Replace 'BodyBody' (seems like a typo) with 'Body'
  
  names(interesting_data_w_activities) <- c("activity_name","subject",names);
  
  #------------------------------------------------
  #Phase 5: creating a seconday data set, averaging all variables for each subject and activity pair
  
  m <- melt(interesting_data_w_activities,id.vars=c("activity_name","subject"))
  result <- dcast(m,activity_name+subject ~ variable,fun.aggregate=mean)
  
  #------------------------------------------------
  write.table(result,"analysis_results.txt",row.names=FALSE); #write the result to an output file, overwriting an existing file with the same name in the working directory.
  
