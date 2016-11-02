function [  ] = display_image( grey_image_filename, rgb_image_filename )
%PROBLEM1 Solution to problem-1 of Homework-1.
%   Test the MATLAB image functions to read, display, and write images.
%   Display Gray scale image
grayIm = imread(grey_image_filename);
imagesc(grayIm);
axis('image');
colormap('gray');
imwrite(grayIm, strrep(grey_image_filename,'bmp','jpg'));
pause;

%   Display colour image
rgbIm = imread(rgb_image_filename);
imagesc(rgbIm);
axis('image');
imwrite(rgbIm, strrep(rgb_image_filename,'bmp','jpg'));
end

