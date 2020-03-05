x = 0:0.01:10;
global nfe
global nfe1
global a
global b
a = 1;
b = 6;
y = (x.^2-a).^2/b-1;
plot(x,y)
hold on;
axis([0 3 -3 3])

nfe = 0;
x = 5;
dx = 1;
while(abs(dx)>10^-4)
    objfun(x);
    dx = (x^3-a*x)/(3*x^2-a);
    x = x - dx;
    nfe = nfe+1;
end

nfe1 = 0;
len = 10;
x1 = 0;
x2 = 10;
xm = 5;
dx1 = 10;

while(abs(dx1)>10^-4)
    y = objfunDiv(xm);
    
    len = len/2;
    y1 = ((xm-len/2).^2-a).^2/b-1;
    ym = (xm.^2-a).^2/b-1;
    y2 = ((xm+len/2).^2-a).^2/b-1;
    if(y1 < ym)
        x2 = xm;
        xm = xm-len/2;
    elseif(y2 < ym)
        x1 = xm;
        xm = xm+len/2;
    else
        x1 = xm - len/2;
        x2 = xm + len/2;
    end
    dx1 = len;
    nfe1 = nfe1+1;
end

len = 10;
xmin = 0;
xmax = 10;

g = (sqrt(5) - 1)/2;
x1 = len - g*len;
x2 = g*len;
y1 = (x1.^2-a).^2/b-1;
plot(x1,y1,'bo');
y2 = (x2.^2-a).^2/b-1;
plot(x2,y2,'bo');
y3 = 0;
nfe2 = 0;


x3 = 0;
while(abs(len)>10^-4)
    nfe2 = nfe2 + 1;
    if(y1 < y2)
        xmax = x2;
        len = xmax - xmin;
        x2 = x1;
        y2 = y1;
        x1 = xmax - g*len;
        y1 = (x1.^2-a).^2/b-1;
        plot(x1,y1,'bo');
        y3 = y1;
        x3 = x1;
    else
        xmin = x1;
        len = xmax - xmin;
        x1 = x2;
        y1 = y2;
        x2 = xmin + g*len;
        y2 = (x2.^2-a).^2/b-1;
        plot(x2,y2,'bo');
        y3 = y2;
        x3 = x2;
    end
end

y = objfun(x);
nfe
x
y
y1 = objfunDiv(xm);
nfe1
xm
y1
nfe2
x3
y3

hold off;