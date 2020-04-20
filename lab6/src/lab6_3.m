% Example: two queues in a row. The output of the first queue is the input of the second. 
% The output of the second queue is the input of the first queue.

clc;
clear all;
close all;
N = 3;
mu1 = 2; % queue 1
mu2 = 3; % queue 2
mu3 = 4; % queue 3
p = 0.4;
rng(1)
arrivals(200) = 0;
arrivals(110) = 0;
arrivals(011) = 0;
arrivals(020) = 0;
arrivals(002) = 0;
arrivals(101) = 0;
total_arrivals = 0; 
%%
% threshold definition
threshold = mu1/(mu1 + mu2);
% system starts at state 3
current_state = 200;
% count the time steps of the simulation
steps = 0;

previous_mean1 = 0;
previous_mean2 = 0;
previous_mean3 = 0;
% times checked for convergence
times = 0;

while steps < 300000
  steps = steps + 1;
  % every 1000 steps check for convergence
  if mod(steps,1000) == 0
    times = times + 1;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % total time in every state
    T200 = 1/mu1            * arrivals(200);
    T002 = 1/mu3            * arrivals(002);
    T020 = 1/mu2            * arrivals(020);
    T101 = 1/(mu1 + mu3)    * arrivals(101);
    T110 = 1/(mu1 + mu2)    * arrivals(110);
    T011 = 1/(mu2 + mu3)    * arrivals(011);
    
    % total time in all states
    total_time = T200 + T002 + T020 + T101 + T110 + T011;
    % Probability of every state
    P(200) = T200/total_time;
    P(002) = T002/total_time;
    P(020) = T020/total_time;
    P(110) = T110/total_time;
    P(101) = T101/total_time;
    P(011) = T011/total_time;
    
    % mean number of clients in queues 1 and 2
    current_mean1 = P(101) + P(110) + 2*P(200);
    current_mean2 = P(011) + P(110) + 2*P(020);
    current_mean3 = P(101) + P(011) + 2*P(002); 
    
    clients_1(times) = current_mean1;
    clients_2(times) = current_mean2;
    clients_3(times) = current_mean3;
    
    % check both queues for convergence
    if abs(current_mean1 - previous_mean1)<0.00001 && abs(current_mean2 - previous_mean2) && abs(current_mean3 - previous_mean3) < 0.00001
      break;
    end
    
    previous_mean1 = current_mean1;
    previous_mean2 = current_mean2;
    previous_mean3 = current_mean3;
    
  end
  
  arrivals(current_state) = arrivals(current_state) + 1;
  total_arrivals = total_arrivals + 1;
  
  % get a random number from uniform distribution
  random_number = rand(1);
  if current_state == 200
      if (random_number < p) 
          current_state = 110;
      else
          current_state = 101;
      end
  elseif current_state == 110
    if random_number < mu2 / (mu1 + mu2)
      current_state = 200;
    else
        if random_number < (mu2 + p * mu1) / (mu1 + mu2)
            current_state = 020;
        else
            current_state = 011;
        end
    end
  elseif current_state == 101
    if random_number < mu3 / (mu1 + mu3)
      current_state = 200;
    else
        if random_number < (mu3 + p * mu1) / (mu1 + mu3)
            current_state = 011;
        else
            current_state = 002;
        end
    end
  elseif current_state == 020
    current_state = 110;
  elseif current_state == 002
    current_state = 101;
  else
    if random_number < mu2 / (mu2 + mu3)
      current_state = 101;
    else
      current_state = 110;
    end
  end
  
end


pop = [P(200)  P(101) P(110)  P(011)  P(020) P(002) ];
P(200)
P(020)
P(002)
P(110)
P(101)
P(011)
clients_1(times)
clients_2(times)
clients_3(times)




%%
fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;
colors = 'rbgyk';
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(clients_1,'r','linewidth',plotLineWidth);
plot(clients_2,'b','linewidth',plotLineWidth);
plot(clients_3,'g','linewidth',plotLineWidth);
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off

legend('Q1','Q2','Q3');
title(['Average number of clients in the system'],'FontSize',20,'Interpreter','latex');
xlabel(['number of steps (in thousands)'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure3_1.png');   



%%

for i = 1:times
    t(i) = clients_1(i)+clients_2(i)+clients_3(i);
end

t(times)