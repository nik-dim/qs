clc
%addpath(genpath'queueing'))

lambda = [3 3 3 3 3];
mu = [2 3 4 5 6];
m = 5;
K = 5;
Q = ctmcbd( lambda, mu )


a = ctmc(Q)

x = [0 1 2 3 4 5];
sum(a.*(x))
