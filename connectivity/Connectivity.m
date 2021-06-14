clc; close all; clear all;

% start EEGLAB
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 

%% Configuration

[EEG,setDir,OrdersMat,SubjectsNum,TimeSize,FreqSize,BrainRegNum,ConnectNum,p_val,Regions] = Conn_config(EEG);


% After all connectivities have been calculated and been saved to specific dir


%% Fill 2 Matrices (Paper,Screen) for all brain areas
% The Big matrices includes:
%                             The first dimension represent the whole
%                             connections between two brain regions.
% For every connection has a 3-D matrix of time*freq for each subject                            

BigPaper = zeros(ConnectNum,FreqSize,TimeSize,SubjectsNum);
BigScreen = zeros(ConnectNum,FreqSize,TimeSize,SubjectsNum);

for from = 1 : BrainRegNum
    for to = 1 : BrainRegNum

        Paper = zeros(FreqSize,TimeSize,SubjectsNum);
        Screen = zeros(FreqSize,TimeSize,SubjectsNum);

        % fill Paper,Screen layer by layer for each 2 brain regions connection
        for subj = 1 : SubjectsNum
            [Paper,Screen] = Fill2Mat(EEG,OrdersMat,Paper,Screen,subj,from,to);
        end
        
        CurrIdx = (from-1)*BrainRegNum+to;
        
        % fill the 4-D matrices : BigPaper,BigScreen
        BigPaper(CurrIdx,:,:,:) = Paper;
        BigScreen(CurrIdx,:,:,:) = Screen;
    end
end


%% Calculate statistics

[Adj_P1] = calcStat(BigPaper,BigScreen,FreqSize,TimeSize,ConnectNum);


%% Subtraction matrix

[SubMat] = SubtractMat(BigPaper,BigScreen,FreqSize,TimeSize,ConnectNum);


%% Transform the p_val matrix to (-1/1) matrix
% 1 = for p-val < 0.05
% 0 = for p_val > 0.05

[OneMinusOne] = OneMinusOneFunc(SubMat,Adj_P1,FreqSize,TimeSize,ConnectNum,p_val);


%% Plotting all connectivity matrices

plottingFunc(EEG,FreqSize,ConnectNum,BrainRegNum,OneMinusOne,Regions);


% %% Plot example
% 
% time = EEG(1).CAT.Conn.winCenterTimes;
% freq = 1:FreqSize;
%
% figure;
% imagesc(time,freq,OneMinusOne(:,:,49));
% colorbar
% caxis([-1 1]);
% title('From Left Tempral to Left Frontal');
% xlabel('Time [sec]');
% ylabel('Frequency [hz]');


