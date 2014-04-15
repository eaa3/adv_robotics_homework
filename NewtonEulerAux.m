function [tau,W,Wd,Wmd,Pdd,Pcdd,Rici,Rij,Rot] = NewtonEulerAux(N,L,m,I,fv,fc,g,q,qd,qdd)


%% Gear reduction ratio
kri = 1;

[W,Wd,Wmd,Pdd,Pcdd,Rici,Rij,Rot] = NEForward(N,L,g,kri,q,qd,qdd);


tau = NEBackwards(N,m,I,kri,q,qd,qdd,fv,fc,W,Wd,Wmd,Pcdd,Rij,Rici,Rot);
    
    
    
    
    