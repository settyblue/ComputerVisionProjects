function [ A ] = getA( x, X )
%GETA Summary of this function goes here
%   Detailed explanation goes here
    A = zeros(2*size(x,1),12);
    for i=1:size(x,1)
        A(2*i-1,1:4) = [X(i,:) 1];
        A(2*i-1,2) = X(i,2);
        A(2*i-1,3) = X(i,3);
        A(2*i-1,4) = 1;
        A(2*i-1,9) = (-1)*X(i,1)*x(i,1);
        A(2*i-1,10) = (-1)*X(i,2)*x(i,1);
        A(2*i-1,11) = (-1)*X(i,3)*x(i,1);
        A(2*i-1,12) = (-1)*x(i,1);
        
        A(2*i,5) = X(i,1);
        A(2*i,6) = X(i,2);
        A(2*i,7) = X(i,3);
        A(2*i,8) = 1;
        A(2*i,9) = (-1)*X(i,1)*x(i,2);
        A(2*i,10) = (-1)*X(i,2)*x(i,2);
        A(2*i,11) = (-1)*X(i,3)*x(i,2);
        A(2*i,12) = (-1)*x(i,2);
    end
end

