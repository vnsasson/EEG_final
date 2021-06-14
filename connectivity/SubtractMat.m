function [SubMat] = SubtractMat(BigPaper,BigScreen,FreqSize,TimeSize,ConnectNum)
% This function takes 2 matrices (paper,screen) Of a relationship between 
% two regions, calculates the mean of each of the matrices separately
% (across all subjects), and subtracts the screen matrix from paper matrix.
% Input      Bigpaper, Bigscreen - 4-D matrices of all 64 connections
% Output     SubMat - 3-D mat, each layer represent which of the
%            condition's connectivity is higer (>0 for paper , <0 screen)

    SubMat = zeros(FreqSize,TimeSize,ConnectNum);

    for i = 1 : ConnectNum

        tempPaper = reshape(BigPaper(i,:,:,:),45,18,14);
        mean_paper = mean(tempPaper,3);
        tempScreen = reshape(BigScreen(i,:,:,:),45,18,14);
        mean_screen = mean(tempScreen,3); 
        SubMat(:,:,i) = mean_paper - mean_screen;
    end


end