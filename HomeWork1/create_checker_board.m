function [ ] = create_checker_board( size )
%CREATE_CHECKER_BOARD Solution to problem-3 of Homework-1.
%   Create a checker board image.
zBlock = zeros(size,size);
oBlock = ones(size,size)*255;
pattern = [zBlock oBlock; oBlock zBlock];
checkerIm = repmat(pattern, 5, 5);
imwrite(uint8(checkerIm), 'checkerIm.bmp');
Im = imread('checkerIm.bmp');
imagesc(Im)
colormap('gray')
axis('image');
end

