function [ u,v ] = lucas_kanade_optical_flow( Fx1, Fy1, Ft )
%LUCAS_KANADE_OPTICAL_FLOW Summary of this function goes here
%   Detailed explanation goes here
    imSize = size(Ft);
    u = zeros(imSize);
    v = zeros(imSize);
    for p = 2:100
        for q = 2:100
            fx = Fx1(p-1:p+1,q-1:q+1);
            fy = Fy1(p-1:p+1,q-1:q+1);
            ft = Ft(p-1:p+1,q-1:q+1);
            u(p,q) = ((-1).*sum(sum(fy.*fy))*sum(sum(fx.*ft))+sum(sum(fx.*fy))*sum(sum(fy.*ft)))/...
                     (sum(sum(fx.*fx))*sum(sum(fy.*fy))- (sum(sum(fx.*fy)))^2);
            v(p,q) = (sum(sum(fx.*ft))*sum(sum(fx.*fy)) - sum(sum(fx.*fx))*sum(sum(fy.*ft)) )/...
                     (sum(sum(fx.*fx))*sum(sum(fy.*fy))- (sum(sum(fx.*fy)))^2);
        end
    end
end

