Getting and Cleaning Data Assignment 2
========================================

Script: run_analysis.R

Codebook: tidydata_codebook.rmd

Output files: tidydata.txt and tidydata2.txt

Script works as follows:

1. Ingests various features data
2. Ingests test data (both subject and X, y data)
3. Appropriately label column name using features data
4. Combine data from step 3 with subject ID data
5. Using cbind, Create a full test dataset with subject, activity and measurements
6. Repeat steps 2-5 for training data
7. Using rbind to union test and training dataset
8. Only take the columns that are mean and standard deviation data
9. Read activity label data
10. Merge activity label with data from step 8 to create text activity labels
11. Write to tidydata.txt
12. Using ddply function from plyr package to take mean of all columns by subject and activity
13. Write to tidaydata2.txt


