clc; clear all; close all;

N = 6;
k = 0:N-1;
n = 0:N-1;

x_n = [4 3 2 1 0 0];
X_K = fft(x_n);

%Comando letra A

atraso = exp(-j*k*2*pi/N * 5);
Q_K = X_K .* atraso;
q_n = ifft(Q_K);
figure(1); grid on;
stem(n,q_n);
xlabel('n');ylabel('Amplitude');title('Gráfico q[n]')

%Comando letra B
W_K = imag(X_K);
w_n = ifft(W_K)*i;
figure(2); grid on;
stem(n,w_n);
xlabel('n');ylabel('Amplitude');title('Gráfico w[n] imaginário')
