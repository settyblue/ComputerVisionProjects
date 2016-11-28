function [ MEI ] = getMEI( I, number_of_frames )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
MEI = zeros(size(I{1}));
    for i=2:number_of_frames
        foreground = abs(I{i}-I{i-1});
        foreground = medfilt2(foreground,[5,5]);
        for p=1:size(I{1},1)
            for q=1:size(I{1},2)
                if( foreground(p,q) > 10)
                    if MEI(p,q) == 0 
                        MEI(p,q) = 255;
                    end
                end
            end
        end
    end

end

