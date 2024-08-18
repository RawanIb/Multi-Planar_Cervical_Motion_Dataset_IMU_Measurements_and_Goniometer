close all;
clc;clear all;


% Add necessary paths.

data_path = "your_data_path";
genpath('Figures');
addpath("FunctionsFiles")
results_path = "Results - Validation";
mkdir(results_path)

%% Choose raw data file for pre and post trails.
[fileName, filePath] = uigetfile(fullfile(data_path,"*.*"), "Select PRE file");
fullfilename_pre = fullfile(filePath, fileName);
[fileName, filePath] = uigetfile([filePath,'*.*'], 'Select POST file');
fullfilename_post = fullfile(filePath, fileName);

% Display the menu and get the user's choice
options = {'Sagittal', 'Frontal', 'Horizontal'};
chosen_plane = questdlg('Select recorded plane:', 'Menu', options{:}, options{1});

%% Extract the angles over time
switch chosen_plane
    case 'Sagittal'
        segments = {'xyz',2;'zyx',2;'zyz',2};
        disp('You selected Sagittal plane.');
    case 'Frontal'
        segments = {'xyz',3;'zyx',1;'zyz',1;'zyz',3};
        disp('You selected Frontal.');
    case 'Horizontal'
        segments = {'xyz';'zyx';'zyz'};
        disp('You selected Horizontal.');
    otherwise
        disp('Invalid choice. Please select a valid option.');
end

nsegments = size(segments,1);
movement_angle_segs_pre = cell(nsegments,1);
movement_angle_segs_post = cell(nsegments,1);

for iseg = 1:nsegments
    seg=segments(iseg,:);
    movement_angle_segs_pre{iseg,1} = extract_angle(fullfilename_pre,chosen_plane,seg);
    movement_angle_segs_post{iseg,1} = extract_angle(fullfilename_post,chosen_plane,seg);
end

%%   Plot the angle over time
fig = figure('WindowState','maximized');
for iseg = 1:nsegments
    subplot(1,nsegments,iseg)
    plot(movement_angle_segs_pre{iseg,1},'Color','b');hold on;
    plot(movement_angle_segs_post{iseg,1},'Color','r');hold off;
    xlabel('Sample')
    ylabel('Angle [degree]')
    if strcmp(chosen_plane,'Horizontal')
        title({"Segment = "+ segments{iseg,1}});
    else
        title({"Segment = "+ upper(segments{iseg,1}); ...
            "Movement axis = " + segments{iseg,2}})
    end
end
legend('pre','post')

 msgbox(["Offset and onset Calibration:"; ...
     "1. Choose one of the segment to analyze."; ...
     "2. Use datacursor to select two point to align them."; ...
     "3. Press Enter."; ...
     "4. Type the values"]);

%  Enable data cursor mode
dcm_obj = datacursormode(fig);
set(dcm_obj, 'UpdateFcn', @cursorCallback);
set(dcm_obj, 'Enable', 'on');

% Initialize variables to store cursor position
offset1 = NaN;
offset2 = NaN;
onset1 = NaN;
onset2 = NaN;

% Wait for the user to press Enter
pause;
disp('Opening input dialog...');

% Open an input dialog based on the cursor-selected data
handles = guidata(gcf);
x_input = handles.x_value;
y_input = handles.y_value;

%  Onset and offset
dlgtitle = 'Baseline: choose onset and offset';
dims = [1 40];
definput = {'0','1','0','1'};
Inp=inputdlg({'Please enter offset - Pre [deg]', ...
    'Please enter onset - Pre [samples]', ...
    'Please enter offset - Post [deg]', ...
    'Please enter onset - Post [samples]'},dlgtitle,dims,definput);
% Process the user input (input_data is a cell array)
if isempty(Inp)
    disp('User canceled input.');
else
    offset1 = str2num(Inp{1,1});
    onset1 = str2num(Inp{2,1});
    offset2 = str2num(Inp{3,1});
    onset2 = str2num(Inp{4,1});
end

for iseg = 1:nsegments
    subplot(1,nsegments,iseg)
    plot(movement_angle_segs_pre{iseg,1}(onset1:end)+offset1,'Color','b');hold on;
    plot(movement_angle_segs_post{iseg,1}(onset2:end)+offset2,'Color','r');hold off;
    xlabel('Sample')
    ylabel('Angle [degree]')
    if strcmp(chosen_plane,'Horizontal')
        title({"Segment = "+ segments{iseg,1}});
    else
        title({"Segment = "+ upper(segments{iseg,1}); ...
            "Movement axis = " + segments{iseg,2}})
    end
end
legend('pre','post')


%%  Cursors to select manualy the angles.
n_cursors = 24;
cursor_info = manual_cursor(fig,n_cursors);

%%  Extract mean of angle-to-basline for pre/post
if length(cursor_info)==n_cursors
    mean_angle_prepost = extract_mean_angle_pre_post(cursor_info);
else
    errordlg('Check the cursors')
end

%% Save angle to csv file
angles_to_csv(mean_angle_prepost, fullfilename_pre, results_path)

