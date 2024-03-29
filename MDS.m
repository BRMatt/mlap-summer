function XMDS = MDS( D )
    % Compute the Multidimensional scaling from the distance matrix D.
    % D contains distances, not squared distances
    
    % Square the distances
    D = D .* D;
    
    SizeOfD = size(D, 1);
    
    I = eye(SizeOfD);
    J = ones(SizeOfD,SizeOfD);
    
    K = -0.5 * (I - (J / SizeOfD)) * D * (I - (J / SizeOfD));
    
    % Not perfectly symmetrical due to rounding errors etc., average them to provide symmetric values
    K = (K + K') ./ 2;
    
    [U,L] = eig(K);
    
    % eig() returns the eigenvalues with the smallest 3 first, this
    % reverses them so largest come first
    L=diag(L);
    L=diag(L(SizeOfD:-1:1));
    U=U(:,SizeOfD:-1:1);
    
    % For task 2
    % plot(1:SizeOfD,L,'red');
    
    % Get rid of any negative values so we can sqrt
    L=max(0,L);
    
    XMDS = U * sqrt(L);
    XMDS=XMDS(:,1:3);
end

