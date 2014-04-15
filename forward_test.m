function ok =  forward_test

    
    
    ok = 1;
    
    for i=(0:10),
        
            for j=(0:10),
                for k=(0:pi/10:2*pi),
                    rqd = [rand*2*pi rand*2*pi];
                    rqdd = [rand*2*pi rand*2*pi];
                  
                    [t,W1,Wd1,Wmd1,Pdd1,Pcdd1,Rici1,Rij1,Rot1] = NewtonEulerAux(2,1,1,1,1,1,[0;-9.81;0],[rand*2*pi rand*2*pi],rqd,rqdd);
                    %t = rne(rob2,[0 0],[i i],[j j]);
                    index = i*10+j+1;
                    
                   % tau1 = [tau1 t];
                    
                    [t2,W2,Wd2,Pdd2,Pcdd2,Wmd2] = two_link(1,1,1,9.81,1,1,[rand*2*pi rand*2*pi],rqd,rqdd);%rne(rob2,[0 0],[0 j],[0 0]);
                    
                  %  tau2 = [tau2 t2];
                    
                    s = length(W1);
                    for u=(1:s),
                        %W1{u} - W2{u}
                        if ~isequal(W1{u},W2{u})
                            ok = 0;
                        end
                    end
                    
                end
            end
    end
    
    
        