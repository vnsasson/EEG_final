function [] = plottingFunc(EEG,FreqSize,ConnectNum,BrainRegNum,OneMinusOne,Regions)
% a function for plotting the whole statistics graphs,
% each for each 2 brains connection

time = EEG(1).CAT.Conn.winCenterTimes;
freq = 1:FreqSize;

k=1;
figure;
for i = 1 : ConnectNum
    
    from = fix(i/BrainRegNum)+1;
    to = mod(i,BrainRegNum);
    
    if mod(i,BrainRegNum)==0
        from = from-1;
        to = BrainRegNum;
    end
    
    if from == to
        continue;
    end
    
    subplot(8,7,k);
    imagesc(time,freq,OneMinusOne(:,:,i));
    colorbar
    caxis([-1 1]);
    title(['From ' Regions{from} ' to ' Regions{to}]);
    k=k+1;

end
