function [ r,c ] = get_pointer( Im )
%GET_POINTER Summary of this function goes here
%   Detailed explanation goes here
    Im_red = imsubtract(Im(:,:,1), rgb2gray(Im));
    Im_red = medfilt2(Im_red, [3 3]);
    Im_red = im2bw(Im_red,0.2);
    Im_red = bwlabel(Im_red, 8);
    red_dot = regionprops(Im_red, 'BoundingBox','Centroid');
    if size(red_dot) ~= 0
        r = red_dot(1,1).Centroid(1,1);
        c = red_dot(1,1).Centroid(1,2);
    else
        r = 0;
        c = 0;
    end
    %imshow(Im_red);
end

