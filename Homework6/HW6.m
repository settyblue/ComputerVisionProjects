%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW6
% 10/2/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
patch_size = [70 24];
modelCovMatrix = [47.917 0 -146.636 -141.572 -123.269;
0 408.250 68.487 69.828 53.479;
-146.636 68.487 2654.285 2621.672 2440.381;
-141.572 69.828 2621.672 2597.818 2435.368;
-123.269 53.479 2440.381 2435.368 2404.923];
Im = double(imread('target.jpg'));
[distance_matrix, min_row, min_col] = get_matching_patch(Im, patch_size, modelCovMatrix);
imagesc(Im/255);hold on;
min_row
min_col

rectangle('Position', [min_col min_row  24 70], 'EdgeColor', 'r', 'LineWidth', 1);

%                          %%Problem 1
% modelCovMatrix = [47.917 0 -146.636 -141.572 -123.269;
%  0 408.250 68.487 69.828 53.479;
% -146.636 68.487 2654.285 2621.672 2440.381;
% -141.572 69.828 2621.672 2597.818 2435.368;
% -123.269 53.479 2440.381 2435.368 2404.923];
% 
% targetIm = double(imread('target.jpg'));
% [targetImRows, targetImCols, targetColors] = size(targetIm);
% 
% boxHeight = 70;
% boxWidth = 24;
% minDist = realmax;
% minRow = 1;
% minCol = 1;
% distanceMat = zeros(targetImRows-boxHeight, targetImCols-boxWidth);
% for r = 1:targetImRows-boxHeight
%     for c = 1:targetImCols-boxWidth
%         box = zeros(boxHeight * boxWidth,5);
%         for i = r:r+boxHeight-1
%             for j = c:c+boxWidth-1
%                 box((i-r+1) * (boxWidth)+(j-c+1), :) = [j i targetIm(i,j,1) targetIm(i,j,2) targetIm(i,j,3)];
%             end
%         end
%         covMatrix = cov(box,1); 
%         curDist = distanceMatrix(modelCovMatrix, covMatrix);
%         if(curDist < minDist)
%             minDist = curDist;
%             minRow = r;
%             minCol = c;
%         end
%         distanceMat(r,c) = curDist;
%     end
% end
% imagesc(targetIm/255);
% hold on
% rectangle('Position', [minCol, minRow, boxWidth, boxHeight],'EdgeColor','r', 'LineWidth', 1);
% hold off
% %colormap('gray');
% axis('image');

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Problem 6
% Im1 = double(imread('img1.jpg'));
% bins = 16;
% tracking_x = 150;
% tracking_y = 175;
% tracking_radius = 25;
% X1 = circular_neighbours(Im1,tracking_x, tracking_y, tracking_radius);
% q_model = colorHistogram(X1, bins, tracking_x, tracking_y, tracking_radius);
% Im2 = double(imread('img2.jpg'));
% X2 = circular_neighbours(Im2,tracking_x, tracking_y,25);
% p_test = colorHistogram(X2, bins, tracking_x, tracking_y, tracking_radius);
% w = meanshiftWeights(X2, q_model, p_test);
% nansum(w);
% w;
% 
% for i=1:25
%     final_x = nansum(w.*(X2(:,1))')/nansum(w);
%     final_y = nansum(w.*(X2(:,2))')/nansum(w);
%     X2 = circular_neighbours(Im2, final_x, final_y, tracking_radius);
%     p_test = colorHistogram(X2, bins, final_x, final_y, tracking_radius);
%     w = meanshiftWeights(X2, q_model, p_test);
% end
% final_x
% final_y
% 
% imagesc(Im1/255);hold on;
% plot( tracking_x, tracking_y,'rx');
% plot_circle( tracking_x, tracking_y, tracking_radius);
% hold off;
% figure, imagesc(Im2/255);hold on;
% plot(final_x, final_y,'rx');
% plot_circle(final_x, final_y, tracking_radius);
% hold off;
% 
