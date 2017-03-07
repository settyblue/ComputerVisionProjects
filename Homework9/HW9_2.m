%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW9
% 11/01/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2

left_Im = double(imread('left.png'));
right_Im = double(imread('right.png'));

patch_size = [11 11];
patch_mid = (patch_size+1)/2;
halfwidth = (patch_size-1)/2;
N = patch_size(1,1)*patch_size(1,2);
D = zeros(size(left_Im));
for i = patch_mid(1,1):size(left_Im)-patch_mid(1,1)+1
    for j = patch_mid(1,2):size(left_Im)-patch_mid(1,2)+1
        left_patch = left_Im(i-halfwidth(1,1):i+halfwidth(1,1),...
            j-halfwidth(1,2):j+halfwidth(1,2));
        std_l = std2(left_patch);
        mean_l = mean(mean(left_patch));
        left_patch = left_patch-mean_l;
        NCC = zeros(2,j-patch_mid(1,2)+1);
        for j_r = j:-1:patch_mid(1,2)
            right_patch = right_Im(i-halfwidth(1,1):i+halfwidth(1,1),...
                j_r-halfwidth(1,2):j_r+halfwidth(1,2));
            q = j_r-patch_mid(1,2)+1;
            std_r = std2(right_patch);
            mean_r = mean(mean(right_patch));
            right_patch = right_patch - mean_r;
            NCC(1,q) = sum(sum(left_patch.*right_patch))/...
                        (std_l*std_r)/(N-1);
            NCC(2,q) = j_r;
        end
        [~,index] = max(NCC(1,:));
        D(i,j) = j - NCC(2,index);
    end
end

figure;
imagesc(D, [0 50]); axis equal;
colormap gray;
