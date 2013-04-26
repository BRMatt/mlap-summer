function ShortestPaths = FloydWarshall(Graph)
    SizeOfGraph = size(Graph,1);
    
    ShortestPaths = Graph;
    
    for k=1:SizeOfGraph
        for i=1:SizeOfGraph
            for j=1:SizeOfGraph
                ThisCost = ShortestPaths(i,k) + ShortestPaths(k,j);
                
                if ThisCost < ShortestPaths(i,j)
                    ShortestPaths(i,j) = ThisCost;
                end
            end
        end
    end
end