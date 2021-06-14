function [EEG,setDir,OrdersMat,SubjectsNum,TimeSize,FreqSize,BrainRegNum,ConnectNum,p_val,Regions] = Conn_config(EEG)

    % Dataset's directory 
    % In this directory every two conditions for each subjects 
    % should be attached (11.7_paper, 11.7_screen, 15.7_paper, 15.7_screen etc..)
    setDir = 'C:\\Users\\Sasson\\Desktop\\Studies\\EEG_project\\datasets\\8\\';

    % Excel matrix of dipole's order
    OrdersMat = fliplr(xlsread('orderMat.xlsx','AB2:A9'));

    % Constants

    SubjectsNum = 14;
    TimeSize = 18;
    FreqSize = 45;
    BrainRegNum = 8;
    ConnectNum = 64;
    p_val = 0.05;

    %% set regions

    Regions = cell(1,BrainRegNum);
    % Regions{1} = 'Left Frontal'; Regions{2} = 'Right Frontal'; Regions{3} = 'Left Partial'; 
    % Regions{4} = 'Right Partial'; Regions{5} = 'Left Occipital'; Regions{6} = 'Right Occipital';
    % Regions{7} = 'Left Temporal'; Regions{8} = 'Right Temporal';

    Regions{1} = 'LF'; Regions{2} = 'RF'; Regions{3} = 'LP'; Regions{4} = 'RP';
    Regions{5} = 'LO'; Regions{6} = 'RO'; Regions{7} = 'LT'; Regions{8} = 'RT';

    % This datasets are already consists the connectivity values
    EEG = pop_loadset('filename',{'11.7_paper.set','11.7_screen.set','14.7_paper.set','14.7_screen.set','15.10_paper.set','15.10_screen.set','15.7_paper.set','15.7_screen.set','17.10_paper.set','17.10_screen.set','19.8_paper.set','19.8_screen.set','21.8_paper.set','21.8_screen.set','24.12_paper.set','24.12_screen.set','24.9_paper.set','24.9_screen.set','28.7_paper.set','28.7_screen.set','4.7_paper.set','4.7_screen.set','5.12_paper.set','5.12_screen.set','5.8_paper.set','5.8_screen.set','8.12_paper.set','8.12_screen.set'},'filepath',setDir);


end