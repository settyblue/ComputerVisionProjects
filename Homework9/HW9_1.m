%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW9
% 11/01/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
search_Im = double(imread('search.png'));
template_Im = double(imread('template.png'));
patch_size = [size(template_Im,1) size(template_Im,2)];
patch_mid = [(size(template_Im,1)-1)/2+1 (size(template_Im,2)-1)/2+1];

comparing_size = [size(search_Im,1) - patch_size(1,1)-1, ...
    size(search_Im,2)- patch_size(1,2)-1];
SAD = zeros([comparing_size 3]);
SSD = zeros([comparing_size 3]);
NCC = zeros([comparing_size 3]);

mean_t = mean(mean(template_Im));
std_t = zeros(1,1,3); std_p = zeros(1,1,3);
std_t(1,1,1) = std2(template_Im(:,:,1)); 
std_t(1,1,2) = std2(template_Im(:,:,2)); 
std_t(1,1,3) = std2(template_Im(:,:,3));
template_Im_temp = zeros([patch_size 3]);
template_Im_temp(:,:,1) = template_Im(:,:,1)-mean_t(1); 
template_Im_temp(:,:,2) = template_Im(:,:,2)-mean_t(2);
template_Im_temp(:,:,3) = template_Im(:,:,3)-mean_t(3);
N = patch_size(1,1)*patch_size(1,2);
for r = patch_mid(1,1):comparing_size(1, 1)+patch_mid(1,1)
    for c = patch_mid(1,2):comparing_size(1, 2)+patch_mid(1,2)
        p = r-patch_mid(1,1)+1;
        q = c-patch_mid(1,2)+1;
        search_patch = search_Im(p:p+patch_size(1,1)-1,...
                                  q:q+patch_size(1,2)-1,:);
        
        SAD(p,q,:) = sum(sum(abs(search_patch-template_Im)));
        SSD(p,q,:) = sum(sum((search_patch-template_Im).^2));
        mean_s = mean(mean(search_patch));
        std_p(1,1,1) = std2(search_patch(:,:,1)); 
        std_p(1,1,2) = std2(search_patch(:,:,2)); 
        std_p(1,1,3) = std2(search_patch(:,:,3));
        
        search_patch(:,:,1) = search_patch(:,:,1)-mean_s(1); 
        search_patch(:,:,2) = search_patch(:,:,2)-mean_s(2);
        search_patch(:,:,3) = search_patch(:,:,3)-mean_s(3);
        
        NCC(p,q,:) = sum(sum(sum(search_patch.*template_Im_temp))./...
                        (std_t.*std_p))/(N-1);
    end
end

rank = [1 2 5 10 100 500];
X = zeros(6,2,3);
SADX = sum(SAD,3);
sorted_SADX = sort(SADX(:));
figure,plot(sorted_SADX(:));
X(:,:,1) = find_points(rank,sorted_SADX,SADX)

SSDX = sum(SSD,3);
sorted_SSDX = sort(SSDX(:));
figure,plot(sorted_SSDX(:));
X(:,:,2)  = find_points(rank,sorted_SSDX,SSDX)

NCCX = sum(NCC,3);
sorted_NCCX = sort(NCCX(:), 'descend');
figure,plot(sorted_NCCX(:));
X(:,:,3) = find_points(rank,sorted_NCCX,NCCX)

figure,imagesc(uint8(search_Im)),hold on;
plot(X(:,1,1),X(:,2,1),'rX'), hold on;
plot(X(:,1,2),X(:,2,2),'gX'), hold on;
plot(X(:,1,3),X(:,2,3),'bX'), hold on;

for j = 1:3
    figure
    for i = 1:6
        imagesnap = uint8(search_Im(X(i,1,j):X(i,1,j)+patch_size(1,1)-1,...
                        X(i,2,j):X(i,2,j)+patch_size(1,2)-1, : ));
        subplot(2,3,i)       
        imshow(imagesnap)      
        title(sprintf('%d match: %d,%d', rank(i),X(i,1,j),X(i,2,j)))
    end
end


