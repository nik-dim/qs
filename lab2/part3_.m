%% Part3
clear all;
close all;
clc;

lambdaServer = 10;
muServer = 10;
servers= 2;
lambdaQueue = 5;
muQueue = 10;
 
[~,R1,~,~,~,~] = qsmmm(lambdaServer,muServer,servers);
 
[~,R2,~,~,~] = qsmm1(lambdaQueue,muQueue);
 
display("The average delay time E[T] using 2 servers is :");
display(R1);
 
display("The average delay time E[T] using 2 queues is :");
display(R2);