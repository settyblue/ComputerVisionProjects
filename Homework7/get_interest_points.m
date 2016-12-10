function [ interest_points ] = get_interest_points( Im, col_pointer, row_pointer, n, n_star, Threshold )
%GET_INTEREST_POINTS Summary of this function goes here
%   Detailed explanation goes here
    interest_points = zeros(1,2);
    count = 1;
    for r=4:size(Im,1)-4
        for c=4:size(Im,2)-4
            circle = zeros(1,n);
            for i=1:16
                if(abs(Im(r,c) - Im( r+row_pointer(i),c+col_pointer(i) ) ) > Threshold )
                    circle(i) = 1;
                end
            end

            double_circle = cat(2,circle,circle);
            max_so_far = 0;prev = double_circle(1);
            cur_max = 0;
            if prev == 1
                cur_max = 1;
            end
            for i=2:2*n
                if double_circle(i) == 1
                    if prev ~= 1
                        prev = 1;
                    end
                    cur_max = cur_max + 1;
                else
                    if cur_max > max_so_far
                        max_so_far = cur_max;
                    end
                    prev = 0;
                    cur_max = 0;
                end
            end
            if max_so_far >= n_star
                interest_points(count,1) = r;
                interest_points(count,2) = c;
                count = count + 1;
            end
        end
    end
end

