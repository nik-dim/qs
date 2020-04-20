clc;
clear all;
close all;
%%
P = zeros(11,1);
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
file = [];
covergence_criterion =  0.1 ;

maxTransitions = 10000000; 
lambda = [3, 3, 3, 3, 3];
mu = 2:6;
N = 5;
threshold = lambda./(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

for loop = 1:8
    rng(1);     % seed
    P = zeros(11,1);
    total_arrivals = 0; % to measure the total number of arrivals
    current_state = 0;  % holds the current state of the system
    previous_mean_clients = 0; % will help in the convergence test
    index = 0;
    transitions = 0;
    to_plot=[];
    arrivals = [];
    covergence_criterion = covergence_criterion/10;
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
      if current_state == 0 || random_number < threshold(current_state) % arrival
        total_arrivals = total_arrivals + 1;
        try % to catch the exception if variable arrivals(i) is undefined. Required only for systems with finite capacity.
          arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
          if current_state ~= N
            current_state = current_state + 1;
          end
        catch
          arrivals(current_state + 1) = 1;
          if current_state ~= N
            current_state = current_state + 1;
          end
        end
      else % departure
        if current_state ~= 0 % no departure from an empty system
          current_state = current_state - 1;
        end
      end

    end
    
    to_plot_mc(loop) = abs(mean_clients-1.998);
    to_plot_tr(loop) = transitions;
    display(loop)
end

%% PLOTS

fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
bar(to_plot_mc);
set(gca,'XTickLabel',{'1%','0.1%','0.01%','0.001%','0.0001%','0.0001%','0.00001%','0.000001%'});
temp = gca;
temp.Color = 'w';
temp.LineWidth = 2*lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
ylabel([' Absolute error between simulation \& theory'],'FontSize',20,'Interpreter','latex');
xlabel(['Covergence criterion'],'FontSize',20,'Interpreter','latex');
title([' Absolute error between simulation \& theory'],'FontSize',20,'Interpreter','latex');
grid on;
saveas(gcf,['figure3_1.png']);

fig2 = figure();
fig2.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
bar(to_plot_tr);
set(gca,'XTickLabel',{'1%','0.1%','0.01%','0.001%','0.0001%','0.0001%','0.00001%','0.000001%'});
temp = gca;
temp.Color = 'w';
temp.LineWidth = 2*lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
ylabel(['Transistions in thousands'],'FontSize',20,'Interpreter','latex');
xlabel(['Covergence criterion'],'FontSize',20,'Interpreter','latex');
title(['Number of Transitions'],'FontSize',20,'Interpreter','latex');

grid on;
saveas(gcf,['figure3_2.png']);

