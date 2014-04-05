function q_new = ik(DH,q,p_des,q_des,Mq)


finish = 0;

% Dimensions of DH table of parameters
size_dh = size(DH);

% Damping factor
k = 0.5;

% Integration time
deltaTime = 0.1;

% Matrix Gain
K = eye(6,6);


e = [];
IdenP = eye(size_dh(1),size_dh(1));


q_new = [q'];
q_tmp = q;
count = 1;


r = constructRobot(DH);
test = 0;
while(~finish),
    
    [T,J] = fk(DH,q_tmp);
    
    %% Just a test to compare my fk function with the builtin fkine
    T2 = fkine(r,q_tmp);
    if( T2 ~= T ),
        test = test + 1;
    end
    
    
    %% Limiting the robot to the plane (This way we avoid singularity)
   % jp = J(1:2,:);
   % jo = J(6,:);
   % J = [ jp ; jo ];
   
    
    %damper least-squres (DLS) inverse
    j_dim = size(J);
    IdenJ = eye(j_dim(1),j_dim(1));
    Jc = J'/(J*J' + (k^2)*IdenJ);
    
    p_e = T*[0 0 0 1]';
    theta = sum(q_tmp);
    
    %% Limiting the robot to the place
    p_e = [p_e(1:3,:); 0; 0; theta];
    
    e = p_des - p_e;
    
    P = (IdenP -Jc*J);

    dq = Jc*K*e + P*(q_des*Mq);
    
    
    q_tmp = q_tmp + dq*deltaTime;
    q_new = [ q_new ; q_tmp'];
    
    count = count + 1;
    
    %% Terminating condition is reach
    finish = norm(e) <= 1 || count >= 1000;    
end

display(sprintf('FK Error Count = %g Iterations Count: %d Final Error: %g',test,count,norm(e)));



    