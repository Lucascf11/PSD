clc; close all; clear all;
pkg load signal;

N = 4; %qtd pontos da DFT
k = 0:N-1; % K indo de 0 até N-1
n = 0:N-1;
x_n = cos((pi.*n)/2);
h_n = 2.^n;

%Comando letra A:
X_K = fft(x_n)
atraso_1x = exp(-j * k * (2 * pi)/N * 2);
X_KTEORICO = 1 - atraso_1x

%Comando letra B
H_K = fft(h_n)
atraso_1h = exp(-j * k * (2 * pi)/N);
atraso_2h = exp(-j * k * (2 * pi)/N * 2);
atraso_3h = exp(-j * k * (2 * pi)/N * 3);
H_KTEORICO = 1 + 2*atraso_1h + 4*atraso_2h + 8*atraso_3h

% Comando letra C:
y_n = cconv(x_n,h_n,4);


% Comando letra D:
Y_K = X_K .* H_K;
y1_n = ifft(Y_K);



figure(1)
subplot(2,1,1);
stem(n,y_n);
xlabel('n')
ylabel('Amplitude')
title('gráfico de y[n] resultante da convolução circular')
subplot(2,1,2);
stem(n,y1_n);
xlabel('n')
ylabel('Amplitude')
title('gráfico de y[n] resultante da DFT inversa')