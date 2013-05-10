function accuracy=LRC(X,c)
    % Compute the classification accuracy using a logistic regression classifier.
    % X contains the data vectors, c contains the classes
    
    SizeOfX = size(X,2);
    theta = zeros(SizeOfX);
    
    [loss,gradient] = Grad_Descent([], [], theta, 0.0002);
    
    
end

