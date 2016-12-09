function [ Gx, Gy ] = gaussDeriv2D( sigma )
%GAUSSDERIV2D Summary of this function goes here
%   Detailed explanation goes here
    N = 100;
    ind = -floor(N/2) : floor(N/2);
    [X, Y] = meshgrid(ind, ind);

    %Create Gaussian Mask
    G1 = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
    [Gx,Gy] = gradient(G1);

    %Normalize so that total area (sum of all weights) is 1
    Gx = (-1)*Gx/(max(Gx(:)));
    Gy = Gy/(max(Gy(:)));
end

