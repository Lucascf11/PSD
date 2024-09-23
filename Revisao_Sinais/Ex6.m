clear all; clc; close all;

x = [0 1 2 3 2 1 0 0 0];
g = [1 1 1 1 1 1 0 0 0];

nx = (0:length(x)-1);
ng = (0:length(g)-1);
nc = (0:length(x)+length(g)-2);

c = conv(x,g);

figure(7)
subplot(3,1,1);
stem(nx,x);
subplot(3,1,2);
stem(ng,g);
subplot(3,1,3);
stem(nc,c);