clear all;close all; clc;
pkg load control

Ke=0.05;
Ra=20;
Rl=80;
L=0.5;

RT= Ra + Rl;

num= Ke*Rl;
den=[L RT];
G=tf(num,den);

tau=L/RT
K=Ke*Rl/RT

pole(G)
dcgain(G)

omega0=100;

figure(1)
step(omega0*G)
grid on
title('Tacogenerador de primer orden')
xlabel('Tiempo[s]')
ylabel('Volatej de salida v-o[V]')
