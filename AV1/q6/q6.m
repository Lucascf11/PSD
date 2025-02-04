clc; close all; clear all;

N = 5;
k = 0:N-1;
n = 0:N-1;

x_n = [2 -1 0 2 1];
X_K = fft(x_n,5);

avanco = exp(j*k*(2*pi)/N * 3);
X1_K = X_K.*avanco;
x1_n = ifft(X1_K);

figure(1); grid on;
subplot(2,1,1)
stem(n,x_n);
xlabel('n');ylabel('x1_n'),title('gráfico de x[n]');
subplot(2,1,2)
stem(n,x1_n);
xlabel('n');ylabel('x1_n'),title('gráfico de x1[n]');