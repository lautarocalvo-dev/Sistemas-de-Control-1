%Unidad 2, Ejercicio 2, Sistema 2

pkg load control
clear all; clc ; close all

s=tf('s');% defino S como la variable de Laplace
%Defino Funciones de Transferencia

PI=tf([1 0.1] , [1 0] );
P=tf([12]);
G1=tf([27],[1 200]);
G2=tf([1 0] , [1 0.1]);

%Lazo interno
B0=feedback(P*G1,1); %retroalimentacion
minreal(B0)
B1=B0*PI*G2;
minreal(B1) %simplificamos
BG=feedback(B1,1);
minreal(BG)

figure;
step(BG,8); %respuesta temporal al impulso hasta t=8s
title("Respuesta al Escalon del Sistema")
grid minor; %cuadricula mas finas para mas precision
xlabel("Tiempo[seg]")
ylabel("Salida y(t)")
xlim([0, 8])
ylim([0, 0.5]) % limites de X e Y q mostrara el grafico



