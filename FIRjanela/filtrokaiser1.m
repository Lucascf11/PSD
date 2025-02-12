# 2. Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:
# • Ap = 1,0 dB
# • Ar = 40 dB
# • Ωp = 1000 rad/s
# • Ωr = 1200 rad/s
# • Ωs = 5000 rad/s

clear all;
pkg load signal;

Ap = 1;
Ar = 40;
Omega_p = 1000;
Omega_r = 1200;
Omega_s = 5000;

delta_p = (10^(0.05*Ap) - 1)/(10^(0.05*Ap) + 1);
delta_r = 10^(-0.05*Ar);

F = [Omega_p Omega_r];
A = [1 0];

ripples = [delta_p  delta_r];

[M,Wn,beta,FILTYPE] = kaiserord(F,A,ripples,Omega_s);

kaiser_win = kaiser(M+1,beta);
h = fir1(M,Wn,FILTYPE,kaiser_win,'noscale');

figure(1)
stem(0:M,h)
ylabel('h[n]');
xlabel('n)');
title('Resposta ao Impulso');
[H,w]=freqz(h,1,2048,Omega_s);

figure(2)
plot(w,20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (Hz)');
title('Resposta em Frequência');