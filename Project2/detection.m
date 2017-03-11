% Object detection
load('footage/footage');

hsv1 = rgb2hsv(left_1(:,:,:,1));
hsv2 = rgb2hsv(left_1(:,:,:,2));
hue1 = hsv1(:,:,1,1);
hue2 = hsv2(:,:,1,1);

% Run Sobel derivative masks for fx, fy
fx = imfilter(hue2,-fspecial('sobel')'/8);
fy = imfilter(hue2,-fspecial('sobel')/8);

% Smooth and subtract for ft
smooth = fspecial('gaussian', 7, 7);
ft = imfilter(hue2,smooth) - imfilter(hue1,smooth);

% Compute normalization factor
normalize = sqrt(fx.*fx+fy.*fy);

% Plot normal flow (Notice we flip Y because Matlab plots quivers and
% images with opposite Y-axes)
%[X, Y] = meshgrid(1:1024, 1:768);
%quiver(X, Y, -ft.*fx./normalize.^2, -ft.*-fy./normalize.^2);
flow = -ft./normalize;