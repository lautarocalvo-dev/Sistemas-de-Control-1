%Unidad, Ejercicio 10, MASON
pkg load symbolic
clear all; clc; close all
syms G1 G2 G3 G4 H1 H2 H3 real %defino variables

%Consigna: obtener Y5/Y1

%Caminos Directos(K=2)
P1=G1*G2*G3;
P2=G3*G4;

%Lazos
L1=-G1*H1;
L2=-G1*G2*G3*H3;
L3=-G3*H2;
L4=-G4*G3*H3;

%Determinante Del Sistema
D=1-(L1+L2+L3+L4)+(L1*L3);

%Cofactores
D1=1;
D2=1;

%RESULTADO
Y5_Y1=(P1*D1+P2*D2)/D
simplify(Y5_Y1)

