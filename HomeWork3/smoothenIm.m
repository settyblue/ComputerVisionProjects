function [ temp ] = smoothenIm( Im, a )
%SMOOTHENIM Summary of this function goes here
%   Detailed explanation goes here
    w = [.25-.5*a .25 a .25 .25-.5*a];
    temp2 = zeros(size(Im,1),size(Im,2));
    temp = zeros(size(Im,1),size(Im,2));
    for i=3:(size(Im,1)-2)
        for j=3:2:(size(Im,2)-2)
            temp2(i,j) = Im(i,j-2)*w(1,1) + Im(i,j-1)*w(1,2) + Im(i,j)*w(1,3) + Im(i,j+1)*w(1,4) + Im(i,j+2)*w(1,5);
        end
    end

    for i=3:2:(size(Im,1)-2)
        for j=3:2:(size(Im,2)-2)
            temp(i,j) = temp2(i-2,j)*w(1,1) + temp2(i-1,j)*w(1,2) + temp2(i,j)*w(1,3) + temp2(i+1,j)*w(1,4) + Im(i+2,j)*w(1,5);
        end
    end
end

