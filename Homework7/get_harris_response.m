function [ R ] = get_harris_response( Im, IGx2, IGy2, IGxy, alpha, threshold )
%GET_HARRIS_RESPONSE Summary of this function goes here
%   Detailed explanation goes here
    R = zeros(size(Im));
    for r=1:size(Im,1)
        for c=1:size(Im,2)
            M = [ IGx2(r,c)  IGxy(r,c); ...
                  IGxy(r,c)  IGy2(r,c)];
            eigen_val = eig(M);
            r_val = eigen_val(1)*eigen_val(2) - ...
                alpha*((eigen_val(1)+ eigen_val(2))^2);
            if r_val > threshold
                R(r,c) = r_val;
            end
        end
    end
end

