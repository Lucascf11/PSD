clear all; clc; close all;

n = [-2:100]';

y = [1; 2; zeros(length(n)-2,1)];
x = [0;0; n(3:end)];

for k=1:length(n)-2,
    y(k+2) = y(k+1) - 0.24*y(k) + x(k+2) - 2*x(k+1);
end

figure(3)
stem(n,y)