function [tau] = NewtonEuler(N,L,m,I,fv,fc,g,q,qd,qdd)

    [tau,~,~,~,~,~,~,~,~] = NewtonEulerAux(N,L,m,I,fv,fc,g,q,qd,qdd);