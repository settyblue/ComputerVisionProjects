function [ area ] = compute_area( Im )
%COMPUTE_AREA Summary of this function goes here
%   Detailed explanation goes here
    area_array = table2array(regionprops('table', Im, 'Area'));
    area_indices = find(area_array > 0, 1);
    if isempty(area_indices)
        area = 0;
    else
        area = area_array(area_indices(1, 1));
    end
end

