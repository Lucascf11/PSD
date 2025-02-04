clc; clear all; close all;

N = 8; % Número de pontos da DFT
k = 0:N-1; % K indo de 0 até N-1
n = 0:N-1; % representação do vetor N

% -----------------------------------------------------------------------------------------
% Vamos considerar os seguintes valores por aqui

% a vale 1
% b vale 2
% c vale 3 
% d vale 4
% e vale 5

% -----------------------------------------------------------------------------------------

x1 = [0 1 2 3 4 5 0 0]; %vetor x1[n] do enunciado
X1 = fft(x1); %vetor X1[K] é DFT do vetor x1[n]
atraso = exp(-j * k * (2 * pi)/N * 4); %atraso encontrado na resolução teórica
X2 = X1 .* atraso; % X2[K] é o X1[K] vezes a exponencial que representa o atraso
x2 = ifft(X2); %x2[n] é a inversa de X2[K]
figure (1)
stem(n,x2);
xlabel('n')
ylabel('Amplitude')
title('gráfico de x_2[n]')