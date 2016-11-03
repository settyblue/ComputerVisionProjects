% Rakshith Kunchum
% HW2
% 9/2/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1

for sigma = 20:-2.5:0.5
    sigma
    display_image(sigma)
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
sigma = 2;
[Gx, Gy] = gaussDeriv2D(sigma);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
[Im, magIm] = display_image_gaussDeriv2D_filter(Gx,Gy,'afghangirl.jpg');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4
max = max(magIm(:));
for T = max/10:2*max/10:max
tIm = magIm > T;
colormap('gray');
imagesc(tIm);
pause;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5
display_image_sobel_filter(Im)
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 6
edge(Im,'canny');
