function tau = NEBackwards(N,m,I,kri,q,qd,qdd,fv,fc,W,Wd,Wmd,Pcdd,Rij,Rici,Rot)

%% backwards
z0 = [0;0;1];

prev_f = zeros(3,1);
prev_u = zeros(3,1);

curr_f = zeros(3,1);
curr_u = zeros(3,1);

F = {};
U = {};

zm = z0;

tau = zeros(N,1);

constructS = @(v) [0 -v(3) v(2);
                   v(3) 0 -v(1);
                  -v(2) v(1) 0];

              
qd(N+1) = 0;
qdd(N+1) = 0;

for i = (N:-1:1),
    
    if( i == N )
        R = eye(3,3);
    else
        R = rotz(q(i+1));
    end
   
    Rt = Rot{i};
    Rt = Rt';
 
    pcdd = Pcdd{i};
    rij = Rij{i};
    rici = Rici{i};
    w = W{i};
    wd = Wd{i};
    wmd = Wmd{i};
    
    %% Force. Equation 7.112 (Siciliano)
    curr_f = R*prev_f + m*pcdd;
    
    
    %Skewed symmetric matrix
    S = constructS(rici);
    
    %% Link inertia tensor. Steiner Theorem, equation 7.60 (Siciliano)
    I_tensor = eye(3,3)*I + m*((S')*S);
    
    
    
    %Motor inertia
    Im = I;
    
    
    %% Equation 7.113 (Siciliano). Depending on the book edition there might be a typo error with a double cross(w,I_tensor*w) 
    curr_u = cross(-curr_f,rij+rici) + R*prev_u + cross(R*prev_f,rici) ...
             + I_tensor*wd + cross(w,I_tensor*w) ...
             + kri*qdd(i+1)*Im*zm + kri*qd(i+1)*Im*cross(w,zm);  % The final result doesn't agree with Siciliano's derivation for a 2-link robot arm if you don't comment this line 
             %There seems to be some kind of typo error in the line above.
             %I didn't have time to prove it, though.
    
    %% Equation 7.114 for a revolute joint (Siciliano)
    tau(i) = curr_u'*(Rt*z0) + kri*Im*wmd'*zm + fv*qd(i) + fc*sign(qd(i));
    
    prev_f = curr_f;
    prev_u = curr_u;
end