%Ejercicio de Caudal clase 04/09

clear; clc; close all;

pkg load control

K=1;
B=1;

qe0=1;
qs0=1;

tau=6*K/(B^6)

fprintf('\n---------------------------\n')
fprintf('MODELO LINEALIZADO DEL DEPOSITO CONICO\n')
fprintf('K=%4f\n',K)
fprintf('K=%4f\n',B)
fprintf('tau=6*K/B^6=%4f s\n',tau)

num=B^6;
den=[6*K B^6];
M=tf(num,den)

fprintf('Polo y ganancia estatica')
polo=pole(M)
ganancia=dcgain(M)

if all( polo<0)
  disp('Estable');
else
  disp('Inestable');
 end
t_final=5*tau
t=linspace(0,t_final,1000);
[dqs,t]=step(M,t);

figure(1);
plot(t,dqs,'LineWidth',2)
grid on
xlabel("Tiempo[s]");
yLabel("Delta q_s")
title("Respuesa de incremento de caudal de salida");
hold on;
plot(t, ones(size(t)),'--','LineWidth',1.2);
