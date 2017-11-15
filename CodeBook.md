## CodeBook

The following information pertains to `tidy_data.txt` contained in this repository.

See `README.md` for the backgroud information of the original data set.

### Data

The `tidy_data.txt` is a text file with space-seperated values

The first row contains the names of the variables, which are described below.

### Variables

Each row (observation) contains the variables for a given subject and activity.

- `subjectId` Subject identifier, integer, range(1,30)

- `activity` Subjects state, character, (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`)

- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

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

With`-mean()` designating the mean value and `-std()` designating the standard deviation

