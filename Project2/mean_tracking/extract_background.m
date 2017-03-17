N = 39
for i=1:N
    filename = sprintf('input/left_2/scene%03d.jpg', i);
    Im(:,:,:,i) = uint8(imread(filename));
end

background_Im1 = uint8(median(Im,4));
background_Im2 = uint8(mean(Im,4));
figure, image(background_Im1)
figure, image(background_Im2)

% N = 41;
% for i=1:N
%     filename = sprintf('input/left_camera_images/scene%03d.jpg', i);
%     Im(:,:,:,i) = uint8(imread(filename));
% end
% 
% background_Im1 = median(Im,4);
% figure, image(background_Im1);
% figure, image(Im(:,:,:,1))
% figure, image(Im(:,:,:,1)-background_Im1)
% 
% for i=1:N
%     ImBc(:,:,:,i) = Im(:,:,:,i)-background_Im1;
% end
% background_Im2 = mean(ImBc,4);
% figure, image(background_Im2);