function [ ] = display_image( sigma )
%DISPLAY_IMAGE Summary of this function goes here
%   Detailed explanation goes here
    G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
    faceIm=double(imread('face.jpeg'));
    gIm = imfilter(faceIm, G, 'replicate');
    imshow(gIm/255); % double images need range of 0-1
    imwrite(uint8(gIm), 'gIm.bmp');
    pause;
end

