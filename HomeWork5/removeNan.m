function [ cleanNormalFlow ] = removeNan( NormalFlow )
%REMOVENAN Summary of this function goes here
%   Detailed explanation goes here
    cleanNormalFlow = zeros(size(NormalFlow));
    for p=1:size(NormalFlow,1)
        for q=1:size(NormalFlow,2)
            if(isnan(NormalFlow(p,q))==1 || isinf(NormalFlow(p,q))==1)
                cleanNormalFlow(p,q) = 0;
            else
                cleanNormalFlow(p,q) = NormalFlow(p,q);
            end
        end
    end
end

