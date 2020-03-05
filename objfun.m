function [y] = objfun(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global a
global b
y = (x.^2-a).^2/b-1;
plot(x,y,'go')
end