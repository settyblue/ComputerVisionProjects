function [ moment ] = compute_moment( Im, centroid_y, centroid_x, row_order, col_order )
%COMPUTE_MOMENT Summary of this function goes here
%   Detailed explanation goes here
    moment = 0.0;
    for i=1:size(Im, 1)
        for j=1:size(Im, 2)
            moment = moment + (((i-centroid_y)^row_order * (j-centroid_x)^col_order)*Im(i,j));
        end
    end
end

