function [myDir,filepath_before,filepath_after,cap385,cap16,fs] = preprocessing_config()

% data directory

myDir = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\data';


% filepaths for saving the preprocessed datasets

% directory for saving datasets before component removing

filepath_before = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\datasets\\before';


% directory for saving datasets after component removing

filepath_after = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\datasets\\after';



% channels locations

cap385 = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\code\\eeglab2021.0\\plugins\\dipfit\\standard_BEM\\elec\\standard_1005.elc';
cap16 = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\code\\eeglab2021.0\\sample_locs\\cap16.ced';


% recorder sampling rate

fs = 500;




