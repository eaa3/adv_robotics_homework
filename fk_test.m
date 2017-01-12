function result = fk_test
    
    [DH,q] = default_dh;
    
    r = constructRobot(DH);
    
    test_pose = 0;
    test_jacob = 0;
    
    error_tolerance = 0.00001;    
    
    % if the sum of the corresponding in M1 and M2 elements whoose abs
    % difference is greater than the tolerance matrix
    % error_tolerance*ones(size(M1)), then M1 is different of M2
    isequals_matrix = @(M1,M2) sum(sum( (abs(M1 - M2) > error_tolerance*ones(size(M1))) )) == 0;
    
    for i = (1:1000),
        
        q_tmp = rand(length(q),1);
        
        [T,J] = fk(DH,q_tmp);
        
        %% Just a test to compare my fk function with the builtin fkine
        T2 = fkine(r,q_tmp);
        J2 = jacob0(r,q_tmp);
        
        if( ~isequals_matrix(T,T2) ),
            test_pose = test_pose + 1;
        end
        
        
        if( ~isequals_matrix(J,J2) ),  
            test_jacob = test_jacob + 1;
        end
        

        
    end
    
    
    result = [sum(test_pose) sum(test_jacob)];