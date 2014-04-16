function [robota,q_out] = fdyn_ne(N)

%% params

if nargin < 1,
    N = 3;
end

tau_act = zeros(N,1);
%all zeros
q0 = [zeros(N,1)];
qd0 = zeros(N,1);
qdd0 = zeros(N,1);
fv = 0.05;
fc = 0.5;
I = 10;
L = 2;
m = 5;
g = [0 -9.81 0]';

%% DeltaTime for Euler integration
% 0.5
deltaTime = 0.4;


time = 0:deltaTime:200;
q = q0;
qd = qd0;
qdd = qdd0;

q_out = [];
for t=time,
    
    %% Computing Inertia Matrix B (According to Siciliano's Book)
    B = [];
    Binv = [];
    for i=(1:N),
        q_tmp = zeros(N,1);
        qd_tmp = zeros(N,1);
        qdd_tmp = zeros(N,1);
        qdd_tmp(i) = 1;
        
        bi = NewtonEuler(N,L,m,I,fv,fc,g,q_tmp,qd_tmp,qdd_tmp);
        B = [B bi];
    end
    Binv = inv(B);
    
    tau = NewtonEuler(N,L,m,I,fv,fc,g,q,qd,qdd0);
    qdd = Binv*(tau_act - tau);
    
    qd = qd + qdd*deltaTime;
    q = q + qd*deltaTime;
    
    q_out = [q_out; q'];
    
end


figure;

DH = [];
for i=(1:N),
    subplot(N,1,i);
    plot(time,q_out(:,i))
    xlabel('Time (s)');
    ylabel(sprintf('Joint %d (rad)',i));
    
    display('Press any key to continue');
   % k = waitforbuttonpress;
    DH = [DH;1 0 0 0 0];
end

robota = constructRobot(DH);
figure;
plot(robota,q_out);



