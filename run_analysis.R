# Data ingestion for features
features <- read.table ("features.txt")

##### Test Dataset prep ######################
# Data ingestion for test dataset
subtest <- read.table ("subject_test.txt")
xtest <- read.table ("X_test.txt")
ytest <- read.table ("y_test.txt")

# change column names to the actual label of the features
colnames(xtest) <- features$V2
colnames(ytest) <- c("Activity_label")
colnames(subtest) <- c("SubjectID")

# combine the dataset with the actual activity names for the data
xytest <- cbind(subtest,ytest,xtest)

############## Training dataset prep ################
# Data ingestion for training dataset
subtrain <- read.table ("subject_train.txt")
xtrain <- read.table ("X_train.txt")
ytrain <- read.table ("y_train.txt")

# change column names to the actual label of the features
colnames(xtrain) <- features$V2
colnames(ytrain) <- c("Activity_label")
colnames(subtrain) <- c("SubjectID")

# combine the dataset with the actual activity names for the data
xytrain <- cbind(subtrain,ytrain,xtrain)

# combine the test dataset and training dataset
full <- rbind (xytrain, xytest)

# only take out the columns that are relevant for mean and std
adata <- full[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215
                 ,227,228,240,241,253,254,266:271,345:350,424:429
                 ,449,503,504,516,517,529,530,542,543)]

# read in the activity labels
act <- read.table ("activity_labels.txt")
colnames(act) <- c("Activity_label","Activity_desc")

# rename dataset with actual activity labels
cdata <- merge (adata, act, by.x="Activity_label", by.y="Activity_label")

# prepare tidy dataset with columns ordered well
tidydata <- cdata[,c(2,1,68,3:67)]

# write out the tidy dataset 1
write.table(tidydata, "tidydata.txt", sep="\t")

# install packages for summing the data
install.packages("plyr")
library("plyr")

# take mean of each of the features of tidy data
tidydata2<-ddply(tidydata, .(SubjectID,Activity_desc), numcolwise(mean))

# write out the tidy dataset 2
write.table(tidydata2, "tidydata2.txt", sep="\t")


