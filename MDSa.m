function XMDS = MDSa( D )
    % Compute the Multidimensional scaling from the distance matrix D.
    % D contains distances, not squared distances
    
    % Square the distances
    D = D .* D;
    
    SizeOfD = size(D, 1);
    
    
    % Add the constant to the kernel matrix
    K = KERNEL(D);
    [U,L] = eig(K);
    SmallestValue = min(L);
    Application = ((-eye(SizeOfD)) + 1) .* SmallestValue;
    D = D + Application;
    
    K = Kernel(D);
    [U,L] = eig(K);
    
    % eig() returns the eigenvalues with the smallest 3 first, this
    % reverses them so largest come first
    L=diag(L);
    L=diag(L(SizeOfD:-1:1));
    U=U(:,SizeOfD:-1:1);
    
    % For task 2
    % plot(1:SizeOfD,L,'red');
        
    XMDS = U * sqrt(L);
    XMDS=XMDS(:,1:3);
end

