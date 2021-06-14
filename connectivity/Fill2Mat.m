function [Paper,Screen] = Fill2Mat(EEG,OrdersMat,Paper,Screen,subj,from,to)
% A function that fills the 2 matrices: Paper, Screen layer by layer 
% when each layer represents different subject
% Input :   Subject
%           from - The index of the area of ​​the brain from which the connectivity is calculated
%           to - The index of the area of ​​the brain to which the connectivity is calculated
% Output:   Paper, Screen - the conectivity matrices for each two brain regions connection

    TimeSize = 18; % length of time vector
    FreqSize = 45; % length of frequency vector
    paper_subject = subj;
    screen_subject = subj+1;
    
    % Transferring the information from the struct to the matrices
    Mat = EEG(paper_subject).CAT.Conn.dDTF08(OrdersMat(from,subj*2-1),OrdersMat(to,subj*2-1),:,:); 
    Mat = reshape(Mat,length(Mat),TimeSize); % change matrix dimension
    Paper(:,:,subj) = Mat(1:FreqSize,:); %takes [1,45] Hz

    Mat = EEG(screen_subject).CAT.Conn.dDTF08(OrdersMat(from,subj*2),OrdersMat(to,subj*2),:,:); 
    Mat = reshape(Mat,length(Mat),TimeSize);
    Screen(:,:,subj) = Mat(1:FreqSize,:); 

end



