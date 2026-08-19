clear all; close all; clc
pkg load symbolic
pkg load control




syms R1 R2 C1 C2 s real

%Circuito 1
G1=1/(s*C1*R1+1);

%Circuito 2
syms Vin Va Vout real
%metodo de las tensiones de nodo
Y1=1/R1;
Y2=1/R2;
Va=Vout*(1+s*C2*R2);
eq4=(Vin/R1)==Vout*((1+s*C2*R2)*(Y1+s*C1+Y2)-Y2);
X=solve(eq4,Vout);
G2=simplify(X/Vin);

%Circuito 3
G31=1/(s*R1*C1+1);
G32=1/(s*R2*C2+1);
G3=G31*G32;


%mostrar resultados
disp('Circuito 1')
disp(G1)
disp('Circuito 2')
disp(G2)
disp('Circuito 3')
disp(G3)

%Pametros de Resistencias y Capacitores
R = sym('10000');
C = sym('1e-9');
%Circuito 1
%convertimos G1 a numerico
G1_final=subs(G1,{R1,C1},{R , C});

%transformacion a objeto tf
[n_g1, d_g1] = numden(G1_final);
n1_vec = double(sym2poly(n_g1));
d1_vec = double(sym2poly(d_g1));

% funcion de transferencia de control
G1_sys=tf(n1_vec,d1_vec);

%diagrama de bode
figure; bode(G1_sys); grid on;

%Circuito 2
G2_final=subs(G2,{R1,R2,C1,C2},{R, R, C, C});

[n_g2, d_g2] = numden(G2_final);
n2_vec = double(sym2poly(n_g2));
d2_vec = double(sym2poly(d_g2));

G2_sys=tf(n2_vec,d2_vec);

figure; bode(G2_sys); grid on;


%Circuito 3
G3_final=subs(G3,{R1,R2,C1,C2},{R, R, C, C});

[n_g3, d_g3] = numden(G3_final);
n3_vec = double(sym2poly(n_g3));
d3_vec = double(sym2poly(d_g3));

G3_sys=tf(n3_vec,d3_vec);

figure; bode(G3_sys); grid on;


