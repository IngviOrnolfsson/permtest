function [t,dist] = CPH_testStatistic(xy)
% xy: array of coordinates in the format [xpos; ypos]
% t: test statistic
% dist: distances before averaging to find t


% Preallocation
n = size(xy,1);
distOther = nan(n,n);
distRadhuspladsen = nan(n,1);

% Loop over pairs of points
for i = 1:n
    for j = setdiff(1:n,i)

        % Distance between points
        distOther(i,j) = _____________;
    end

    % Distance to center
    distRadhuspladsen(i) = _____________;
    distMin(i) = min(distOther(i,:));
end

% Select which distance to use
dist = distRadhuspladsen;
% dist = distOther;
% dist = distMin;

% Return mean of distance test statistic to return - tR or tO
t = mean(dist,'all','omitnan');

end


% Hint: use norm(x1,x2) to calculate euclidean distances