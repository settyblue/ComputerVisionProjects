function [ box ] = compute_boundingbox( Im )
%COMPUTE_BOUNDINGBOX Summary of this function goes here
%   Detailed explanation goes here
    bounded_box = regionprops('table', Im, 'BoundingBox');
    unique_values = table2array(unique(bounded_box));
    box = zeros(1, 4);
    for row=1:size(unique_values, 1)
        if(unique_values(row, 3) > 0 && unique_values(row, 4) > 0)
            box(1, :) = unique_values(row, :);
            break;
        end
    end
end

