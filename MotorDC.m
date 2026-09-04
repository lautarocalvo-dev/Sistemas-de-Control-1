clear; close all; clc

pkg load control

R=35;
L=0.92e-3;

Kt=26.7e-3;

Ke=2.8/(1000*2*pi/60);

J=1.6e-7;
b=0;

num=Kt;
den=[J*L J*R+b*L  b*R+Kt*Ke];

G=tf(num,den)

Va=24; %tension de entrada
G_rpm=G*60/(2*pi);
figure
step(Va*G_rpm)
grid on

title('Velocidad del motor Va=24v')
xlabel('Tiempo[S]')
ylabel('Velocidad[rpm]')

fprintf('Polos del motor')
pole(G)

rpm_datasheet=8550;
rpm_modelo=dcgain(Va*G_rpm)
error=abs(rpm_modelo-rpm_datasheet)*100/rpm_datasheet

%Verificacion con Corriente en Vacio
IO=3.3e-3;

EO=Va-R*IO;

fprintf("Velocidad usando IO:")
rpm_IO=(EO/Ke)*60/(2*pi)




