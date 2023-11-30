function [pp,disttots] = createpaths(deliveries,num_V)
    %% Find closest points 
    distances = pdist(deliveries);
    linkageMatrix = linkage(distances, 'average'); % 'average' linkage can be replaced with other methods
    % Perform clustering
    p = cluster(linkageMatrix, 'MaxClust', num_V);
    
    %%
    % Create 
    pp = cell(num_V, 1); 
    disttots = zeros(1,num_V);
    for i = 1:num_V
        idx = find(p == i);
        pp{i} = cell(length(idx), 1); % Initialize cell array for each cluster
    
        if length(idx) == 1
            dist = calculateDistance([10;10], deliveries(idx, :));
            disttots(i) = disttots(i) + dist;
            pathPoints = paths([10,10], deliveries(idx,:));
            pp{i} = pathPoints;
        else
            for j = 1:length(idx)-1
                if j==1
                   dist = calculateDistance([10;10], deliveries(idx(j), :));
                   disttots(i) = disttots(i) + dist;
                   pathPoints = paths([10,10], deliveries(idx(j), :));
                   pp{i,j} = pathPoints;
                end
            % Calculate distance between points
                dist = calculateDistance(deliveries(idx(j), :), deliveries(idx(j+1), :));
                disttots(i) = disttots(i) + dist;
            % Calculate paths
                pathPoints = paths(deliveries(idx(j), :), deliveries(idx(j+1), :));
                pp{i,j+1} = pathPoints;
              
            end
        end
    end
end