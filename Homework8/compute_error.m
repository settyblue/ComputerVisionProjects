function [ e ] = compute_error( x, xnew )
%COMPUTE_ERROR Summary of this function goes here
%   Detailed explanation goes here
    r = x-xnew(:,1:2);
    e = sum(sum(r.^2));
end

