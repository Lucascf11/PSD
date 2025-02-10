# 5. Projete um filtro passa-faixa tipo III usando o método da amostragem em frequência que satisfaça a
# especificação a seguir:
# • M = 52
# • Ωr1 = 2 rad/s
# • Ωp1 = 3 rad/s
# • Ωp2 = 7 rad/s
# • Ωr2 = 8 rad/s
# • Ωs = 20,0 rad/s
# • Agora aumente o número de amostras, mantendo sua paridade. Compare com os resultados da
# questão 3.

clear all

% Dados do problema
multiplicador = 1;
M = 52 * multiplicador;
N = M+1;
Omega_r1 = 2;
Omega_p1 = 3;
Omega_p2 = 7;
Omega_r2 = 8;
Omega_s = 20;

% Fazendo o filtro passa faixas: 

kp1 = floor(N*Omega_p1/Omega_s);
kr1 = floor(N*Omega_r1/Omega_s);
kp2 = floor(N*Omega_p2/Omega_s);
kr2 = floor(N*Omega_r2/Omega_s);


# % Vetor A para um passa-faixa
A = zeros(1, M/2 + 1);
A(1) = 0;
A(kp1:kr2) = 1;  % Define a banda de passagem entre kp1 e kr2

% Algoritmo do tipo 3

k = 1:M/2;

for n=0:M,
    h(n+1) = sum((-1).^(k+1).*A(k+1).*sin(pi.*k*(1+2*n)/N));
end;

h = 2*(h./N);

[H,w]=freqz(h,1,2048,Omega_s);

% Plot da resposta em frequência
figure(1)
plot(w,20*log10(abs(H)))
axis([0 9 -50 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência')

% Plot da resposta ao impulso
figure(2)
stem(h)
title('Resposta ao impulso');
ylabel('Resposta ao impulso');
xlabel('amostras (n)');
