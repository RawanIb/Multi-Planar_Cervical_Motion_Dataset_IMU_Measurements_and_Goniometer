# Ascertaining-cervical-range-of-motion-from-IMU-sensors
This repository includes Matlab code for extract relative angle between two IMU sensors.
The code is based on the following paper: Ascertaining cervical range of motion from IMU sensors.

This study is a data descriptor of extraction cervical range of motion includes two parts.

#### Part A (Validation) 
This part aims to validate the extract angle from IMU sensors using the gold-standard method, a goniometer.

The main script is 'Analyze_PartA_Validation.m',
the scripts read the data and extract the angle from the IMU sensors.

<div style="text-align:center">
  <img src="Figures/figure 1.jpg" alt="Alt text" style="width:400px;height:500px;">
  <p>Figure 1: Universal goniometer, sensor placement, and reference system description. The
Subject exhibits sensor and Goniometer placement for 3 planes. (A) Sagittal plane
movement Flexion / Extension (Y axis). (B) Frontal plane movement, side Flexion (Z axis). (C)
Horizontal plane movement, rotation (X-axis).</p>
</div>

#### Part B (Reliability)
This part aims to assess the consistency of the measures by extracting the angle of the same movements recorded at different times.

The main script is 'Analyze_PartB_Reliability.m',
the scripts read the data and extract the angle from the IMU sensors.

<div style="text-align:center">
  <img src="Figures/figure 2.jpg" alt="Alt text" style="width:800px;height:300px;">
  <p>Figure 2: Sensor placement and body positioning for Part B. (A) Subject exhibiting
flexion/extension (sagittal). (B) Subject exhibiting side flexion (Frontal). (C) Subject exhibiting
rotation (Horizontal).</p>
</div>

### Data
The data structure is detailed in the manuscript.

### Run the code
* Change data_path variable to the path of the data.
* Run the script to get the angle along the session, and save the results in the 'Results' folder.

### Part A (Validation)
```matlab
Analyze_PartA_Validation
```
1. Select the desired data file for the analysis.

   <img src="Figures/partA_step1.png" alt="partA_step1.png" width="800" />
   
2. The script will plot the angle extracted from the IMU sensors for the 6 movements of the desired plane. 
Choose the desired segment and proceed to the next step, as instructed in the pop-up window.

   <img src="Figures/partA_step2.png" alt="partA_step2.png" width="800" />
   
3. Example of 12 data cursors selected for the 6 movements of the desired plane.

   <img src="Figures/partA_step3.png" alt="partA_step3.png" width="800" />
   
4. The angle extracted from the IMU sensors as csv file.

   <img src="Figures/partA_step4.png" alt="partA_step4.png" width="800" />
   

### Part B (Reliability)
```matlab
Analyze_PartB_Reliability
```
1. Select the desired trails for the analysis, first pre then post.
    
   <img src="Figures/partB_step1a.png" alt="partB_step1a.png" width="800" />
   
   <img src="Figures/partB_step1a.png" alt="partB_step1b.png" width="800" />

2. Select the desired anatomical plane for the analysis.

   <img src="Figures/partB_step2.png" alt="partB_step2.png" width="800" />
   
3. Follow the instructions in the pop-up window to calibrate the data.

   <img src="Figures/partB_step3a.png" alt="partB_step3a.png" width="800" />
   
3.1. Select two points for the calibration (Pre - Blue, Pre - Red).
    
   <img src="Figures/partB_step3b.png" alt="partB_step3b.png" width="800" />

3.2. Adjust offset and onset of the angles according to the calibration points.

   <img src="Figures/partB_step3c.png" alt="partB_step3c.png" width="800" />

4. Follow the instructions in the pop-up window and choose the desired segment and select 24 points.

    <img src="Figures/partB_step4.png" alt="partB_step4.png" width="800" />

5. Example of 24 data cursors selected for the 6 movements of the desired plane.

    <img src="Figures/partB_step5a.png" alt="partB_step5a.png" width="800" />
    
    <img src="Figures/partB_step5b.png" alt="partB_step5b.png" width="800" />
    
    <img src="Figures/partB_step5c.png" alt="partB_step5c.png" width="800" />

6. The angle extracted from the IMU sensors as csv file.

    <img src="Figures/partB_step6.png" alt="partB_step6.png" width="800" />
