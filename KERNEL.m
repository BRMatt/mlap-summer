function [ K ] = KERNEL( D )
    % Generates the kernel matrix for a set of squared distances
    
    SizeOfD = size(D, 1);

    I = eye(SizeOfD);
    J = ones(SizeOfD,SizeOfD);
    
    K = -0.5 * (I - (J / SizeOfD)) * D * (I - (J / SizeOfD));
    
    % Not perfectly symmetrical due to rounding errors etc., average them to provide symmetric values
    K = (K + K') ./ 2;
end

