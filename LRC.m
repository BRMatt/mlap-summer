function accuracy=LRC(allXData,classesForX)
    % Compute the classification accuracy using a logistic regression classifier.
    % X contains the data vectors, c contains the classes
    
    sizeOfX = size(allXData,1);
    testDataSize = sizeOfX / 2;
    
    Theta = zeros(5,3);
    
    ordering = randperm(sizeOfX);
    
    trainingIndexes = ordering(1:testDataSize);
    realIndexes     = ordering(testDataSize + 1:sizeOfX);
    
    params = fminunc(@NegativeLogLikelihood, Theta);

    good = 0;
    bad  = 0;
    
    for j=1:testDataSize
       realI = realIndexes(j);
       
       x = allXData(realI,:);
       
       prob = Classify(x,params);

       [~,c] = max(prob);
       
       if c == classesForX(realI)
           good = good + 1;
       else
           bad = bad + 1;
       end
    end
    
    accuracy = good/(good + bad);
    
    function [ c ] = Classify( X, T)
        % Soft-Classify a data vector, X, given classes C, and their parameters, T

        e = exp(X * T');
        c = e/sum(e);
    end

    
    function f = NegativeLogLikelihood(T)
        % T is the vector of theta parameters
        f = 0;
        
        for i=1:testDataSize
            X = allXData(trainingIndexes(i),:);
            c = classesForX(trainingIndexes(i));
                        
            % The data applied to the parameter vector for its class
            data_class_theta = X * T(c,:)';
            
            data_by_params = X * T';
            
            lse = log(sum(exp(data_by_params)));
            
            f = f + (data_class_theta - lse);
        end
        
        f = -f;
    end
end

