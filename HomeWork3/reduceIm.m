function [ temp ] = reduceIm( I, i )
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    temp = smoothenIm(I{i}, 0.4);
    temp = temp(1:2:end,1:2:end);
end

