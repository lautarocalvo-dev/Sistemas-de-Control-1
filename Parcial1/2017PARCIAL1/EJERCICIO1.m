clear all; close all; clc

pkg load symbolic;
syms s K1 K2 real

G1=s/(s+1);
G2=2/(s^3 +5*s^2 + 4*s);
H1=K2*s;
H2=K1;
H=H1+H2;
G=simplify(G1*G2);
FDT=simplify((G)/(1+H*G))

R=1/s;
E=R*(1-FDT)

ess=subs(limit(s*E, s, 0), K1, 1)
