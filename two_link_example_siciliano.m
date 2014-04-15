
%% This function is used just for testing
function [tau,W,Wd,Pdd,Pcdd,Wmd] = two_link_example_siciliano(L,m,I,g,fv,fc,q,qd,qdd)
    kr = 1; % Hard coded computation
    Im = 1; % Hard coded computation
    I = 1.25; % Parallel axis theorem (Hard coded computation)
    
    tau = zeros(2,1);
    
    w11 = [ 0 0 qd(1) ]';
    wd11 = [ 0 0 qdd(1)]';
    
    pdd11 = [ (-L*(qd(1)^2) + g*sin(q(1))) (L*qdd(1)+g*cos(q(1))) 0]';
    
    pcdd11 = [ (-(-L/2+L)*(qd(1)^2) + g*sin(q(1))) ((-L/2+L)*(qd(1)^2) + g*cos(q(1))) 0]';
    
    wmd10 = [ 0 0 kr*qdd(1)]';
    
    w22 = [ 0 0 (qd(1)+qd(2)) ]';
    wd22 = [ 0 0 (qdd(1)+qdd(2))]';
    
    pdd22 = [ (L*sin(q(2))*qdd(1) - L*cos(q(2))*(qd(1)^2) - L*((qd(1)+qd(2))^2) +g*sin(sum(q)) ) ...
              (L*cos(q(2))*qdd(1) + L*(qdd(1) + qdd(2)) + L*sin(q(2))*(qd(1)^2) + g*cos(sum(q))) ...
              0]';
   
    pcdd22 = [ (L*sin(q(2))*qdd(1) - L*cos(q(2))*(qd(1)^2) - (-L/2+L)*((qd(1)+qd(2))^2) +g*sin(sum(q)) ) ...
              (L*cos(q(2))*qdd(1) + (-L/2+L)*(qdd(1) + qdd(2)) + L*sin(q(2))*(qd(1)^2) + g*cos(sum(q))) ...
               0]';
    
    wmd21 = [ 0 0 (qdd(1) + kr*qdd(2))]';
    
    W{1} = w11; W{2} = w22;
    Wd{1} = wd11; Wd{2} = wd22;
    Pdd{1} = pdd11; Pdd{2} = pdd22;
    Pcdd{1} = pcdd11; Pcdd{2} = pcdd22;
    Wmd{1} = wmd10; Wmd{2} = wmd21;
    
    
    tau(1) = (I + m*(-L/2 + L)^2 + (kr^2)*Im + I + m*(L^2 + (-L/2 + L)^2 + 2*L*(-L/2 + L)*cos(q(2))))*qdd(1) ...
             + (I + m*((-L/2 + L)^2 + L*(-L/2 + L)*cos(q(2))))*qdd(2) ...
             - 2*m*L*(-L/2 + L)*sin(q(2))*qd(1)*qd(2) - m*L*(-L/2 + L)*sin(q(2))*(qd(2)^2) ...
             + (m*(-L/2 + L)+m*L)*g*cos(q(1)) + m*(-L/2 + L)*g*cos(sum(q)) + fv*qd(1) + fc*sign(qd(1));
    
    tau(2) = (I + m*((-L/2 + L)^2 + L*(-L/2 + L)*cos(q(2))) + kr*Im)*qdd(1) ...
            + (I + m*(-L/2 + L)^2 + (kr^2)*Im)*qdd(2) ...
            + m*L*(-L/2 + L)*sin(q(2))*(qd(1)^2) + m*(-L/2 + L)*g*cos(sum(q)) +  fv*qd(2) + fc*sign(qd(2));