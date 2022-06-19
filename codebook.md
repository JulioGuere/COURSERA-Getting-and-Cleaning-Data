More details of the file

Assign each data to variables

features <- features.txt : 561 rows, 2 columns
activities <- activity_labels.txt : 6 rows, 2 columns
subject_test <- test/subject_test.txt : 2947 rows, 1 column
x_test <- test/X_test.txt : 2947 rows, 561 columns
y_test <- test/y_test.txt : 2947 rows, 1 columns
subject_train <- test/subject_train.txt : 7352 rows, 1 column
x_train <- test/X_train.txt : 7352 rows, 561 columns
y_train <- test/y_train.txt : 7352 rows, 1 columns

The dataframe is processed to label with descriptive variable names
From the dataframes created in the previous step, we are going to create the second dataframes ordered by the average of each variable for each activity and each theme.
At the end we create the dataframe "training.txt" that contains the ordered data
