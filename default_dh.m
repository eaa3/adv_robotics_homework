function [DH,q,q_dest] = default_dh

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

DH = [1 0 0 pi/12 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 0 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; ; 1 0 0 0 0; ; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];
q = zeros(20,1);
q_dest = zeros(20,1);

%% q_dest for drawing letters
%for drawing a r: q_dest = [ pi/2; zeros(10,1); -pi/2; zeros(8,1)];
%for drawing a c: q_dest = [ pi; zeros(19,1)];
%for drawing an s: q_dest = [ 0; zeros(19,1)];