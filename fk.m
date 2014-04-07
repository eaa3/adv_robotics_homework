
%% Function that computes the affine transformation representing the pose
% of the end effector with respect to the base frame and the jacobian
% matrix
function [T,J] = fk(DH,q)
%% I'm considering that the DH table has the following format:
%
%
%      | a_1 | alpha_1 | d_1 | theta_1 | joint_type_1 |
% DH = | ... | ....... | ... | ....... | ............ | 
%      | a_n | alpha_n | d_n | theta_n | joint_type_n |
%
% where alpha_i and theta_i are specified in radians
%%
    s_dh = size(DH);
    N = s_dh(1);
    
    P = {};
    Z = {};
    
    J = zeros(6,s_dh(1));
    
    %Tb_0 (The transformation from frame 0 to the base frame b is set to
    %the identity, hence, our base frame is assumed to be the cannonical frame)
    T = eye(4,4);
    

    for i=(1:N),
        
        a = DH(i,1);
        alpha = DH(i,2);
        d = DH(i,3);
        theta = DH(i,4);
        joint_type = DH(i,5);
        
        %if the joint is revolute, then only the d is constant, so theta
        %assume the value of the current joint configuration q(i).
        %Otherwise, only theta is constant and define by DH params, so d
        %assumes the value q(i) instead.
        if joint_type == 0,
            theta = q(i);
        else
            d = q(i);
        end
         
        Aalpha = transl(a,0,0)*trotx(alpha);
        Atheta = transl(0,0,d)*trotz(theta); 
        
        %% selecting the position vector of the origin of coordinate frame i-1 
        P{i} = T*[0 0 0 1]';
        %% selecting zi-1, the unit vector of joint i
        Z{i} = T*[0 0 1 0]';
        
        T = T*Atheta*Aalpha;        
        
    end
    
    %% selecting the end effector position from the final affine transform
    pe = T*[0 0 0 1]';
    
    pe = pe(1:3,:);
    
    % For each joint i, then do:
    for i=(1:N),
        
        %position i in P or Z is corresponds to origin pi-1 and z axis i-1,
        %if i==1, then, i corresponds to the origin of the base frame, and
        %corresponding z axis of the base frame
        p = P{i}(1:3,:);
        z = Z{i}(1:3,:);
    
        joint_type = DH(i,5);
        
        jpi = [];
        joi = [];
        %% if joint_type == 1 then it's prismatic, else it's revolute
        if joint_type 
            jpi = z; % zi-1
            joi = zeros(3,1);
        else
            jpi = cross(z,pe - p); % zi-1 x (pe - pi-1)
            joi = z; %zi-1
        end
        
        J(:,i) = [ jpi ; joi ];
            
            
        
        
    end
    
    
       
        