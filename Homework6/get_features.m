function [ feature_matrix ] = get_features( I, origin_row,origin_col,end_row, end_col )
%GET_FEATURES Summary of this function goes here
%   Detailed explanation goes here
    feature_matrix = zeros((end_row-origin_row)*(end_col-origin_col),5);
    count = 1;
    for r=origin_row:end_row-1
        for c=origin_col:end_col-1
            feature_matrix(count,1) = c;
            feature_matrix(count,2) = r;
            feature_matrix(count,3) = I(r,c,1);
            feature_matrix(count,4) = I(r,c,2);
            feature_matrix(count,5) = I(r,c,3);
            count = count+1;
        end
    end
%     feature_matrix = zeros(end_row-origin_row,end_col-origin_col,5);
%     for r=origin_row:end_row-1
%         for c=origin_col:end_col-1
%             feature_matrix(r-origin_row+1,c-origin_col+1,1) = c;
%             feature_matrix(r-origin_row+1,c-origin_col+1,2) = r;
%             feature_matrix(r-origin_row+1,c-origin_col+1,3) = I(r,c,1);
%             feature_matrix(r-origin_row+1,c-origin_col+1,4) = I(r,c,2);
%             feature_matrix(r-origin_row+1,c-origin_col+1,5) = I(r,c,3);
%         end
%     end
end

