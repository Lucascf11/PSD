% 4. Crie um sinal de entrada composto de três componentes senoidais, nas frequências 770 Hz, 852 Hz e 941
# Hz, com Ωs = 8 kHz. Projete três filtros passa-faixa digitais, Para separar essas frequências. 

clear all; clc; close all;
M = 201;

Omega_c1 = 740;
Omega_c2 = 800;
Omega_c3 = 822;
Omega_c4 = 882;
Omega_c5 = 911;
Omega_c6 = 971;
Omega_s = 8000;

wc1 = Omega_c1*2*pi/Omega_s;
wc2 = Omega_c2*2*pi/Omega_s;
wc3 = Omega_c3*2*pi/Omega_s;
wc4 = Omega_c4*2*pi/Omega_s;
wc5 = Omega_c5*2*pi/Omega_s;
wc6 = Omega_c6*2*pi/Omega_s;
%% Resposta ao impulso do filtro ideal h[n]
n = [-1*((M-1)/2):(M-1)/2];
h1_n = ((sin(wc2.*n) - sin(wc1.*n))./(pi.*n)); %resposta ao impulso para ≠0
h2_n = ((sin(wc4.*n) - sin(wc3.*n))./(pi.*n)); %resposta ao impulso para ≠0
h3_n = ((sin(wc6.*n) - sin(wc5.*n))./(pi.*n)); %resposta ao impulso para ≠0

h1_n(((M-1)/2)+1) = (wc2 - wc1)/pi; %resposta ao impulso para n=0
h2_n(((M-1)/2)+1) = (wc4 - wc3)/pi; %resposta ao impulso para n=0
h3_n(((M-1)/2)+1) = (wc6 - wc5)/pi; %resposta ao impulso para n=0


h1_ret = h1_n;
h2_ret = h2_n;
h3_ret = h3_n;

figure
freqz(h1_ret,1);
title('Filtro FIR passa-banda - Janela de retangular')

figure
freqz(h2_ret,1);
title('Filtro FIR passa-banda - Janela de retangular')

figure
freqz(h3_ret,1);
title('Filtro FIR passa-banda - Janela de retangular')

%% Sinal
tmin = 0;
tmax = 2;
Fs= Omega_s;
Ts=1/Fs;

L=(tmax-tmin)/Ts;
t=0:Ts:tmax-Ts;
s = sin(2*pi*770*t) + sin(2*pi*852*t) + sin(2*pi*941*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);
freq = Fs*(-(L/2):(L/2)-1)/L;

s_f_h1_ret = filter(h1_ret,1,s);
S_F_h1_ret = fft(s_f_h1_ret);
S_F_h1_ret = abs(1.8*S_F_h1_ret/L);
S_F_h1_ret = fftshift(S_F_h1_ret);

s_f_h2_ret = filter(h2_ret,1,s);
S_F_h2_ret = fft(s_f_h2_ret);
S_F_h2_ret = abs(1.8*S_F_h2_ret/L);
S_F_h2_ret = fftshift(S_F_h2_ret);

s_f_h3_ret = filter(h3_ret,1,s);
S_F_h3_ret = fft(s_f_h3_ret);
S_F_h3_ret = abs(1.8*S_F_h3_ret/L);
S_F_h3_ret = fftshift(S_F_h3_ret);

%% Gráficos do sinal
figure(4)

subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')

subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])

subplot(3,1,3),plot(freq,S_F_h1_ret)
title('Espectro de Amplitude do sinal Filtrado ')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])


figure(5)

subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')

subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])

subplot(3,1,3),plot(freq,S_F_h2_ret)
title('Espectro de Amplitude do sinal Filtrado ')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])

figure(6)

subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')

subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])

subplot(3,1,3),plot(freq,S_F_h3_ret)
title('Espectro de Amplitude do sinal Filtrado ')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])
