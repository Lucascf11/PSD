clc; close all; clear all;

pkg load control;

% Enunciado
ripple_p = 0.1;
ripple_r = 0.2;
omega_p = 0.2*pi;
omega_r = 0.3*pi;
Ts = 2;
a = 1;

% Calculos

Ap = -(20*log10(1-ripple_p));
Ar = -(20*log10(ripple_r));

omega_ap = (2/Ts)*(tan(omega_p/2));
omega_ar = (2/Ts)*(tan(omega_r/2));

omega_p_line = 1/a;
omega_r_line = (1/a)*(omega_ar/omega_ap);

epsilon = sqrt(((10)^(0.1*Ap))-1);

ordem_n = (log10((10)^(0.1*Ar)-1)/(epsilon^2));
ordem_n = ceil(ordem_n);

raizes_butterworth = roots([epsilon^2 0 0 0 0 0 0 0 0 0 0 0 1]); 

coeficientes_denominador_H_line_s_line = poly([-1.0900 + 0.2921i
-1.0900 - 0.2921i
-0.7979 + 0.7979i
-0.7979 - 0.7979i
-0.2921 + 1.0900i
-0.2921 - 1.0900i]);

num_hs = [2.0648];
den_hs = [3.07787 13.4195 29.2545 40.4315 37.2523 21.7595 2.0648];


[num_hz,den_hz] = bilinear(num_hs, den_hs, 1/Ts);


