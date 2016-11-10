function [ Im ] = getViableSize( Im )
%GETVIABLESIZE Summary of this function goes here
%   Detailed explanation goes here
    Im = Im(1:2:1024,1:2:1024,1);
end

