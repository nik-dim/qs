clc;
clear all;
close all;
%%
rng(1);     % seed
P = zeros(11,1);
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
file = [];
covergence_criterion =  0.00001 ;
maxTransitions = 1000000;
lambda = 5; 
mu = 5;
N = 10;
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0
  transitions = transitions + 1; % one more transitions step
  
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    end
    
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    end
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) <  covergence_criterion || transitions > maxTransitions % convergence test
      break;
    end
    
    previous_mean_clients = mean_clients;
    
  end
  
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    old_state = current_state;
    total_arrivals = total_arrivals + 1;
    try % to catch the exception if variable arrivals(i) is undefined. Required only for systems with finite capacity.
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
      Y = arrivals(current_state + 1);
      if current_state ~= N
        current_state = current_state + 1;
      end
    catch
      arrivals(current_state + 1) = 1;
      Y = arrivals(current_state + 1);
      if current_state ~= N
        current_state = current_state + 1;
      end
    end
  else % departure
    if current_state ~= 0 % no departure from an empty system
      current_state = current_state - 1;
    end
  end
  
  % DEBUGGING
  X = 0;
  Y = arrivals(old_state+1);
  if (random_number < threshold) 
      X=1;
  end
  if (transitions < 31)
      newrow = [old_state X Y];
      file = [file ; newrow];
  end

  
 end

for i=1:1:length(arrivals)
  display(P(i));
end

%% RESULTS
csvwrite(['debug',num2str(lambda),'.csv'],file);
P_blocking = P(N+1);
i = 0:(N);
MeanClients = sum (i.*P'); % = to_plot(length(index)) = mean_clients dld h teleutaia timh
gamma = lambda*(1-P_blocking);
E_T = MeanClients / gamma;
%% PLOT 1

fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 

plot(to_plot,'r','LineWidth',2*lineWidth);
temp = gca;
temp.Color = 'w';
temp.LineWidth = 2*lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);
xlabel(['transitions in thousands'],'FontSize',20,'Interpreter','latex');
ylabel(['Average number of clients'],'FontSize',20,'Interpreter','latex');
title(['Average number of clients in the M/M/1/10 queue: Convergence'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,['figure2_1_lambda=',num2str(lambda),'.png']);


%% PLOT 2
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
bar(0:length(P)-1,P,'r');
set(gca,'XTickLabel',{'P_{0}','P_{1}','P_{2}','P_{3}','P_{4}','P_{5}','P_{6}','P_{7}','P_{8}','P_{9}','P_{10}'});
temp = gca;
temp.Color = 'w';
temp.LineWidth = 2*lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);
% xticks([1:10]);
% xticklabels({'P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}','P_{0}'})
title(['Probabilities'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,['figure2_2_lambda=',num2str(lambda),'.png']);
    