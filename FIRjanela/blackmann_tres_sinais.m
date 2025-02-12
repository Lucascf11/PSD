% 4. Crie um sinal de entrada composto de três componentes senoidais, nas frequências 770 Hz, 852 Hz e 941
# Hz, com Ωs = 8 kHz. Projete três filtros passa-faixa digitais, o primeiro com frequência central em 770 Hz, o
# segundo em 852 Hz e o terceiro em 941 Hz. Para o primeiro filtro, as extremidades das faixas de rejeição estão
# nas frequências 697 e 852; para o segundo, em 770 e 941 Hz; para o terceiro. Em 852 e 1209 Hz. Nos três
# filtros, a atenuação mínima na faixa de rejeição é 60 dB. 

clear all; clc; close all;
M = 71;

Omega_c1 = 697;
Omega_c2 = 852;
Omega_c3 = 770;
Omega_c4 = 941;
Omega_c5 = Omega_c2;
Omega_c6 = 1209;
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

w_black = 0.42+0.5*cos(2*n.*pi/(M))+0.08*cos(4*n.*pi/(M)); %coeficientes da janela de blackman
h1_black = w_black.*h1_n;
h2_black = w_black.*h2_n;
h3_black = w_black.*h3_n;

figure
freqz(h1_black,1);
title('Filtro FIR passa-banda - Janela de Blackman')

figure
freqz(h2_black,1);
title('Filtro FIR passa-banda - Janela de Blackman')

figure
freqz(h3_black,1);
title('Filtro FIR passa-banda - Janela de Blackman')

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

s_f_h1_black = filter(h1_black,1,s);
S_F_h1_black = fft(s_f_h1_black);
S_F_h1_black = abs(2*S_F_h1_black/L);
S_F_h1_black = fftshift(S_F_h1_black);

s_f_h2_black = filter(h2_black,1,s);
S_F_h2_black = fft(s_f_h2_black);
S_F_h2_black = abs(2*S_F_h2_black/L);
S_F_h2_black = fftshift(S_F_h2_black);

s_f_h3_black = filter(h3_black,1,s);
S_F_h3_black = fft(s_f_h3_black);
S_F_h3_black = abs(2*S_F_h3_black/L);
S_F_h3_black = fftshift(S_F_h3_black);

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

subplot(3,1,3),plot(freq,S_F_h1_black)
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

subplot(3,1,3),plot(freq,S_F_h2_black)
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

subplot(3,1,3),plot(freq,S_F_h3_black)
title('Espectro de Amplitude do sinal Filtrado ')
xlabel('f (Hz)')
ylabel('|S(f)|')
xlim([-1000 1000])
