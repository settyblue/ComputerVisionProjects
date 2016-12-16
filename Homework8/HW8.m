%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rakshith Kunchum
% HW8
% 10/20/2016

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1
x = dlmread('2Dpoints.txt');
X = dlmread('3Dpoints.txt');
N = size(x,1);
A = getA(x,X);
B = A'*A;
[V, ~] = eig(B);
p = (V(:,1));
p = p/norm(p);
P = [(p(1:4,1))';(p(5:8,1))';(p(9:12,1))']

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2
xnew = (P*[X';ones(1,size(X,1))])';
for i=1:N
    xnew(i,1) = xnew(i,1)/xnew(i,3);
    xnew(i,2) = xnew(i,2)/xnew(i,3);
end
e = compute_error(x,xnew);
e

scatter((x(:,1)),x(:,2),'X');hold on;
scatter((xnew(:,1)),xnew(:,2),'O');hold off;

pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3 and 4
H = dlmread('homography.txt');
X1 = H(:,1:2);
X2 = H(:,3:4);
N = size(X1,1);
meanx1 = mean(X1);
meanx2 = mean(X2);
s1 = compute_S(X1);
s2 = compute_S(X2);
T1 = [s1 0 -s1*meanx1(1,1);0 s1 -s1*meanx1(1,2);0 0    1];
T2 = [s2 0 -s2*meanx2(1,1);0 s2 -s2*meanx2(1,2);0 0    1];
X1hat = (T1*[X1'; ones(1,size(X1,1))])';
X2hat = (T2*[X2'; ones(1,size(X2,1))])';
A = getA2(X1hat,X2hat);
B = A'*A;
[V, D] = eig(B);
h = (V(:,1));
h = h/norm(h);
Hhat = [(h(1:3,1))';(h(4:6,1))';(h(7:9,1))']
H = T2^-1 * Hhat * T1;
X1new = (H*[X1';ones(1,size(X1,1))])';
for i=1:N
    X1new(i,1) = X1new(i,1)/X1new(i,3);
    X1new(i,2) = X1new(i,2)/X1new(i,3);
end
e = compute_error(X2,X1new);
e

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5
scatter((X2(:,1)),X2(:,2),'X');hold on;
scatter((X1new(:,1)),X1new(:,2),'O');hold off;

