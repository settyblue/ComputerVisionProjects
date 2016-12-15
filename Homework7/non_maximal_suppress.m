function [ R_suppressed, R_points ] = non_maximal_suppress( R, threshold )
%NON_MAXIMAL_SUPPRESS Summary of this function goes here
%   Detailed explanation goes here
    R_suppressed = zeros(size(R));
    R_points = zeros(size(R,1),2);
    window_size = 10;
    count = 1;
    for r=1:window_size:(size(R,1))
        for c=1:window_size:(size(R,2))
            max = 0;
            maxr = r; maxc = c;
            for i=0:9
                for j=0:9
                    if max < R(r+i,c+j)
                        max = R(r+i,c+j);
                        maxr = r+i;
                        maxc = c+j;
                    end
                end
            end
            if(max > threshold)
                R_suppressed(maxr, maxc) = 1;
                R_points(count,1) = maxr;
                R_points(count,2) = maxc;
                count = count + 1;
            end
        end
    end
    R_points = R_points(1:count-1,1:2);
end

