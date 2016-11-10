function [ temp ] = expandIm( I, k )
%EXPANDIM Summary of this function goes here
%   Detailed explanation goes here
    temp = zeros(size(I{k},1)*2, size(I{k},1)*2);
    for i=1:2:size(temp,1)
        for j=1:2:size(temp,2)
            temp(i,j) = I{k}((i+1)/2,(j+1)/2);
        end
    end
    temp = interpolateIm(temp);
end

