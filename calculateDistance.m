function dist = calculateDistance(point1, point2)
% Compute distance between two points
% Inputs- point 1 and point 2
% Outputs- distance between two points
    
    % Initialize 
    x1 = point1(1);
    y1 = point1(2);
    x2 = point2(1);
    y2 = point2(2);
    % Calc distance
    dist = sqrt((x2 - x1)^2 + (y2 - y1)^2);
end