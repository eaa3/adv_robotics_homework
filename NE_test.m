function NE_test
    
    load rob2;
    
    tau1 = [];
    tau2 = [];
    
    error = [];
    
    N = 2;
    for i=(0:10),
        
            for j=(0:10),
                for k=(0:pi/10:2*pi),
                    
                    
                    rq = rand(1,N)*2*pi;
                    rqd = rand(1,N)*2*pi;
                    rqdd = rand(1,N)*2*pi;
                    
                    [t,W,Wd,Wmd,Pdd,Pcdd,Rici,Rij,Rot] = NewtonEulerAux(N,1,1,1,1,1,[0;-9.81;0],rq,rqd,rqdd);
                
                    index = i*10+j+1;
                    
                    tau1 = [tau1 t];
           
                    t2 = two_link_example_siciliano(1,1,1,9.81,1,1,rq,rqd,rqdd);
    
                    tau2 = [tau2 t2];
                    
                    error = [error norm(t - t2)];
                end
            end
    end
    
    
    subplot(1,2,1);
    plot(tau2','b+');
    hold on;   
    plot(tau1','ro');
    
    
    subplot(1,2,2);
    plot(1:length(error),error,'r-');
    title(sprintf('Error (Mean: %g Std: %g',mean(error),std(error)));
    
        