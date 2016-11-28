function [ uav,vav ] = horn_schunck_optical_flow( Fx1, Fy1, Ft )
%HORN_SCHUNCK_OPTICAL_FLOW Summary of this function goes here
%   Detailed explanation goes here
    uav = zeros(101,101);vav = zeros(101,101);
    for i=1:10
        u = (uav+(-1).*Fx1.*(Fx1.*uav+Fy1.*vav+Ft))./(Fx1.*Fx1+Fy1.*Fy1);
        v = (vav+(-1).*Fy1.*(Fx1.*uav+Fy1.*vav+Ft))./(Fx1.*Fx1+Fy1.*Fy1);
        uav = imfilter(removeNan(u),[1 1 1;1 8 1;1 1 1]/16);
        vav = imfilter(removeNan(v),[1 1 1;1 8 1;1 1 1]/16);
    end
end

