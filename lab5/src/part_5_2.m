clc
clear all;
close all;

%% erwthma 2
lambda = 10000; %pps
mu1 = 15*10^6 / (8 * 128);
mu2 = 12*10^6 / (8 * 128);
a = 0.001:0.001:0.999;

E = a./(mu1-a.*lambda) + (1-a)./(mu2-(1-a).*lambda);

[val, id] = min(E);
disp(val);
disp(id/999);
%% plot erwthma 2
fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;

fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on

plot(a, E,'Color','b','LineWidth',plotLineWidth);
y(1:length(E)) = val;
plot(a,y,'--k','LineWidth', 2);
temp = gca;

temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);

title(['Average Delay Time'],'FontSize',20,'Interpreter','latex');
xlabel(['$\mathbf{Pr}\{a\}$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure2.png');