%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW4
% 9/19/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
Im = double(imread('boxIm1.bmp'));
area = compute_area(Im);
box = compute_boundingbox(Im);
centroid = compute_centroid(Im);
colormap('gray');imagesc(Im);hold on;
plot(centroid(1,1), centroid(1,2),'rx')
rectangle('Position', box, 'EdgeColor', 'r', 'LineWidth', 3);
annotation('textbox',[.15 .6 .3 .3],'String',sprintf('Area: %g', area),'FitBoxToText','on','Color','r','EdgeColor', 'White', 'FontSize', 14);
annotation('textbox',[.15 .5 .3 .3],'String',sprintf('Centroid at (%g, %g)', centroid(1,1), centroid(1,2)),'FitBoxToText','on','Color','r','EdgeColor', 'White', 'FontSize', 14);
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
clear; close all;
for n=1:4
    Im = double(imread(sprintf('boxIm%d.bmp', n)));
    moments = similitudeMoments(Im);
	figure,imagesc(Im);colormap('gray');
	title(sprintf('boxIm%d.bmp', n));
    moments
    %annotation('textbox',[.15 .6 .3 .3],'String',sprintf('Similitude Moments: %s', mat2str(moments, 2)),'FitBoxToText','on','Color','r','EdgeColor', 'White', 'FontSize', 14);
	%text(10, 10, , 'Color','Yellow', 'BackgroundColor','Black', 'EdgeColor', 'White');
end
pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3
clear; close all;
load eigdata.txt;
X = eigdata;
subplot(2, 1, 1);
plot(X(:,1), X(:,2), 'b.');
axis('equal'); 
m = mean(X);
Y = X-ones(size(X,1), 1)*m;
subplot(2,1,2);
plot(Y(:,1), Y(:,2), 'r.');
axis('equal');
%pause;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4
covariance = cov(Y);
[U, V] = eig(covariance);
first_axis_length = sqrt(9*V(1,1));
scaled_first_axis = U(:, 1) * first_axis_length;
second_axis_length = sqrt(9*V(2,2));
scaled_second_axis = U(:, 2) * second_axis_length;
plot(Y(:, 1), Y(:, 2), 'r.');hold on;
plot(scaled_first_axis(1,1), scaled_first_axis(2,1), 'b+', 'MarkerSize', 10);
plot(scaled_second_axis(1,1), scaled_second_axis(2,1), 'b+', 'MarkerSize', 10);
line([ 0; scaled_first_axis(1,1)], [0; scaled_first_axis(2,1)], 'LineWidth', 2);
line([ 0; scaled_second_axis(1,1)], [0; scaled_second_axis(2,1)], 'LineWidth', 2);
theta = atan2(U(1,1),U(1,2));
ellipse(first_axis_length,second_axis_length,theta,0,0,'r')
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5
rotated_data = Y*U;
plot(rotated_data(:,1), rotated_data(:,2),'r.');
pause;
