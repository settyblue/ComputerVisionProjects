function [ Im, magIm ] = display_image_gaussDeriv2D_filter( Gx,Gy, imagefilename )
%DISPLAY_IMAGE_GAUSSDERIV2D_FILTER Summary of this function goes here
%   Detailed explanation goes here
    Im=double(imread(imagefilename));
    gxIm = imfilter(Im, Gx, 'replicate');
    gyIm = imfilter(Im, Gy, 'replicate');
    magIm = sqrt(gxIm.^2 + gyIm.^2);
    colormap('gray');
    imagesc(magIm);
end

