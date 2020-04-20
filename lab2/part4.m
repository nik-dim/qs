%% Part 4 : Birth-Death Process in M/M/1/4 system
clc;
clear all;
close all;

lambda = 5;
mu = 10;

states = [0,1,2,3,4];           % system with capacity 4 states
initial_state = [1,0,0,0,0];    % the initial state of the system. The system is initially empty.

% define the birth and death rates between the states of the system.
births_B = [lambda,lambda/2,lambda/3,lambda/4];
deaths_D = [mu,mu,mu,mu];
 
% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B,deaths_D);
 
display("The transition matrix of the birth-death process is :");
display(transition_matrix);
 
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
 
display("The ergodic probalities of the system are :");
display(P);
 
%the average number of customers in the system is
 
mean_customers = 0;
 
for i = 1 : (length(states)-1)
  mean_customers = mean_customers + i*P(i+1);
endfor
 
display("The average number of customers in the system is :");
display(mean_customers);
 
% transient probabilities of all states until convergence to ergodic probabilities. Convergence takes place when P0 and P differ by 0.01

index = 0;
for T=0:0.01:50
  index = index + 1;
  P0 = ctmc(transition_matrix,T,initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if P0-P < 0.01
    break;
  endif
endfor
