clear all; close all; clc

pkg load symbolic

syms s Kd real

G=10/(s^2 + 5*s);
C=(s+5)/(s+10);

E=simplify(G*C)
Y_R= simplify((E)/(1+E))

P1=Kd*E;
P2=1;
delta=1+E;
delta1=1;
delta2=1;

Y_N= simplify((P1*delta1+P2*delta2)/delta)


