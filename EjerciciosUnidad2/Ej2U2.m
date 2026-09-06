%Unidad 2
%Ejercicio 2
pkg load control
close all; clear all; clc
s=tf('s');
Kp=31;
G1=53*(s+1)/((s+10)*(s+100));
G2=1/s;
Kd=16;

Faux=feedback(G1,Kd);
FdTLA=Kp*Faux*G2;
FdTLC=feedback(FdTLA,1);
 step(FdTLC);

T=tf([1643 1643],[1 163 2696 1643])
figure; step(T);
dcgain(T)
figure; bode(T)











