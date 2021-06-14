function Mat = fill_T_screen(Mat,Wave_Mat,s,freqReg,brainReg,frontal,central,post_occ,left,right,broca,wernick)
% a function that fills the matrix called Mat
% step by step with a dataset of screen subject

screen_T = zeros(freqReg,brainReg*2);

%% Filling of screen_T matrix


% delta

delta_frontal = mean(Wave_Mat(frontal,1));
screen_T(1,14) = delta_frontal;
delta_central = mean(Wave_Mat(central,1));
screen_T(1,12) = delta_central;
delta_left = mean(Wave_Mat(left,1));
screen_T(1,10) = delta_left;
delta_right = mean(Wave_Mat(right,1));
screen_T(1,8) = delta_right;
delta_post_occ = mean(Wave_Mat(post_occ,1));
screen_T(1,6) = delta_post_occ;
delta_broca = mean(Wave_Mat(broca,1));
screen_T(1,4) = delta_broca;
delta_wernick = mean(Wave_Mat(wernick,1));
screen_T(1,2) = delta_wernick;

% theta

theta_frontal = mean(Wave_Mat(frontal,2));
screen_T(2,14) = theta_frontal;
theta_central = mean(Wave_Mat(central,2));
screen_T(2,12) = theta_central;
theta_left = mean(Wave_Mat(left,2));
screen_T(2,10) = theta_left;
theta_right = mean(Wave_Mat(right,2));
screen_T(2,8) = theta_right;
theta_post_occ = mean(Wave_Mat(post_occ,2));
screen_T(2,6) = theta_post_occ;
theta_broca = mean(Wave_Mat(broca,2));
screen_T(2,4) = theta_broca;
theta_wernick = mean(Wave_Mat(wernick,2));
screen_T(2,2) = theta_wernick;

% alpha

alpha_frontal = mean(Wave_Mat(frontal,3));
screen_T(3,14) = alpha_frontal;
alpha_central = mean(Wave_Mat(central,3));
screen_T(3,12) = alpha_central;
alpha_left = mean(Wave_Mat(left,3));
screen_T(3,10) = alpha_left;
alpha_right = mean(Wave_Mat(right,3));
screen_T(3,8) = alpha_right;
alpha_post_occ = mean(Wave_Mat(post_occ,3));
screen_T(3,6) = alpha_post_occ;
alpha_broca = mean(Wave_Mat(broca,3));
screen_T(3,4) = alpha_broca;
alpha_wernick = mean(Wave_Mat(wernick,3));
screen_T(3,2) = alpha_wernick;

% beta

beta_frontal = mean(Wave_Mat(frontal,4));
screen_T(4,14) = beta_frontal;
beta_central = mean(Wave_Mat(central,4));
screen_T(4,12) = beta_central;
beta_left = mean(Wave_Mat(left,4));
screen_T(4,10) = beta_left;
beta_right = mean(Wave_Mat(right,4));
screen_T(4,8) = beta_right;
beta_post_occ = mean(Wave_Mat(post_occ,4));
screen_T(4,6) = beta_post_occ;
beta_broca = mean(Wave_Mat(broca,4));
screen_T(4,4) = beta_broca;
beta_wernick = mean(Wave_Mat(wernick,4));
screen_T(4,2) = beta_wernick;

% gamma

gamma_frontal = mean(Wave_Mat(frontal,5));
screen_T(5,14) = gamma_frontal;
gamma_central = mean(Wave_Mat(central,5));
screen_T(5,12) = gamma_central;
gamma_left = mean(Wave_Mat(left,5));
screen_T(5,10) = gamma_left;
gamma_right = mean(Wave_Mat(right,4));
screen_T(5,8) = gamma_right;
gamma_post_occ = mean(Wave_Mat(post_occ,5));
screen_T(5,6) = gamma_post_occ;
gamma_broca = mean(Wave_Mat(broca,5));
screen_T(5,4) = gamma_broca;
gamma_wernick = mean(Wave_Mat(wernick,5));
screen_T(5,2) = gamma_wernick;


%% append screen_T (1 subject) to Mat

% i represent the current location on Mat for appending the screen_T matrix 
i = 5*(s-1)+1;

Mat(i:i+4,2:2:14) = screen_T(1:5,2:2:14);


