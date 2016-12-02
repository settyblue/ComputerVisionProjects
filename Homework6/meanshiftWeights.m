function [ weights ] = meanshiftWeights(X, q_model, p_test )
%MEANSHIFTWEIGHTS Summary of this function goes here
%   Detailed explanation goes here
%     bins = 16;
%     weights = zeros(1,size(X,1));
%     for i=1:size(X,1)
%         binx = floor(X(i,3)/bins) +1;
%         biny = floor(X(i,4)/bins) +1;
%         binz = floor(X(i,5)/bins) +1;
%         if p_test(binx, biny, binz) ~= 0
%             weights(1,i) = sqrt(q_model(binx, biny, binz)...
%                 /p_test(binx, biny, binz));
%         end
%     end
    
    
    [n,~] = size(X);
    weights = zeros([1,n]);
    for i = 1:n
        rbin = floor(X(i,3)/16)+1;
        gbin = floor(X(i,4)/16)+1;
        bbin = floor(X(i,5)/16)+1;
        if(p_test(rbin,gbin,bbin) ~= 0)
            weights(i) = weights(i) + sqrt(q_model(rbin,gbin,bbin)/p_test(rbin,gbin,bbin));
        end
    end
end

