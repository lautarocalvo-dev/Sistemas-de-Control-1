clear all; close all; clc;

pkg load symbolic

syms s Kp Kd real %Declaro las variables

%Resuelvo el algebra de bloques
G=20/(s^2 + 10*s);
H=Kd*s;
G1=simplify( G/(1+G*H));

%Obtengo Fucnion de transferencia de lazo cerrado del sistema
Gt=simplify((Kp*G1)/(1+Kp*G1))

%Set Point en el dominio de S
R=1/(s^2);

%Error en el dominio de S
E=R*(1-Gt);

%Aplico TVF para obtener la expresion del error en regimen permanente
ess=limit(s*E,s,0)

%Obtengo el valor de Kp para Kd=10 y ess=0.1
e=subs(ess,Kd,10)
Kp_minimo=solve(e == 0.1, Kp)
