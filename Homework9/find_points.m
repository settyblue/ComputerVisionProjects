function [ X ] = find_points( position, sorted_list, matrix)
%FIND_POINTS Summary of this function goes here
%   Detailed explanation goes here
    X = zeros(size(position,2),2);
    count = 1;
    for i = position
        value = sorted_list(i);
        flag = false;
        for r = 1:size(matrix,1)
            for c = 1:size(matrix,2)
                if value == matrix(r,c)
                    flag = true;
                    X(count,1) = r;
                    X(count,2) = c;
                    count = count+1;
                    break
                end 
            end
            if flag
                break
            end
        end
    end
end

