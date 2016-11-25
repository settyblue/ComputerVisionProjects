%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW5
% 9/27/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
number_of_frames = 22;
I = cell(1,number_of_frames);
for i=1:number_of_frames
    I{i} = double(imread(sprintf('frames/aerobic-%03d.bmp', i)));
    %imshow(I{i}/255);
end

foreground_binary_collection = cell(1,number_of_frames);
foreground_binary_collection{1} = zeros(size(I{1}));
for i=2:number_of_frames
    threshold = 10;
    foreground = abs(I{i}-I{i-1});
    foreground = medfilt2(foreground,[4,4]);
    foreground_binary = foreground > threshold;
    foreground_binary_collection{i} = bwareaopen(foreground_binary,50);
    subplot(3,7,i-1), imshow(foreground_binary_collection{i-1});
end
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
MEImage = getMEI(I,number_of_frames);
figure, colormap('gray'), imagesc(MEImage/255), title('MEI Image');
MEImage_filtered = medfilt2(MEImage, [4,4]);
figure, colormap('gray'), imagesc(MEImage_filtered/255), title('MEI Filtered Image');
MHI = getMHI( foreground_binary_collection, number_of_frames);
MHImage = double(MHI{number_of_frames}) ./ number_of_frames;
figure, colormap('gray'), imagesc(MHImage), title('MHI Image');
momentsMEI = similitudeMoments(MEImage)
momentsMHI = similitudeMoments(MHI{22})
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
Im1 = zeros(101,101);Im1(40:60,40:60) = 255;
Im2 = zeros(101,101);Im2(41:61,41:61) = 255;
maskX = [-1 0 1;-2 0 2;-1 0 1]/8;
maskY = [-1 -2 -1;0 0 0;1 2 1]/8;
Fx1 = imfilter(Im1,maskX); Fy1 = imfilter(Im1,maskY);
Fx2 = imfilter(Im2,maskX); Fy2 = imfilter(Im2,maskY);
Ft = (smooth(Im2) - smooth(Im1));
NormalFlow = (-1)*Ft./sqrt(Fx1.*Fx1+Fy1.*Fy1);
NormalFlow = removeNan(NormalFlow)

% Horn and Schunck
[u,v] = horn_schunck_optical_flow(Fx1, Fy1, Ft);
figure, quiver(u,v);set(gca,'YDir','reverse'), title('Horn and Schunck Optical Flow');
pause;

% Lucas and Kanade
[u,v] = lucas_kanade_optical_flow(Fx1, Fy1, Ft);
figure, quiver(u,v);set(gca,'YDir','reverse'), title('Lucas and Kanade Optical Flow');
