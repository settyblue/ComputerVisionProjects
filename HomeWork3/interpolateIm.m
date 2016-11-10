function [ temp ] = interpolateIm( temp )
%INTRAPOLATEIM Summary of this function goes here
%   Detailed explanation goes here

    for i=1:size(temp,1)
        for j=1:size(temp,2)
            if mod(i,2)==1 && mod(j,2)==1
                continue;
            elseif mod(i,2)==1 && mod(j,2)==0
                if j ~= size(temp,2)
                    temp(i,j) = (temp(i,j-1)+temp(i,j+1))/2;
                end
            elseif mod(i,2)==0 && mod(j,2)==1
                if i ~= size(temp,1)
                    temp(i,j) = (temp(i-1,j)+temp(i+1,j))/2;
                end
            else
                if i ~= size(temp,1) && j ~= size(temp,2)
                    temp(i,j) = (temp(i-1,j-1)+temp(i+1,j-1)+temp(i-1,j+1)+temp(i+1,j+1))/4;
                end
            end 
        end
    end

end
