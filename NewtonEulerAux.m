function [tau,W,Wd,Wmd,Pdd,Pcdd,Rici,Rij,Rot] = NewtonEulerAux(N,L,m,I,fv,fc,g,q,qd,qdd)


%% Gear reduction ratio
%100
%350
kri = 100;
%% Rotor inertia
Im = 0.01;
%% Rotor mass
mm = 0.5;%0.5;

[W,Wd,Wmd,Pdd,Pcdd,Rici,Rij,Rot] = NEForward(N,L,g,kri,q,qd,qdd);


tau = NEBackwards(N,m,I,mm,Im,kri,q,qd,qdd,fv,fc,W,Wd,Wmd,Pcdd,Rij,Rici,Rot);
    
    
    
    
    