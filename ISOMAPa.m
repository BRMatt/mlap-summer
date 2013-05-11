function XISO=ISOMAP(D)
    % Compute the ISOMAP embedding of objects represented by distance matrix D.
    % D contains distances, not squared distances
    
    Neighbours = NearestNeighbours(D, 10);
    
    ShortestPaths = FloydWarshall(Neighbours);
    
    XISO=MDS(ShortestPaths);    
end

