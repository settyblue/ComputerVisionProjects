function [ color_hist ]  = colorHistogram(X , bins, x, y, h)
%COLORHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
%     color_hist = zeros(bins,bins,bins);
%     total = 0;
%     for i=1:size(X,1)
%         binx = ceil(X(i,3)/bins);
%         if(binx == 0)binx = 1;end
%         biny = ceil(X(i,4)/bins);
%         if(biny == 0)biny = 1;end
%         binz = ceil(X(i,5)/bins);
%         if(binz == 0)binz = 1;end
%         %binx = floor(X(i,3)/bins) +1;
%         %biny = floor(X(i,4)/bins) +1;
%         %binz = floor(X(i,5)/bins) +1;
%         value = epanechnikov_kernel_density(X(i,1),X(i,2),x,y,h);
%         total = total + value;
%         color_hist(binx, biny, binz) = color_hist(binx, biny, binz) +...
%             value;
%     end
%     color_hist = normalize(color_hist, total);
        colorCube = zeros(bins,bins,bins);
        sum = 0;
        [n, ~] = size(X);
        for i = 1:n
            curX = X(i,1);
            curY = X(i,2);
            curR = X(i,3);
            curG = X(i,4);
            curB = X(i,5);
            r = ((sqrt((curX-x)^2 + (curY-y)^2))/h)^2;
            if(r<1)
                kr = 1-r;
            else
                kr = 0;
            end
            rbin = floor(curR/bins) + 1;
            gbin = floor(curG/bins) + 1;
            bbin = floor(curB/bins) + 1;
            colorCube(rbin, gbin, bbin) = colorCube(rbin, gbin, bbin) + kr;
            sum = sum + kr;
        end
        color_hist = colorCube/sum;
end

