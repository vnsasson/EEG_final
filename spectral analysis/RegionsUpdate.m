function CurrVec = RegionsUpdate(GlobVec,Num_elec)
% a function that ensures that only the correct electrode remains
% input : vector of brain region with his global electrodes
% output : vector of brain region with his current electrodes

len = length(GlobVec);
count=0;


for i = 1:len
    if GlobVec(i) <= Num_elec
        count = count+1;
    end
end

CurrVec = zeros(count,1);

j=1;

for i = 1:len
    if GlobVec(i) <= Num_elec
        CurrVec(j) = GlobVec(i);
        j=j+1;
    end
end

