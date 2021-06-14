
function [Mat,p,s] = spectral_analysis_func(ALLEEG,filename,filepath,Mat,p,s,fs,freqReg,brainReg)

% loading current dataset
EEG = pop_loadset('filename',filename,'filepath',filepath);

 %% calculate PSD using Welch
 
 mat_dim = size(EEG.data); % (number of electrodes,data length)
 Num_elec = mat_dim(1); % number of electrodes
 
 Psd_length = length(pwelch(EEG.data(1,:),fs)); % length of PSD
 
 % matrix for power spectral density - contain all electrodes
 PSD_Mat = zeros(Num_elec,Psd_length); 
 
 % calculate PSD
 for i = 1:Num_elec
       
    [Psd,theta] = pwelch(EEG.data(i,:),fs);
    f = (theta*fs)/(2*pi);
    PSD_Mat(i,:) = Psd';
    PSD_Mat(i,:) = log10(PSD_Mat(i,:));
  
 end

 
 %% calculate wave values for each patient: 
 % 1-delta (0.5-3.5 Hz), 2-theta (3.5-7.4 Hz), 3-alpha (7.4-12.4 Hz),
 % 4-beta (12.4-30 Hz), 5-gamma (30-45 Hz)
  
 % matrix which contain the data divided to waves 
 Wave_Mat = zeros(Num_elec,freqReg); 

 % calculate PSD summarization for each wave range for each electrode
 for i = 1:Num_elec 
     
     Wave_Mat(i,1) = sum(PSD_Mat(i,find(f<3.5))) - sum(PSD_Mat(i,find(f<0.5)));
     Wave_Mat(i,2) = sum(PSD_Mat(i,find(f<7.4))) - sum(PSD_Mat(i,find(f<3.6)));
     Wave_Mat(i,3) = sum(PSD_Mat(i,find(f<12.4))) - sum(PSD_Mat(i,find(f<7.4)));
     Wave_Mat(i,4) = sum(PSD_Mat(i,find(f<30))) - sum(PSD_Mat(i,find(f<12.4)));
     Wave_Mat(i,5) = sum(PSD_Mat(i,find(f<45))) - sum(PSD_Mat(i,find(f<30)));

end
 

%% Divide the electrodes to brain regions

[frontal,central,post_occ,left,right,broca,wernick] = fill_regions(Num_elec);

%% Calculate the values for this subject and insert to big Mat

if (strfind(filename,'screen') > 0) % screen dataset
    Mat = fill_T_screen(Mat,Wave_Mat,s,freqReg,brainReg,frontal,central,post_occ,left,right,broca,wernick);
    s=s+1;
elseif (strfind(filename,'paper') > 0) % paper dataset    
    Mat = fill_T_paper(Mat,Wave_Mat,p,freqReg,brainReg,frontal,central,post_occ,left,right,broca,wernick);
    p=p+1;
end

end



