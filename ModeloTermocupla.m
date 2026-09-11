
clear all; close all; clc;
pkg load control

Cth=2;
hA=0.4;
S=40e-6;
tau=Cth/hA;

G=tf(S,[tau 1]);

disp("Funcion de Transferencia")
G

p=pole(G);
disp("Polo")
disp(p)

Kdc=dcgain(G);
fprintf('Ganancia DC = %8f V/degC\n',Kdc);

DeltaT= 80;
t=0:0.5:30;

[y, tout]=step(DeltaT*G,t);

figure(1)
plot(tout, 1000*y,'LineWidth',2)

grid on

xlabel('Tiempo[s]')
ylabel('Tension de la termocupla[mV]')

title('Termocupla - respuesta primer orden')




