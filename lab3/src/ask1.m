clc;
clear all;
close all;


%%

lambda = 0.1:0.01:2.9;
mu = 3;

[U_mm1, R_mm1, Q_mm1, X_mm1, p0_mm1] = qsmm1(lambda, mu);
[U_md1, R_md1, Q_md1, X_md1, p0_md1] = qsmd1(lambda, mu);

%% PLOTS

fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;

fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(lambda/mu,Q_mm1,'Color','b','LineWidth',plotLineWidth);
plot(lambda/mu,Q_md1,'Color','r','LineWidth',plotLineWidth);
temp = gca;
 
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);
 
xlabel(['System utilization $\rho$'],'FontSize',20,'Interpreter','latex');
title(['Average number of customers in the system $\mathbf{E}[n(t)]$'],'FontSize',20, 'Interpreter','latex');
legend('MM1','MD1');
grid on;
saveas(gcf,'figure1.png');
%%
fig2 = figure();
fig2.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(lambda/mu,R_mm1,'Color','b','LineWidth',plotLineWidth);
plot(lambda/mu,R_md1,'Color','r','LineWidth',plotLineWidth);
temp = gca;
 
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);
 
xlabel(['System utilization $\rho$'],'FontSize',20,'Interpreter','latex');
title(['Average delay time $\mathbf{R}$'],'FontSize',20, 'Interpreter','latex');
legend('MM1','MD1');
grid on;
saveas(gcf,'figure2.png');

