function [ density ] = epanechnikov_kernel_density( x1, y1, x0, y0, h )
%EPANECHNIKOV_KERNEL_DENSITY Summary of this function goes here
%   Detailed explanation goes here
    r = ((sqrt((x1-x0).^2+(y1-y0).^2))/h).^2;
    if r < 1
        density = 1-r;
    else
        density = 0;
    end
end

