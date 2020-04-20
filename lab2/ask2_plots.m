%% Part 2 : M/M/1 queue plots
clc; close all; clear all;
% plot specifications
fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1920;
height=1080;

lambda = 5;         % average arrival rate (customers/min)
mu = 5.01:0.01:10;  % average service rate (customers/min)
rho = lambda./mu;   % service utilization (Erlang) [ergodic system => rho <1] 

U = lambda./mu;     % System utilization
Q = rho./(1-rho);   % average number of customers
R = 1./(mu.*(1-rho));       % average time delay (Little's Law)
X(1:length(rho)) = lambda;  % Throughput of ergodic system is always lambda (no blocking)
p0 = 1-rho;
%% figure 1
fig1 = figure(1);
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ;
plot1 = plot(mu,U,'Color','y','LineWidth',plotLineWidth);
temp = gca;
temp.LineWidth = lineWidth;
temp.Color = 'w';
temp.GridColor = 'k';
temp.GridAlpha = 0.4;
temp.FontSize = fontsize;
xlabel(['service rate $\mu$'],'FontSize',20,'Interpreter','latex');
title(['Utilization u'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure1.png');
%% figure 2
fig2 = figure(2);
fig2.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ;
plot2 = plot(mu,R,'Color','r','LineWidth',plotLineWidth);
temp = gca;
temp.LineWidth = lineWidth;
temp.Color = 'w';
temp.GridColor = 'k';
temp.FontSize = fontsize;
ylim([0 50]); 
xlabel(['service rate $\mu$'],'FontSize',20,'Interpreter','latex');
title(['Average delay time $\mathbf{E}[T]$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure2.png');
%% figure 3
fig3 = figure(3);
fig3.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
plot3 = plot(mu,Q,'Color','b','LineWidth',plotLineWidth);
 
temp = gca;
 
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
 
ylim([0 50]);
 
xlabel(['service rate $\mu$'],'FontSize',20,'Interpreter','latex');
title(['Average number of customers in the system $\mathbf{E}[n(t)]$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure3.png');
%% figure 4
fig4 = figure(4);
fig4.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ;
plot4 = plot(mu,X,'Color','g','LineWidth',plotLineWidth);

temp = gca;

temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
 
xlabel(['service rate $\mu$'],'FontSize',20,'Interpreter','latex');
title(['Throughput $\gamma$'],'FontSize',20, 'Interpreter','latex');

grid on;
saveas(gcf,'figure4.png');