%%Constructs a robot from the provided DH parameters, which includes the
%%joint type (0 - revolute, 1 - prismatic)

function robota = constructRobot(DH)

%% I'm considering that the DH table has the following format:
%
%
%      | a_1 | alpha_1 | d_1 | theta_1 | joint_type_1 |
% DH = | ... | ....... | ... | ....... | ............ | 
%      | a_n | alpha_n | d_n | theta_n | joint_type_n |
%
% where alpha_i and theta_i are specified in radians

s_dh = size(DH);


links = Link.empty;

for i=(1:s_dh(1)),
    
    if( DH(i,5) == 0 )
        links(i) = Revolute('a',DH(i,1),'alpha',DH(i,2),'d',DH(i,3));
    else
        links(i) = Prismatic('a',DH(i,1),'alpha',DH(i,2),'theta',DH(i,4));
    end    
end

robota = SerialLink(links);