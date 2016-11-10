%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW3
% 9/12/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
I = cell(1,4);
L = cell(1,4);
I{1} = getViableSize(double(imread('sailor.jpg')));
figure, imshow(I{1}/255);
figure, imhist(I{1}/255);
pause;
for i = 2:4
    I{i} = reduceIm(I,i-1);
    L{i-1} = I{i-1} - expandIm(I,i); 
    figure, imshow(I{i-1}/255);
    figure, imshow(L{i-1}/255);
    figure, imhist(L{i-1}/255);
    pause;
end
L{4} = I{4};
figure, imshow(I{4}/255);
figure, imshow(L{4}/255);
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
walkIm = double(imread('images/walk.bmp'));
bgIm = zeros(size(walkIm,1),size(walkIm,2),30);
for i=0:29
    filename = sprintf('images/bg%03d.bmp', i);
    bgIm(:,:,i+1) = double(imread(filename));
end
for Threshold = 10:10:60
    walkerIm = abs((bgIm(:,:,1) - walkIm)) > Threshold;
    figure, imshow(walkerIm)
end
walkerIm = abs((bgIm(:,:,1) - walkIm)) > 150;
figure, imshow(walkerIm)
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
bgImAvg = mean(bgIm,3);
bgImStd = std(bgIm,[],3);
for Threshold = 60:-10:10
    walkerIm2 = abs((walkIm - bgImAvg).^2./bgImStd.^2) > Threshold^2;
    figure, imshow(walkerIm2)
end
pause;
walkerIm2 = abs((walkIm - bgImAvg).^2./bgImStd.^2) > 60^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4
walkerIm2_dl = bwmorph(walkerIm2, 'dilate');
imshow(walkerIm2_dl)
pause;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5
[walkerLabels, num] = bwlabel(walkerIm2_dl, 8);
figure, imshow(returnLargestLabelIm(walkerLabels, num));
figure, imshow(walkerIm2_dl);

