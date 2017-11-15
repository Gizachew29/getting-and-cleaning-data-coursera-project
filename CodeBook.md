## CodeBook

The following information pertains to `tidy_data.txt` contained in this repository.

See `README.md` for the backgroud information of the original data set.

### Data

The `tidy_data.txt` is a text file with space-seperated values.

The first row contains the names of the variables, which are described below.

### Variables

Each row (observation) contains the variables for a given subject and activity.

- `subjectId` Subject identifier, integer, range(1,30).

- `activity` Subjects state, character, (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`).

All the following measurements are floating-point values, normalized and bounded within [-1,1].

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `timeAccelerometer-XYZ` and `timeGyroscope-XYZ`. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`timeBodyAccelerometer-XYZ` and `timeGravityAccelerometer-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`timeBodyAccelerometerJerk-XYZ` and `timeBodyGyroscopeJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`timeBodyAccelerometerMagnitude`, `timeGravityAccelerometerMagnitude`, `timeBodyAccelerometerJerkMagnitude`, `timeBodyGyroscopeMagnitude`, `timeBodyGyroscopeJerkMagnitude`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `frequencyBodyAccelerometer-XYZ`, `frequencyBodyAccelerometerJerk-XYZ`, `frequencyBodyGyroscope-XYZ`, `frequencyBodyAccelerometerJerkMagnitude`, `frequencyBodyGyroscopeMagnitude`, `frequencyBodyGyroscopeJerkMagnitude`.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- `timeBodyAccelerometer-XYZ`
- `timeGravityAccelerometer-XYZ`
- `timeBodyAccelerometerJerk-XYZ`
- `timeBodyGyroscope-XYZ`
- `timeBodyGyroscopeJerk-XYZ`
- `timeBodyAccelerometerMagnitude`
- `timeGravityAccelerometerMagnitude`
- `timeBodyAccelerometerJerkMag`
- `timeBodyGyroscopeMagnitude`
- `timeBodyGyroscopeJerkMagnitude`
- `frequencyBodyAccelerometer-XYZ`
- `frequencyBodyAccelerometerJerk-XYZ`
- `frequencyBodyGyroscope-XYZ`
- `frequencyBodyAccelerometerMagnitude`
- `frequencyBodyAccelerometerJerkMagnitude`
- `frequencyBodyGyroscopeMagnitude`
- `frequencyBodyGyroscopeJerkMagnitude`

With`-mean()` designating the mean value and `-std()` designating the standard deviation.

### Transformations

The zip file containing the source data [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The following transformations were made to the source data:

1. The training and test sets were merged to create one complete data set.

2. The measurements containing the mean and standard deviation were extracted from each measurement, and the rest were discarded.

3. The activity identifiers (originally labeled with integers 1 through 6) were replaced with descriptive activity names.

4. The variable names were replaced with more descriptive names (e.g. `tBodyAccJerkMag-mean()` expanded to `timeBodyAccelerometerJerkMagnitude-mean()`).

5. Created a seperate data set `tidy_data.txt` with the average of each variable for each activity and each subject.

The source data and data transformations were implemented by `run_analysis.R` (see `README.md` for packages required).