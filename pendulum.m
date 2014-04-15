function tau = pendulum(L,m,I,g,q,qd,qdd)

Im = 1;
kr = 1;
F = 1;
Fm = 1;
tau = (I+Im*kr^2)*qdd + (F+Fm*kr^2)*qd + m*L*sin(q);