function [ s ] = compute_S( X )
%COMPUTE_S Summary of this function goes here
%   Detailed explanation goes here
    N = size(X,1);
    meanx = mean(X);
    meanx = repmat(meanx, N,1);
    %size(meanx)
    Xshifted = X - meanx;
    Xshifted = Xshifted.^2;
    s = sqrt(2)/(sum(sqrt(sum(Xshifted,2)))/N);
end

