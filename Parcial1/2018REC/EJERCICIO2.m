clear all; close all; clc;

pkg load symbolic

syms G H Gt real

TF1=G/(1+G*H);
TF2=Gt/(1+Gt);

GT=solve(TF1 == TF2, Gt)
