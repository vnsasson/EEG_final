clc; close all; clear all;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;  


%% Configuration

[setDir,freqReg,brainReg,patientNum,fs,DeltaLoc,ThetaLoc,AlphaLoc,BetaLoc,GammaLoc] = spectral_config();

myFiles = dir(fullfile(setDir,'*.set')); % gets all .set files in struct

filesNum = size(myFiles);
filesNum = filesNum(1);

% A matrix that will contain the data for all 5 frequency regions 
Mat = zeros(freqReg*filesNum/2,brainReg*2);

% counters: p - paper subject, s - screen subject
s=1; p=1;

%% calculate PSD

% moving on all conditions and all subjects
for k = 1:length(myFiles)
  filename = myFiles(k).name;
  filepath = myFiles(k).folder;
  [Mat,p,s] = spectral_analysis_func(ALLEEG,filename,filepath,Mat,p,s,fs,freqReg,brainReg);   
end

%% Divide the big mat to 5 wave matrices and re-organize them

[deltaMat,thetaMat,alphaMat,betaMat,gammaMat] = divideMat(Mat,brainReg,patientNum);

% When export to excel each two columns are switched, function for fixing
[deltaMat,thetaMat,alphaMat,betaMat,gammaMat] = ReOrganizedMat(deltaMat,thetaMat,alphaMat,betaMat,gammaMat);


%%  Export the matrices

writematrix(deltaMat,DeltaLoc);
writematrix(thetaMat,ThetaLoc);
writematrix(alphaMat,AlphaLoc);
writematrix(betaMat,BetaLoc);
writematrix(gammaMat,GammaLoc);

