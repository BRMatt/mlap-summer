function accuracy=LRC(XData,classes)
    % Compute the classification accuracy using a logistic regression classifier.
    % X contains the data vectors, c contains the classes
    
    SizeOfX = size(XData,1);
    TestDataSize = SizeOfX / 2;
    
    Theta = zeros(5,3);
    
    % Generate the set of /t/est data we want to use
    t = randperm(SizeOfX, TestDataSize);
    TestD = XData(t,:);
    TestC = classes(t);
    
    % Generate the set of /r/eal data
    r = setdiff(t, range(SizeOfX));
    RealD = XData(r,:);
    RealC = classes(r);
    
    params = fminunc(@NegativeLogLikelihood, Theta);

    good = 0;
    bad  = 0;
    
    for j=1:TestDataSize
       x = RealD(j,:);
       
       prob = Classify(x,classes,params);
       
       [p,index] = max(prob);
              
       c = classes(index);
       
       if c == RealC(j)
           good = good + 1;
       else
           bad = bad + 1;
       end
    end
    
    good
    bad
    
    good/(good + bad)
    
    function [ c ] = Classify( X, C, T)
        % Soft-Classify a data vector, X, given classes C, and their parameters, T

        e = exp(X * T');
        c = e/sum(e);
    end

    
    function f = NegativeLogLikelihood(T)
        f = 0;
        
        for i=1:TestDataSize
            X = TestD(i,:);
            c = TestC(i);
                        
            % The data applied to the parameter vector for its class
            data_class_theta = X * T(c,:)';
            
            xo = X * T';
            
            lse = log(sum(exp(xo)));
            
            f = f + (data_class_theta - lse);
        end
        
        f = -f;
    end
end

