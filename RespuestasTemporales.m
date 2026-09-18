clear all; close all; clc;
pkg load control

G1=tf(10,[1 4 13])
G2=tf(5,[1 5])

disp("Polos:")
pole(G1)


damp(G1)


%Graficos
figure(1);
step(G1,G2)
grid on;
title("Respuesta al escalon de G1");
ylim([0 1.5])

figure(2);
impulse(G1,G2)
grid on;
title("Respuesta al impulso");
ylim([-0.15 5.5])
xlim([0 4])

figure(3);
pzmap(G1,G2);
grid on;
title("Mapa de polos y ceros");




