# Read and massage the input, or "X", values
test.X <- read.table("UCI HAR Dataset/test/X_test.txt")
train.X <- read.table("UCI HAR Dataset/train/X_train.txt")
merged.X <- rbind(test.X, train.X)

column.names.X <- as.vector(read.table('UCI HAR Dataset/features.txt')[,2])
colnames(merged.X) <- column.names.X
mean.std.column.names.X <- column.names.X[grep('(mean|std)\\(\\)', column.names.X)]

mean.and.std.X <- merged.X[mean.std.column.names.X]


# Read and massage the activity, or "y", values
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
merged.y <- rbind(test.y, train.y)

colnames(merged.y) <- c("Activity")

descriptive.activity.names <- list(
  "1", "Walking",
  "2", "Walking Upstairs",
  "3", "Walking Downstairs",
  "4", "Sitting",
  "5", "Standing",
  "6", "Laying")

for(i in seq(1, length(descriptive.activity.names), by=2)) {
  code <- descriptive.activity.names[[i]]
  name <- descriptive.activity.names[[i+1]]
  merged.y[merged.y$Activity == code, ] <- name
}


# Read and massage the subject IDs
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
merged.subject <- rbind(test.subject, train.subject)

colnames(merged.subject) <- c("Subject")


# Combine and output the observation detail
tidy = cbind(merged.subject, merged.y, mean.and.std.X)
write.table(tidy, 'observation_detail.txt', row.names = FALSE)


# Re-cast the tidy frame to get mean values by Subject and Activity
tidy.melted <- melt(tidy, c("Subject", "Activity"))
summarized <- dcast(tidy.melted, Subject + Activity ~ variable, mean)
write.table(summarized, 'observation_summary.txt', row.names = FALSE)
