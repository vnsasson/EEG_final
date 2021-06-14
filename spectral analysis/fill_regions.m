function [frontal,central,post_occ,left,right,broca,wernick] = fill_regions(Num_elec)
% function which divide the electrodes to brain regions
% Input: number of electrodes for this specific dataset
% Output: brain regios fill with their electrodes

% for 63/64 electrodes
if (Num_elec <=64 ) && (Num_elec > 50) 
    global_frontal  =  [1,32,33,34,35,62,63,4,37,3,36,2,61,30,60,31];
    global_central  =  [8,41,24,57,25];
    global_post_occ =  [15,46,14,45,13,53,19,52,20,47,48,49,50,51,16,17,18];
    global_left     =  [1,33,34,3,4,36,37,5,6,7,38,39,8,9,41,42,10,11,12,43,44,14,15,45,46,16,47,48];
    global_right    =  [18,19,20,21,22,23,25,26,27,28,29,30,31,32,50,51,52,53,54,55,56,57,58,59,60,61,62,63];
    global_broca    =  [3,4,6,8,37,39];
    global_wernick  =  [9,11,14,15,43,46];
end

% for 16 electrodes
if (Num_elec <=16) 
    global_frontal = [1,2,3,15,16];
    global_central = [5];
    global_post_occ = [6,7,8,9,10,11,12,13];
    global_left = [1,3,4,7,8,9];
    global_right = [16,15,14,13,12,11];
    global_broca = [3];
    global_wernick = [4,7,8];
end

frontal = RegionsUpdate(global_frontal,Num_elec);
central = RegionsUpdate(global_central,Num_elec);
post_occ = RegionsUpdate(global_post_occ,Num_elec);
left = RegionsUpdate(global_left,Num_elec);
right = RegionsUpdate(global_right,Num_elec);
broca = RegionsUpdate(global_broca,Num_elec);
wernick = RegionsUpdate(global_wernick,Num_elec);



        


