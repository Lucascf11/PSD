clc; close all; clear all;

n = 0:11;
x = @(n) 4.^(-n).*(n>=0);
a = [1 6 9];
b = [2 6 0];
y = filter(b,a,x(n));

figure(5)
stem(n,x(n));

figure(6)
stem(n,y);