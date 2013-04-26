function XMDS=SAMPLE_MDS(D,dim)
    % Compute the Multidimensional scaling from the squared distance matrix D
    % dim is the number of dimensions to return

    D= D .* D;
    % Basic parameters
    samples=size(D,1);
    I=eye(samples);
    J=ones(samples,samples);

    % Centred kernel matrix
    K=-0.5*(I-J/samples)*D*(I-J/samples);
    K=0.5*(K+K');

    % Eigendecomposition
    [U,E]=seig(K);

    % prune negative eigenvalues
    E=max(0,E);

    % Return MDS
    XMDS=U*sqrt(E);

    XMDS=XMDS(:,1:dim);
end