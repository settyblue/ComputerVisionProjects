function [ cube ] = normalize( cube, total )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    for i=1:size(cube,1)
        for j=1:size(cube,2)
            for k=1:size(cube,3)
                cube(i,j,k) = cube(i,j,k)/total;
            end
        end
    end

end

