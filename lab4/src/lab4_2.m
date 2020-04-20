clc;
close all;
clear all;


%%

rho = 76.66;
c = 200;
for i = 1:200
    p(i) = erlangb_iterative(rho, i);
end


fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;

fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(p,'Color','b','LineWidth',plotLineWidth);
temp = gca;
 
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off
% ylim([0 50]);
 
xlabel(['Number of telephone lines c'],'FontSize',20,'Interpreter','latex');
title(['$\mathbf{P}_{blocking}$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure2_4c.png');
%% 2.4(c) 
x = find(p < 0.01);
result = x(1)