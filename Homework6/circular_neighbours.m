function [ X ] = circular_neighbours(Im , x, y, radius )
%CIRCULAR_NEIGHBOURS Summary of this function goes here
%   Detailed explanation goes here
    start_col = int32(x-radius);
    start_row = int32(y-radius);
    end_col = int32(x+radius);
    end_row = int32(y+radius);
    X = zeros(1,5);
    count = 1;
    for r=start_row:end_row
        for c=start_col:end_col
            if(r<1 || c<1)
                continue;
            end
            distance = euclidean_distance(double(c),double(r),x,y);
            if(distance > radius)
                continue;
            end
            X(count,1) = c;
            X(count,2) = r;
            X(count,3) = Im(r,c,1);
            X(count,4) = Im(r,c,2);
            X(count,5) = Im(r,c,3);
            count = count+1;
        end
    end
end

