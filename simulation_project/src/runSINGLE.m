% clc;
% clear all;
% close all;

% k = 3;
% lambda = 6;
% p = 0.5;

% EXPLANATION
% states 1-9 of MATLAB code correspond to states 
% 0,1a,2a,...,8 of the transition rate diagram. 
% The other (k+2) states of the diagram corresond 
% to the states 10-(10+k+1) states of MATLAB code

% In deciding the next state of the simulation, we check
% $$IN THE ORDER of the states in MATLAB CODE 
% described above$$ the current state!!

clear arrivals P
P = zeros(9+k+1,1);
arrivals = zeros(9+k+1,1);
total_arrivals = 0;         % to measure the total number of arrivals
state = 1;                  % holds the current state of the system
previous_mean_clients = 0;  % will help in the convergence test
index = 0;
convergence_criterion =  0.0000001 ;
mu_a = 8;
mu_b = 8;

flag = true;
transitions = 0; % holds the transitions of the simulation in transitions steps

while (flag)
    
    transitions = transitions + 1; % one more transitions step
    
    if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
        index = index + 1;
        P = arrivals/total_arrivals;
        mean_clients = 0; % calculate the mean number of clients in the system
        for i = 1 : 9
            mean_clients = mean_clients + (i-1)*P(i);
        end
        for i = 10 : (10+k)
            mean_clients = mean_clients + (i-9)*P(i);
        end
        Mean_values_of_clients(index) = mean_clients;
        
        if (abs(previous_mean_clients-mean_clients) < convergence_criterion)
        	flag = false;
        end
        previous_mean_clients = mean_clients;
    end
    
    random_number = rand(1); 
 
    if state == 1 % state 0
        total_arrivals = total_arrivals + 1;
        arrivals(state) = arrivals(state) + 1;
        state = state+1;
    elseif (state <= k) %1a,2a,3a...(k-1)a
        if random_number < lambda/(lambda + mu_a)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        else
            state = state-1;
        end  
    elseif (state == k+1) % state 3a
         if random_number < (p*lambda)/(lambda + mu_a)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        elseif random_number < lambda/(lambda + mu_a)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = 10+k;    %state 4ab
        else
            state = state-1;
         end
    elseif (state == k+2)   %state 4a
        if random_number < lambda/(lambda + mu_a)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        else
            state = state-1;
        end  
    elseif (state == k+3) % state 5
        if random_number < lambda/(lambda + mu_a + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            if (state<9)
                state = state+1;
            end
        else
            state = 10+k; %goto 4ab
        end
    elseif (state < 9)
        if random_number < lambda/(lambda + mu_a + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        else
            state = state-1; 
        end
    elseif (state == 9) %state 8 BLOCKING
        if random_number < lambda/(lambda + mu_a + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
        else
            state = state-1; 
        end  
    elseif (state == 10) %state 1b
        if random_number < lambda/(lambda + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        else
            state = 1; %goto state 0
        end
    elseif (state < 10+k) 
        if random_number < lambda/(lambda + mu_a + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = state+1;
        elseif random_number < (lambda + mu_a) / (lambda + mu_a + mu_b)
            state = state-1; 
        else
            state = state-9;
        end
    elseif (state == 10+k)   
        if random_number < lambda/(lambda + mu_a + mu_b)
            total_arrivals = total_arrivals + 1;
            arrivals(state) = arrivals(state) + 1;
            state = k+3;
        elseif random_number < (lambda + p*mu_b) / (lambda + mu_a + mu_b)
            state = state-9; 
        else
            state = state-1;
        end
    else
        % for debugging purposes
        display('ERROR_ERROR_ERROR_ERROR_ERROR_ERROR');
    end
end



if (plotsON)
    run('plotSINGLE.m');
end