function val = distanceMatrix(mat1, mat2)
[rows, cols] = size(mat1);
eigen = eig(mat1,mat2);
dist = 0;
for i = 1:rows
        dist = dist + ((log(eigen(i)))^2);
end
val = sqrt(dist);
end