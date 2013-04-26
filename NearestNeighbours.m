function NN = NearestNeighbours(distances, NumNeighbours)
    NumPoints = size(distances,1);

    WorkingCopy = distances;

    % The diagonal indicates distance from node to itself
    % (i.e. 0), get rid of it
    WorkingCopy(eye(NumPoints)~=0)=inf;

    NN = ones(NumPoints, NumPoints) .* inf;
    
    NN(logical(eye(NumPoints))) = 0;

    for i=1:NumNeighbours
       for j=1:NumPoints
            [C,I] = min(WorkingCopy(j,:));

            % This just ensures the minimum distances are mirrored,
            % and that every row/col has at least one link to something
            NN(j,I) = C;
            NN(I,j) = C;
            
            WorkingCopy(j,I) = inf;
       end
    end
end
