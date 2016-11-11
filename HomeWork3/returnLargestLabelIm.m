function [ Im ] = returnLargestLabelIm( Im, num )
%RETURNLARGESTLABEL Summary of this function goes here
%   Detailed explanation goes here
    count = zeros(1,num);
    for i=1:size(Im,1)
        for j=1:size(Im,2)
            if Im(i,j) == 0
                continue;
            else
                count(1,Im(i,j)) = count(1,Im(i,j))+1;
            end
        end
    end
    
    max = 0;
    maxIndex = 0;
    for i=1:num
        if count(1,i) > max
            max = count(1,i);
            maxIndex = i;
        end
    end
    
    Im = (Im == maxIndex);
    
end

