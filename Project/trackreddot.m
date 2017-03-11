Im = imread('reddot.png');
    snap = Im;
    % Extract red by subtracting red from grayscale
    snap_red = imsubtract(snap(:,:,1), rgb2gray(snap));
    imshow(snap_red);
    % Filter out noise
    snap_red = medfilt2(snap_red, [3 3]);
    imshow(snap_red);
    % Convert new snapshot to binary
    snap_red = im2bw(snap_red,0.18);
    imshow(snap_red);
    % Label all connected components.
    snap_red = bwlabel(snap_red, 8);
    imshow(snap_red);
    % Properties for each labeled region
    stats_red = regionprops(snap_red, 'BoundingBox','Centroid');
    hold on
    plot(stats_red.Centroid(1,1),stats_red.Centroid(1,2),'O')