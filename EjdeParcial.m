clear all, close all, clc;
pkg load control;

K=3;
T=0.667;
G1=tf(K,[T 1])
H=tf(0.5,1);
G2=feedback(G1,H)

dcgain(G1)
pole(G1)
dcgain(G2)
pole(G2)

t=0:0.1:3.2;

figure(1)
step(G1,t);
grid on;
title("Respuesta sin realimentacion")

figure(2)
step(G2,t);
grid on;
title("Respuesta con realimentacion")
