%Problem 5
Im1 = double(imread('img1.jpg'));
Im2 = double(imread('img2.jpg'));

radius = 25;
x0 = 150;
y0 = 175;

bins = 16;
h = 25;

qX = circular_neighbours(Im1, x0, y0, radius);
qmodel = colorHistogram(qX, bins, x0, y0, h);

iter = 1;
xprev = x0;
yprev = y0;

imagesc(Im1/255);
hold on
plot(xprev,yprev,'r*');
hold off 

while iter <= 25
        pX = circular_neighbours(Im2, xprev, yprev, radius);
        pmodel = colorHistogram(pX, bins, xprev, yprev, h);
        xnew = 0;
        ynew = 0;
        nh = size(pX);
        w = meanshiftWeights(pX,qmodel,pmodel);
        denom = sum(w);
        for i = 1 : nh(1)
            xnew = (xnew + pX(i,1) * w(i));
            ynew = (ynew + pX(i,2) * w(i));
        end
        xprev = xnew/denom;
        yprev = ynew/denom;
        iter = iter + 1;
end
xprev
yprev
imagesc(Im2/255);
hold on
plot(xprev,yprev,'r*');