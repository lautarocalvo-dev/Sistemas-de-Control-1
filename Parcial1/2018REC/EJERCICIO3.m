clear all; close all; clc;

pkg load symbolic

syms s R L Kb Ka J B Kce N

G=Ka/(R+L*s)
H=Kb*s/(J*s^2 + s*B + Kce/N)

TF=simplify(G/(1+G*H))
