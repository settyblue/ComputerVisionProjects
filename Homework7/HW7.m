%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW7
% 10/11/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
Im = double(imread('checker.png'));
sigma_I = 1;
sigma_D = 0.7;
alpha = 0.05;
threshold = 1000000000;
[Gx, Gy] = gaussDeriv2D(sigma_D);
Ix = imfilter(Im, Gx, 'replicate');
Iy = imfilter(Im, Gy, 'replicate');
colormap('gray');imagesc(Ix), figure
colormap('gray');imagesc(Iy), figure
Ix2 = Ix.^2; Iy2 = Iy.^2; Ixy = Ix.*Iy;
G = fspecial('gaussian', 2*ceil(3*sigma_I)+1, sigma_I);
IGx2 = imfilter(Ix2, G, 'replicate');
IGy2 = imfilter(Iy2, G, 'replicate');
IGxy = imfilter(Ixy, G, 'replicate');
colormap('gray');imagesc(IGx2), figure
colormap('gray');imagesc(IGy2), figure
colormap('gray');imagesc(IGxy), figure

R = get_harris_response(Im, IGx2, IGy2, IGxy, alpha, threshold);
colormap('gray');imagesc(R), figure
[R_suppressed, R_points] = non_maximal_suppress(R, threshold);
colormap('gray');imagesc(R_suppressed), figure
imshow(Im/255);hold on;
plot(R_points(:,2),R_points(:,1),'rx');hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
Im = double(imread('tower.png'));
col_pointer = [ 3 3 2 1 0 -1 -2 -3 -3 -3 -2 -1 0 1 2 3 ];
row_pointer = [ 0 -1 -2 -3 -3 -3 -2 -1 0 1 2 3 3 3 2 1 ];
n_star = 9;n = 16;
for T=[10 20 30 50]
    interest_points = get_interest_points(Im, col_pointer, row_pointer,...
                                    n, n_star, T);
    imshow(Im/255),hold on;
    plot(interest_points(:,2), interest_points(:,1),'rx');
    title('T = ')
    hold off;
    figure;
end