clear all; close all; clc

pkg load control

s=tf("s");

U=1;
Yss=1;
Ymax=1.1;
tp = 0.02;


K=Yss/U;
Mp=(Ymax-Yss)/Yss
cita = sqrt(log(Mp)^2 / (log(Mp)^2 + pi^2))
wd=pi/tp
wn = wd / (sqrt(1 - cita^2))

num=K*(wn^2);
dem=[1 2*cita*wn wn^2];

disp("Funcion de Transferencia SIN RETARDO AGREGADO de 0.01s");
G=tf(num , dem)
disp("Polos:");
pole(G)



figure(1);
step(G,0.1);
grid on;
title("Respuesta al Escalón SIN RETARDO");
xlabel("Tiempo[s]")
ylabel("C(t)")
ylim([0 1.3])
