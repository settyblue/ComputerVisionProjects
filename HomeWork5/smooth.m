function [ SmoothenIm ] = smooth( Im )
%SMOOTH Summary of this function goes here
%   Detailed explanation goes here
    filter = [0.0625 0.0625 0.0625; 0.0625 0.5 0.0625; 0.0625 0.0625 0.0625];
    SmoothenIm = zeros(size(Im));
    for p=2:(size(Im,1)-1)
        for q=2:(size(Im,1)-1)
            SmoothenIm(p,q) = filter(1,1)*Im(p-1,q-1)+filter(1,2)*Im(p-1,q)+filter(1,3)*Im(p-1,q+1)...
            + filter(2,1)*Im(p,q-1)+filter(2,2)*Im(p,q)+filter(2,3)*Im(p,q+1)...
            + filter(3,1)*Im(p+1,q-1)+filter(3,2)*Im(p+1,q)+filter(3,3)*Im(p+1,q+1);
        end
    end
end

