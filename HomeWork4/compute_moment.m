function [ moment ] = compute_moment( Im, centroid_row, centroid_col, row_order, col_order )
%COMPUTE_MOMENT Summary of this function goes here
%   Detailed explanation goes here
    moment = 0.0;
    for i=1:size(Im, 1)
        for j=1:size(Im, 2)
            moment = moment + (((i-centroid_row)^row_order * (j-centroid_col)^col_order)*Im(i,j));
        end
    end
end

