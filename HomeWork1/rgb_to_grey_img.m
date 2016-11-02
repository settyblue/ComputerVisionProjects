function [ ] = rgb_to_grey_img( image_filename )
%PROBLEM2 Solution to problem-2 of Homework-1
%   Convert gray scale image to rgb.
rgbIm = imread(image_filename);
grayIm = rgb2gray(rgbIm);
imagesc(grayIm);
colormap('gray');
axis('image');
end

