function [ distance ] = riemannian_distance( covariance_matrix, modelCovMatrix )
%EUCLIDEAN_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
    distance = sqrt(sum(log(eig(covariance_matrix,modelCovMatrix)).^2));
end

