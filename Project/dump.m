Im = imread('reddot.png');
    snap = Im;
    % Extract red by subtracting red from grayscale
    snap_red = imsubtract(snap(:,:,1), rgb2gray(snap));
    snap_blue = imsubtract(snap(:,:,3), rgb2gray(snap));
    snap_green = imsubtract(snap(:,:,2), rgb2gray(snap));
    % Filter out noise
    snap_red = medfilt2(snap_red, [3 3]);
    snap_blue = medfilt2(snap_blue, [3 3]);
    snap_green = medfilt2(snap_green, [3 3]);
    % Convert new snapshot to binary
    snap_red = im2bw(snap_red,0.18);
    snap_blue = im2bw(snap_blue,0.18);
    snap_green = im2bw(snap_green,0.18);
    % Remove pixles less than 300px
    snap_red = bwlabel(snap_red, 8);
    snap_blue = bwlabel(snap_blue, 8);
    snap_green = bwlabel(snap_green, 8);
    % Label all connected components
    bw_red = bwlabel(snap_red,8);
    bw_blue = bwlabel(snap_blue,8);
    bw_green = bwlabel(snap_green,8);
    % Properties for each labeled region
    stats_red = regionprops(bw_red, 'BoundingBox','Centroid');
    stats_blue = regionprops(bw_blue, 'BoundingBox','Centroid');
    stats_green = regionprops(bw_green, 'BoundingBox','Centroid');
    % Display new image
    drawnow
    % Puts red objects in rectangular box
    for object_red = 1:length(stats_red)
        bb_red = stats_red(object_red).BoundingBox;
        bc_red = stats_red(object_red).Centroid;
        plot(bc_red(1),-bc_red(2),'or')
        axis([0 300 -300 0])
    end
    hold on
    % Puts blue objects in rectangular box
    for object_blue = 1:length(stats_blue)
        bb_blue = stats_blue(object_blue).BoundingBox;
        bc_blue = stats_blue(object_blue).Centroid;
        plot(bc_blue(1),-bc_blue(2),'ob')
        axis([0 300 -300 0])
    end
    % Puts blue objects in rectangular box
    for object_green = 1:length(stats_green)
        bb_green = stats_green(object_green).BoundingBox;
        bc_green = stats_green(object_green).Centroid;
        plot(bc_green(1),-bc_green(2),'og')
        axis([0 300 -300 0])
    end
    hold off