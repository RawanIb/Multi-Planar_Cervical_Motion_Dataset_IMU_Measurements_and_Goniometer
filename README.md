# Ascertaining-cervical-range-of-motion-from-IMU-sensors
This repository includes Matlab code for extract relative angle between two IMU sensors.
The code is based on the following paper: Ascertaining cervical range of motion from IMU sensors.

This study is a data descriptor of extraction cervical range of motion includes two parts.

#### Part A (Validation) 
This part aims to validate the extract angle from IMU sensors using the gold-standard method, a goniometer.

The main script is 'Analyze_PartA_Validation.m',
the scripts read the data and extract the angle from the IMU sensors.

#### Part B (Reliability)
This part aims to assess the consistency of the measures by extracting the angle of the same movements recorded at different times.
The main script is 'Analyze_PartB_Reliability.m',
the scripts read the data and extract the angle from the IMU sensors.

### Data
The data structure is detailed in the manuscript.

### Run the code
* Change data_path variable to the path of the data.
* Run the script to get the angle along the session, and save the results in the 'Results' folder.