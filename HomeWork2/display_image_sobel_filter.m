function [ ] = display_image_sobel_filter( Im )
%DISPLAY_IMAGE_SOBEL_FILTER Summary of this function goes here
%   Detailed explanation goes here
    Fx = -fspecial('sobel')';
    fxIm = imfilter(Im,Fx);
    Fy = -fspecial('sobel');
    fyIm = imfilter(Im,Fy);
    magIm = sqrt(fxIm.^2 + fyIm.^2);
    imagesc(magIm);
end

