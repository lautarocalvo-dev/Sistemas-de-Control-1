clear all; close all; clc

pkg load control;

s=tf("s");

% Entrada de referencia
Vr = 3; % [V]

num=1006500;
dem=[5 4036 1600335];

%Funcion de transferencia
disp("Funcion de Transferencia:")
G=tf(num,dem)


%Parametros de la respuesta
disp("-----------------------------------------------------------")
disp("Parametros de la Respuesta")
damp(G)
[wn_vec, zeta_vec] = damp(G);
wn = wn_vec(1);
cita = zeta_vec(1);
wd=wn*sqrt(1-cita^2)
tau=1/(cita*wn);
B=acosd(cita)
disp("-----------------------------------------------------------")
disp("Ganancia Estatica")
K=dcgain(G)

disp("-----------------------------------------------------------")
disp("Valor Final:")
VF=K*Vr

disp("-----------------------------------------------------------")
disp("Tiempo Pico:")
tp=pi/wd

disp("-----------------------------------------------------------")
disp("Sobrepasamiento %:")
[y, t] = step(G, [0, tp]);
pico=y(end);
Mp_Porcentaje=100*(pico-K)/K

disp("-----------------------------------------------------------")
disp("Tiempo de crecimiento:")
tr=(pi-acos(cita))/wd

disp("-----------------------------------------------------------")
disp("Tiempo de establecimiento:")
ts=tau*4

%Mapa de Polos y Ceros
figure(1);
pzmap(G)
grid on;
title("Polos en el Plano S")
ylabel("Im [s]")
xlabel("Re [s]")
legend("Polos de G(s)", "Location", "northeast");


%Grafico de Respuesta al escalon de entrada
figure(2);
step(Vr*G,0.1);
grid on;
hold on;
plot(tp, Vr*pico, 'ro', 'MarkerFaceColor', 'r');
line([0, 2], [VF, VF], 'Color', 'r', 'LineStyle', '--');
line([tp, tp], [0, Vr*pico], 'Color', 'k', 'LineStyle', ':');
line([ts, ts], [0, VF], 'Color', 'g', 'LineStyle', ':');
legend("Respuesta O(t)", ...
       "Pico maximo", ...
       "Valor Final", ...
       "Tiempo de pico (tp)", ...
       "Tiempo de asentamiento (ts)", ...
       "Location", "southeast");
hold off;
title("Respuesta al Escalon de Vr");
ylabel("O(t)[rad]")
xlabel("t[s]")
ylim([0 Vr*pico*1.025])
