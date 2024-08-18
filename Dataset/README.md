# Ascertaining Cervical Range of Motion from IMU Sensors
The dataset consists of a folder of csv files stored in the `Dataset` directory for each subject. 
Each csv file contains the recording session of a subject named after the experiment part and anatomical plane,
with multiple columns representing the measurements taken during the experiment. 

- **File Naming Convention:** `{date}_{subject code}_{experimental part}_{anatomical plane tested}.csv`
    - `date`: The date of the experiment.
    - `subject code`: Unique identifier for each subject.
    - `experimental part`: Part of the experiment (e.g., partA, partB).
    - `anatomical plane tested`: Anatomical plane (e.g., frontal, horizontal, sagittal).

For example, the file `10.9_514_partA_frontal.csv` contains the frontal plane data of subject 514 for experiment part A
(Validation) on October 9th.

### Subject File Data Structure:
- **partA_frontal:** Data captured from the frontal plane during experiment part A (Validation).
- **partA_horizontal:** Data from the horizontal plane during experiment part A (Validation).
- **partA_sagittal:** Data from the sagittal plane during experiment part A (Validation).
- **partB_frontal_Pre:** Data from the frontal plane during experiment part B, test (Pre).
- **partB_frontal_Post:** Data from the frontal plane during experiment part B, retest (Post).
- **partB_horizontal_Pre:** Data from the horizontal plane during experiment part B, test (Pre).
- **partB_horizontal_Post:** Data from the horizontal plane during experiment part B, retest (Post).
- **partB_sagittal_Pre:** Data from the sagittal plane during experiment part B, test (Pre).
- **partB_sagittal_Post:** Data from the sagittal plane during experiment part B, retest (Post).

### Sheet Data Columns Description:
Each sheet contains columns representing various measurements taken during the experiment, including:
- `X_s_`: Time vector in seconds, corresponding to the data EMG1 column (above)
- `AvantiSensor1_EMG1__filter_RemoveMean_`: Filtered EMG data from sensor 1.
- `X_s__1`: Time in seconds, corresponding to the data W1 column (below).
- `AvantiSensor1_ORIENT_W1`: Orientation data (W1) from sensor 1.
- `X_s__2`: Time in seconds, corresponding to the data X1 column (below).
- `AvantiSensor1_ORIENT_X1`: Orientation data (X1) from sensor 1.
- `X_s__3`: Time in seconds, corresponding to the data Y1 column (below).
- `AvantiSensor1_ORIENT_Y1`: Orientation data (Y1) from sensor 1.
- `X_s__4`: Time in seconds, corresponding to the data Z1 column (below).
- `AvantiSensor1_ORIENT_Z1`: Orientation data (Z1) from sensor 1.
- `X_s__5`: Time in seconds, corresponding to the data EMG2 column (below).
- `AvantiSensor2_EMG2`: EMG data from sensor 2.
- `X_s__6`: Time in seconds, corresponding to the data W2 column (below).
- `AvantiSensor2_ORIENT_W2`: Orientation data (W2) from sensor 2.
- `X_s__7`: Time in seconds, corresponding to the data X2 column (below).
- `AvantiSensor2_ORIENT_X2`: Orientation data (X2) from sensor 2.
- `X_s__8`: Time in seconds, corresponding to the data Y2 column (below).
- `AvantiSensor2_ORIENT_Y2`: Orientation data (Y2) from sensor 2.
- `X_s__9`: Time in seconds, corresponding to the data Z2 column (below).
- `AvantiSensor2_ORIENT_Z2`: Orientation data (Z2) from sensor 2.
