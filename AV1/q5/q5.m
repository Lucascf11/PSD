clc; close all; clear all;
pkg load signal;

N = 9;
n = 0:N-1;

x1_n = [1 -2 -1 3];
x2_n = [0 2 0 0 -1 1];

%x3_n é a convolução linear entre x1_n e x2_n
x3_n = conv(x1_n,x2_n);

%x4_n é a convolução circular de N pontos entre x1_n e x2_n
x4_n = cconv(x1_n,x2_n,N);

figure(1); grid on;
subplot(2,1,1);
stem(n,x3_n);
xlabel('n');ylabel('x3_n');title('Convolução linear de x1[n] com x2[n]');
subplot(2,1,2);
stem(n,x4_n);
xlabel('n');ylabel('x4_n');title('Convolução circular de x1[n] com x2[n] aplicando N pontos');