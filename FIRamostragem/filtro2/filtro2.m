# 2. Projete um filtro passa-altas usando o método da amostragem em frequência que satisfaça a
# especificação a seguir:
# • M = 52
# • Ωr = 4,0 rad/s
# • Ωp = 4,2 rad/s
# • Ωs = 10,0 rad/s
# • Agora aumente o número de amostras, mantendo a paridade e faça suas considerações.

clear all

% Dados do problema
multiplicador = 1;
M = 52 * multiplicador;
N = M+1;
Omega_p = 4.2;
Omega_r = 4;
Omega_s = 10;

% Fazendo o filtro passa_baixas: 

kp = floor(N*Omega_p/Omega_s);
kr = floor(N*Omega_r/Omega_s);


% Permite as primeiras bandas e rejeita as últimas, passa baixas

A = zeros(1, M/2 + 1);
A(kp:end) = 1;  

% Algoritmo do tipo 1

k = 1:M/2;

for n=0:M,
    h(n+1) = A(1) + 2*sum((-1).^k.*A(k+1).*cos(pi.*k*(1+2*n)/N));
end;

h = h./N;

[H,w]=freqz(h,1,2048,Omega_s);

% Plot da resposta em frequência
figure(1)
plot(w,20*log10(abs(H)))
axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência')

% Plot da resposta ao impulso
figure(2)
stem(h)
title('Resposta ao impulso');
ylabel('Resposta ao impulso');
xlabel('amostras (n)');
