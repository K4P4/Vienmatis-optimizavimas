function [y] = objfunDiv(x)
global a
global b
y = (x.^2-a).^2/b-1;
plot(x,y,'rx')
end