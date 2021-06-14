function [Adj_P1] = calcStat(BigPaper,BigScreen,FreqSize,TimeSize,ConnectNum)
% A function that calculates statistics between every two matrices of each subject
% Input      Bigpaper, Bigscreen - 4-D matrices of all 64 connections
% Output     Adj_P1 -  3-D matrix, each layer represent the statistics
%            values of every two regions connection (overall 64 connections)

    Adj_P1 = zeros(FreqSize,TimeSize,ConnectNum);

    for i = 1 : ConnectNum

        Single_paper = single(BigPaper(i,:,:,:));
        Single_screen = single(BigScreen(i,:,:,:));
        Res_cell = cell(1,2);
        Res_cell{1} = Single_paper;
        Res_cell{2} = Single_screen;

        [stats1, df1, pvals1, surrog1] = statcond(Res_cell, 'mode','bootstrap','naccu',10000 );
        [h2, crit_p1, adj_ci_cvrg1, adj_p1] = fdr_bh(pvals1);   %fdr correction

        Adj_P1(:,:,i) = adj_p1;

    end

end