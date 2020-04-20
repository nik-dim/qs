clc;
clear all;
close all;
%%
rng(1);     % seed
P = zeros(4,1);
arrivals = zeros(4,1);
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
file = [];
covergence_criterion =  0.00001 ;
maxTransitions = 300000;
lambda = 1; 
mu1 = 1/1.25;
mu2 = 1/2.5;
threshold1 = lambda/(lambda + mu1); % the threshold used to calculate probabilities
threshold2 = lambda/(lambda + mu2); % the threshold used to calculate probabilities
p = mu1/(mu1 + mu2);
threshold = lambda/(lambda + mu1 + mu2);
transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0
  transitions = transitions + 1; % one more transitions step
  
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    end
    
    mean_clients = 0; % calculate the mean number of clients in the system
    
    mean_clients = mean_clients + [0,1,1,2]*P;
    
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) <  covergence_criterion || transitions > maxTransitions % convergence test
      break;
    end
    
    previous_mean_clients = mean_clients;
    
  end
  
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 
        total_arrivals = total_arrivals + 1;
        arrivals(current_state+1) = arrivals(current_state+1) + 1;
        current_state = 1;
  elseif current_state == 1
      if random_number < threshold1 % arrival
          total_arrivals = total_arrivals + 1;
          arrivals(current_state+1) = arrivals(current_state+1) + 1;
          current_state = 3;
      else 
          current_state = 0;
      end
  elseif current_state == 2
      if random_number < threshold2 % arrival
          total_arrivals = total_arrivals + 1;
          arrivals(current_state+1) = arrivals(current_state+1) + 1;
          current_state = 3;
      else 
          current_state = 0;
      end
  elseif current_state == 3
    if random_number < threshold
        total_arrivals = total_arrivals + 1;
        arrivals(current_state+1) = arrivals(current_state+1) + 1;
    else
        if random_number < (lambda+mu1)/(lambda + mu1 + mu2); % arrival
              current_state = 2;
        else 
              current_state = 1;
        end
    end
  end

  
 end

display(P)
