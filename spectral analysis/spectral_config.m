function [setDir,freqReg,brainReg,patientNum,fs,DeltaLoc,ThetaLoc,AlphaLoc,BetaLoc,GammaLoc] = spectral_config()

% sampling rate
fs = 500;

% Directory of preprocessed data (.set files)
setDir = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\datasets\\after';

freqReg = 5; % alpha, beta,... (number of frequency regions)
brainReg = 7; % frontal, left, right,... (number of brain regions)
patientNum = 15; % number of patients

% Locations and names of all produced matrices
DeltaLoc = 'C:\Users\Sasson\Desktop\Studies\EEG_project\Excel\SpecAnalMat\deltaMat.xlsx';
ThetaLoc = 'C:\Users\Sasson\Desktop\Studies\EEG_project\Excel\SpecAnalMat\thetaMat.xlsx';
AlphaLoc = 'C:\Users\Sasson\Desktop\Studies\EEG_project\Excel\SpecAnalMat\alphaMat.xlsx';
BetaLoc = 'C:\Users\Sasson\Desktop\Studies\EEG_project\Excel\SpecAnalMat\betaMat.xlsx';
GammaLoc = 'C:\Users\Sasson\Desktop\Studies\EEG_project\Excel\SpecAnalMat\gammaMat.xlsx';



end