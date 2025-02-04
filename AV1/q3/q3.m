clc; close all; clear all;
pkg load signal;

N = 8;
n = 0:N-1;

x1_n = [1 2 1 1 2 1 1 2];
x2_n = [0 1 3 2];
x3_n = cconv(x1_n,x2_n,N);

figure(1); grid on;
stem(n,x3_n);
ylabel('x3_n'); 
xlabel('n'); 
title('Gráfico de x3[n])');
disp(x3_n(3)); %Se quer x[2], portanto devemos acessar a terceira posição do vetor x3_n.