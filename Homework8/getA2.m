function [ A ] = getA2( X1, X2 )
%GETA2 Summary of this function goes here
%   Detailed explanation goes here
    N = size(X1,1);
    A = zeros(2*N,9);
    for i=1:N
        A(2*i-1,1) = X1(i,1);
        A(2*i-1,2) = X1(i,2);
        A(2*i-1,3) = 1;
        A(2*i-1,7) = -X1(i,1)*X2(i,1);
        A(2*i-1,8) = -X1(i,2)*X2(i,1);
        A(2*i-1,9) = -X2(i,1);
        
        A(2*i,4) = X1(i,1);
        A(2*i,5) = X1(i,2);
        A(2*i,6) = 1;
        A(2*i,7) = -X1(i,1)*X2(i,2);
        A(2*i,8) = -X1(i,2)*X2(i,2);
        A(2*i,9) = -X2(i,2);
end

