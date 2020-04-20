clc;
clear all;
close all;

P = [0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1;1 0 0 0 0];

V = qncsvisits(P);

mu = [1, 2, 2, 2, 2/3];
S = 1./mu;
for i = 1 : 8
	[U R Q X] = qnclosed(i, S, V);
	Throughput(i) = X(1);
	E_T_sd(i) = sum(Q(2:4))/X(1);
endfor