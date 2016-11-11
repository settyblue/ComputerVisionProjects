function [centroid] = compute_centroid( Im )
%COMPUTE_CENTROID Summary of this function goes here
%   Detailed explanation goes here
    centroids_array = table2array(regionprops('table', Im, 'Centroid'));
    [rows, cols] = find(~isnan(centroids_array));
    unique_rows = unique(rows);
    centroid = zeros(1,2);
    centroid(1,1) = centroids_array(unique_rows(1), 1);
    centroid(1,2) = centroids_array(unique_rows(1), 2);
end

