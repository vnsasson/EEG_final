function [deltaMat,thetaMat,alphaMat,betaMat,gammaMat] = divideMat(Mat,brainReg,patientNum)
% divide the whole subject's matrix (Mat) to 5 matrices
% each for wave region (delta,theta,..)

    deltaMat = zeros(patientNum,brainReg*2);
    thetaMat = zeros(patientNum,brainReg*2);
    alphaMat = zeros(patientNum,brainReg*2);
    betaMat  = zeros(patientNum,brainReg*2);
    gammaMat = zeros(patientNum,brainReg*2);
   
    
    for i = 1 : patientNum
        deltaMat(i,:) = Mat(((i-1)*5)+1,:);
        thetaMat(i,:) = Mat(((i-1)*5)+2,:);
        alphaMat(i,:) = Mat(((i-1)*5)+3,:);
        betaMat(i,:) = Mat(((i-1)*5)+4,:);
        gammaMat(i,:) = Mat(((i-1)*5)+5,:);
    end
       
end
    

        
