function q_new = ik(DH,q,p_des,q_des,Mq)


finish = 0;
Nit = 1000;
Error_threshold = 0.5;

% Dimensions of DH table of parameters
size_dh = size(DH);

% Damping factor
k = 0.3;

% Integration time
deltaTime = 0.05;

% Matrix Gain (arbitrarily defined as the identity)
K = eye(6,6);


e = [];
q_e = [];
best_q_e = inf;
IdenP = eye(size_dh(1),size_dh(1));


q_new = [q'];
q_tmp = q;
count = 1;

while(~finish),
    
    [T,J] = fk(DH,q_tmp);
    
    
    %% Limiting the robot to the plane (This way we avoid singularity)
   % jp = J(1:2,:);
   % jo = J(6,:);
   % J = [ jp ; jo ];
   
    
    %damper least-squres (DLS) inverse
    j_dim = size(J);
    IdenJ = eye(j_dim(1),j_dim(1));
    Jc = J'/(J*J' + (k^2)*IdenJ);
    
    p_e = T*[0 0 0 1]';
    
    %For the planar case, the angular position of the end effector is just
    %the sum of the joint angles
    theta = sum(q_tmp);
    
    %% Limiting the robot to the place
    p_e = [p_e(1:3,:); 0; 0; theta];
    
    e = p_des - p_e;
    
    P = (IdenP - Jc*J);
    
    
    % just saving the best q_des (for testing purposes)
    q_e = (q_des-q);
    if norm(q_e) <= best_q_e
        best_q_e = norm(q_e);
    end
    
    dq = Jc*K*e + P*(q_e*0.5*Mq);    
    
    q_tmp = q_tmp + dq*deltaTime;
    
    q_new = [ q_new ; q_tmp'];
    
    count = count + 1;
    
    %% Terminating condition is reached 
    finish = norm(e) <= Error_threshold || count > Nit;  
end

display(sprintf('Q_e Error = %g Iterations Count: %d Final Error: %g',norm(q_e),count,norm(e)));



    