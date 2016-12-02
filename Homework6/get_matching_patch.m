function [ distance_matrix, min_row, min_col ] = get_matching_patch( I, patch_size, modelCovMatrix )
%GET_MATCHING_PATCH Summary of this function goes here
%   Detailed explanation goes here
    distance_matrix = zeros(size(I,1)-patch_size(1,1) , size(I,2)-patch_size(1,2));
    for origin_row=1:size(distance_matrix,1)
        for origin_col=1:size(distance_matrix,2)
            patch_features = get_features(I,origin_row,origin_col,origin_row+patch_size(1,1)...
                , origin_col+patch_size(1,2));
            covariance_matrix = cov(patch_features,1);
            distance_matrix(origin_row, origin_col) = riemannian_distance(...
                covariance_matrix, modelCovMatrix);
            [min_col_values, min_row] = min(distance_matrix);
            [~, min_col] = min(min_col_values);
            min_row = min_row(min_col);
        end
    end
end

