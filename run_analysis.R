# Get Data from Training Set
subject.train <- read.table("train/subject_train.txt")
x.train <- read.table("train/X_train.txt")
y.train <- read.table("train/y_train.txt")

# Get Data from Testing Set
subject.test <- read.table("test/subject_test.txt")
x.test <- read.table("test/X_test.txt")
y.test <- read.table("test/y_test.txt")

# Merge the Data Sets
subject.data <- rbind(subject.train, subject.test)
x.data <- rbind(x.train, x.test)
y.data <- rbind(y.train, y.test)

# Extract the Mean and Standard Deviation Features Only
features <- read.table("features.txt")
features.select <- grep("-(mean|std)\\(\\)", features[, 2])
x.data <- x.data[, features.select]
names(x.data) <- features[features.select, 2]

# Write a Tidy Data Set
labels <- read.table("activity_labels.txt")
y.data[, 1] <- labels[y.data[, 1], 2]
names(y.data) <- "activity"
names(subject.data) <- "subject"
tidy <- cbind(x.data, y.data, subject.data)
write.table(tidy, "tidydata.txt", row.name=FALSE)