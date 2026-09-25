clear all; close all; clc

pkg load control

s=tf("s");

U=1;
Yss=2;
Ymax=2.5;
tp = 0.01;


K=Yss/U;
Mp=(Ymax-Yss)/Yss;
cita = sqrt(log(Mp)^2 / (log(Mp)^2 + pi^2));
wn = pi / (tp * sqrt(1 - cita^2));
num=K*(wn^2);
dem=[1 2*cita*wn wn^2];

disp("Funcion de Transferencia");
G=tf(num , dem)
disp("Polos:");
pole(G)
disp("Ganancia:");
dcgain(G)


figure(1);
step(G,0.04);
grid on;
title('Respuesta al Escalón - Ejercicio 1 Parcial 2018');
xlabel("Tiempo[s]")
ylabel("C(t)")
ylim([0 2.6])
