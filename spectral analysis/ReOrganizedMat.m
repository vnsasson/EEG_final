function [deltaMat,thetaMat,alphaMat,betaMat,gammaMat] = ReOrganizedMat(deltaMat,thetaMat,alphaMat,betaMat,gammaMat)
% When export to excel each two columns switched
% this function switch between two lines for right order in excel


for col = 1 : 2 : length(deltaMat)-1
    temp = deltaMat(:,col);
    deltaMat(:,col) = deltaMat(:,col+1);
    deltaMat(:,col+1)=temp;
end

for col = 1 : 2 : length(thetaMat)-1
    temp = thetaMat(:,col);
    thetaMat(:,col) = thetaMat(:,col+1);
    thetaMat(:,col+1)=temp;
end

for col = 1 : 2 : length(alphaMat)-1
    temp = alphaMat(:,col);
    alphaMat(:,col) = alphaMat(:,col+1);
    alphaMat(:,col+1)=temp;
end

for col = 1 : 2 : length(betaMat)-1
    temp = betaMat(:,col);
    betaMat(:,col) = betaMat(:,col+1);
    betaMat(:,col+1)=temp;
end

for col = 1 : 2 : length(gammaMat)-1
    temp = gammaMat(:,col);
    gammaMat(:,col) = gammaMat(:,col+1);
    gammaMat(:,col+1)=temp;
end
        