function [ moments ] = similitudeMoments( Im )
%SIMILITUDEMOMEMTS Summary of this function goes here
%   Detailed explanation goes here
    centroid = compute_centroid(Im);
    moments_order = [ 0 2; 0 3; 1 1; 1 2; 2 0; 2 1; 3 0];
    zero_order_moment = compute_moment(Im, centroid(1,1), centroid(1,2), 0, 0);
    moments = zeros (1, size(moments_order, 1));
    for row = 1:size(moments_order, 1)
        row_order = moments_order(row, 1);
        col_order = moments_order(row, 2);
        moment_value = compute_moment(Im, centroid(1,1), centroid(1,2), row_order ,col_order);
        moments(1, row) = moment_value / (zero_order_moment^(((row_order+col_order)/2) + 1));
    end

end

