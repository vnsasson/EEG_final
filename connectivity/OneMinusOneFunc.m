function [OneMinusOne] = OneMinusOneFunc(SubMat,Adj_P1,FreqSize,TimeSize,ConnectNum,p_val)
% This function shows the areas of significance for each of the conditions
% for every pixel: (1) - significance for paper, (-1) - significance for screen
% Input          SubMat - subtraction matrix, Adj_P1 - p-values matrix
% Output         OneMinusOne - Matrix for areas of significance

OneMinusOne = zeros(FreqSize,TimeSize,ConnectNum);

for i = 1 : FreqSize
    for j = 1 : TimeSize
        for k = 1 : ConnectNum
            if Adj_P1(i,j,k) <= p_val
                if SubMat(i,j,k) > 0
                    OneMinusOne(i,j,k) = 1;
                elseif SubMat(i,j,k) < 0
                    OneMinusOne(i,j,k) = -1;
                end   
            end
        end
    end
end