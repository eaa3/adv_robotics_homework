function ik_test(p_dest,DH, q, q_dest, Mq);

if nargin < 2
    DH = [1 0 0 pi/12 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 pi/3 0; 1 0 0 pi/6 0; 1 0 0 pi/12 0; 1 0 0 0 0; 1 0 0 pi/6 0; 1 0 0 pi/3 0; ; 1 0 0 0 0; ; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];
    q = [pi/12 pi/6 pi/3 zeros(1,17)]';
    q_dest = [0; zeros(17,1); 0; 0];
    Mq = 1;
    
    if nargin < 1
        p_dest = [9.5 5 0 0 0 -pi/6]';
    end
    
end

%q_new = ik(DH,[pi/12 pi/6 pi/3 0 0]',[4 0 0]',[0 0 0]',0);

q_new = ik(DH,q,p_dest,q_dest,Mq);



r = constructRobot(DH);

clf;

plot(r,q_new);

%
%hsl = uicontrol('Style','slider','Min',slmin,'Max',slmax,...
%                'SliderStep',[1 1]./(slmax-slmin),'Value',1,...
%                'Position',[20 20 200 20]);
%set(hsl,'Callback',@(hObject,eventdata) plot(m(:,round(get(hObject,'Value')))) )
%uicontrol('Style','text',...
%        'Position',[400 45 120 20],...
%        'String','X-coordinate')
