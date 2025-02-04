clc; close all; clear all;

N = 4;
n = 0:N-1;
k = 0:N-1;

x_n = [1 0 2 2 3 1];
X_K = fft(x_n,N);

atraso1 = exp(-j*k*(2*pi)/N);
atraso2 = exp(-j*k*(2*pi)/N * 2 );
atraso3 = exp(-j*k*(2*pi)/N * 3);

X1_K = 4 + atraso1 + 2*atraso2 + 2*atraso3;
x1_n = ifft(X1_K,N);

figure(1); grid on;
stem(n,x1_n);
xlabel('n');ylabel('x1_n'),title('gráfico de x1[n]');