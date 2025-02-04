clc; close all; clear all;

n = -5:5;

x=@(n) (2 - n).*((n>=0) - (n>=4));

figure; hold on; grid on;
subplot(2,1,1); 
stem(n,x(n));
xlabel('n'); ylabel('x[n]');
xlim([-5 5])
subplot(2,1,2)
stem(n,x(-(2.*n + 4)));
xlabel('n'); ylabel('x[2n - 4]');
xlim([-5 5])
