function ik_test(DH, q,p_dest, q_dest, Mq)

if nargin < 1
    [DH,q,q_dest] = default_dh;    
  
    Mq = 0;
    p_dest = [10 10 17 0 0 pi/2]';
        %for drawing a r: [5 8.5 0 0 0 -pi/4]' or [0 10 0 0 0 -pi/4]'
        %for drawing a c and s: [0 10 0 0 0 -pi/2]';
    
end


%q_new = ik(DH,q,p_dest,q_dest,Mq);

r = constructRobot(DH);

%clf;

r.teach();
%s = size(q_new);
%q_new(s(1),:)
plot(r,q_new);
