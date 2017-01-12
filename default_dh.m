function [DH,q,q_dest] = default_dh

%% I'm considering that the DH table has the following format:
%
%
%      | a_1 | alpha_1 | d_1 | theta_1 | joint_type_1 |
% DH = | ... | ....... | ... | ....... | ............ | 
%      | a_n | alpha_n | d_n | theta_n | joint_type_n |
%
% where alpha_i and theta_i are specified in radians


%% 3 link robot
% DH = [1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];
% q_dest = [0 pi/2 0]';
% q =  [0 0 0]';
%% 20 link robot
%DH = [1 0 0 pi/12 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 0 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; ; 1 0 0 0 0; ; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];
% samples q_dest and q:
% q = [pi/2; zeros(19,1)];
% q_dest = [ pi/2; zeros(10,1); -pi/2; zeros(8,1)];
% q_dest = [zeros(13,1); pi/2; zeros(6,1)];

DH = [0 pi/2 0 0 0; 0 pi/2 0 0 0; 0 pi/2 0 0 0; 0 pi/2 17.45 0 0; 10 0 0 0 0; 0 -pi/2 4.65 0 0; 0 pi 0 0 0];%[10 pi/2 0 pi/12 0; 10 -pi/2 0 0 0; 10 -pi/2 0 0 0; 10 0 0 0 0];
q = [-0.1885    1.5708    1.5080    0.0628   -0.1257   -0.0628    0.1257]';%[0    1.5080    1.5080   -3.1269 0 0 0]';%[-0.0369; -0.0369; 2.7105; 1.8354; 0.2989];
q_dest = [0; 0; 0; 0; pi/2; 0; 0];
%DH = [1 0 0 pi/12 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 0 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; ; 1 0 0 0 0; ; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];
%q = zeros(20,1);
%q_dest = zeros(20,1);

%% q_dest for drawing letters
%for drawing a r: q_dest = [ pi/2; zeros(10,1); -pi/2; zeros(8,1)];
%for drawing a c: q_dest = [ pi; zeros(19,1)];
%for drawing an s: q_dest = [ 0; zeros(19,1)];