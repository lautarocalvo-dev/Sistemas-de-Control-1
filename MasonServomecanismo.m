clear all; close all; clc;

pkg load symbolic

syms s real
warning('off', 'all');

%Defino las constantes del sistema
Ka=201300;
Ra=2;
Kt=0.2;
Ke=0.2;
Jm=0.01;
Bm=0.01;
n=0.2;
Jl=0.25;
Bl=0.25;
Kpot=1.59;
Ktac=0.0008;

%Aplicacion de Mason:

G1=1/(Jm*s+Bm); %FDT parte mecanica del Motor
G2=1/Ra; %FDT parte electrica del motor
G3=Jl*s+Bl; %FDT carga

%Camino directo
P1=Ka*(G2)*Kt*G1*n*(1/s);

%Lazos
L1=-(G3*n^2)*G1;
L2=-Kt*Ke*G1*G2;
L3=-Ka*Ktac*Kt*G2*G1;
L4=-Ka*Kt*n*Kpot*G1*G2*(1/s);

%Determinante
delta=1-(L1+L2+L3+L4);

%Funcion de transferencia
disp("Funcion de Transferencia:")
G=simplify(P1/delta)

