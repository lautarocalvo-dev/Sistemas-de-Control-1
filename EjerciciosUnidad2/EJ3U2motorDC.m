%Unidad 2, Ejercicio 3 Motor DC Lazo Cerrado

pkg load control

clear all;clc;close all

s=tf("s");

%Defino Parametros
L=1e-6;
R=2;
J=10e-6;
B=0.3e-5;
Ka=0.042;
Kb=0.042;

%Defino Funciones de Transferencia

%Tl=0
G1=tf([1],[L R]); %Parte Electrica
G2=tf([1],[J B]); %Parte Mecanica
M1=minreal(feedback(G1*G2*Ka,Kb)) %FDT Entre Velocidad y Tension

%E=0
G3=-Kb*G1*Ka;
M2=minreal(-feedback(G2,-G3)) %FDT Entre Velocidad y Torque de Carga


%TODA ESTA PARTE HASTA LA LINEA 38
%Respuesta para entradas tl(t)=0.01u(t-2) , e(t)=24u(t)
E=24/s;
Tl=0.01/s; %falta retardo de 2seg

%Respuesta en S debido a la entrada e(t)
W1=minreal(E*M1);

%Respuesta en S debido a la entrada tl(t)
W2=minreal(Tl*M2);%falta Retardo de 2seg



%Simulacion

p=0.01; %paso de simulacion
t=0:p:5; %vector de tiempo de 0 hasta 5 segundos

E_in=24*ones(size(t)); %vector de entrada
Tl_in = 0.01 * (t >= 2); %genera un vector de 0 que cambia a 1 a partir de los 2 segundos creando el retardo

w1=lsim(M1, E_in, t); %Vector con todos los datos de la simulacion
w2=lsim(M2, Tl_in, t);

%Por Teorema de Superposicion
w_total=w1+w2;



%Graficos de la simulacion
figure;
plot(t, w1, 'LineWidth', 2, 'r');
title('Respuesta individual por entrada e(t)=24u(t)');
xlabel('Tiempo [s]');
ylabel('Velocidad Angular \omega(t)'); %en rad/s
xlim([0, 5]);
ylim([0, 600]);
grid minor;

figure;
plot(t, w2, 'LineWidth', 2, 'g');
title('Respuesta individual por entrada tl(t)=0.01u(t-2)');
xlabel('Tiempo [s]');
ylabel('Velocidad Angular \omega(t)'); %en rad/s
xlim([0, 5]);
ylim([-20, 20]);
grid minor;

figure;
plot(t, w_total, 'LineWidth', 2, 'b');
title('Respuesta Total del Motor DC por Superposicion');
xlabel('Tiempo [s]');
ylabel('Velocidad Angular \omega(t)'); %en rad/s
xlim([0, 5]);
ylim([0, 600]);
grid minor;




