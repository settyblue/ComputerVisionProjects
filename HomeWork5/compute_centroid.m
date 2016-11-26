function [centroid] = compute_centroid( Im )
%COMPUTE_CENTROID Summary of this function goes here
%   Detailed explanation goes here
    cen_x = 0;cen_y = 0;total = 0;
    for p = 1:size(Im,1)
        p_sum = 0;
        for q = 1:size(Im,2)
            if(Im(p,q) ~= 0)
                p_sum = p_sum + 1;
                total = total + 1;
            end
        end
        cen_y = cen_y + p_sum*p;
    end

    for q = 1:size(Im,2)
        q_sum = 0;
        for p = 1:size(Im,1)
            if(Im(p,q) ~= 0)
                q_sum = q_sum + 1;
            end
        end
        cen_x = cen_x + q_sum*q;
    end
    
    centroid(1,1) = cen_y/total;
    centroid(1,2) = cen_x/total;
end

