
#downloading and unzipping
datadetails <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")

#get the labels

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
features <- read.table("./UCI HAR Dataset/features.txt")               

#load the data tables
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


# combine tables into two big tables: training and testing
traindata <- cbind(subject_train, y_train, X_train)
testdata  <- cbind(subject_test, y_test, X_test)

#now combine in one big dataset 

dataset <- rbind(testdata, traindata)


allnames <- c("subject", "activity", as.character(features$V2)) 
vmeanstdcolumns <- grep("subject|activity|[Mm]ean|std", allnames, value = FALSE) # indices of meanstdcolumns
reducedSet <- dataset[ ,vmeanstdcolumns] # subsetting to only  mean, std, subject, activity
 

names(activity_labels) <- c("activityNumber", "activityName")
reducedset$V1.1 <- activity_labels$activityName[reducedSet$V1.1] #apply activity names to every activity number in the dataframe

newnames <- allnames[vmeanstdcolumns]    # Names after subsetting
newnames <- gsub("mean", "Mean", newnames)
newnames <- gsub("std", "Std", newnames)
newnames <- gsub("^t", "time", newnames)
newnames <- gsub("^f", "frequency", newnames)
newnames <- gsub("^anglet", "angleTime", newnames)
newnames <- gsub("[[:punct:]]", "", newnames)
newnames <- gsub("gravity", "Gravity", newnames)
names(reducedset) <- newnames   #  new names to dataframe

#tidy dataset with average of each variable for each activity and each subject.

tidydataset <- reducedset %>% group_by(activity, subject)

write.table(tidydataset, file = "tidydataset.txt", row.names = FALSE)

