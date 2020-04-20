%% PLOT for question 3
% IT IS NECESSARY TO RUN q3.m BEFORE

fontsize = 12;
lineWidth = 1.5;
plotLineWidth = 4;
width=1024;
height=568;


fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 

k = 1:9;
p = k/10;
hold on
plot(p,ratio_Q3(:,1),'o-k','LineWidth', lineWidth);
plot(p,ratio_Q3(:,2),'o-r','LineWidth', lineWidth);
plot(p,ratio_Q3(:,3),'o-g','LineWidth', lineWidth);
temp = gca;
set(temp,'TickLabelInterpreter','latex')
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.FontSize = fontsize;
hold off

legend('\lambda=6','\lambda=7','\lambda=8')
xlabel(['$p$'],'FontSize',20,'Interpreter','latex');
title(['ratio $\frac{\gamma_{a}}{\gamma_{b}}$ as a function of $p$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,['output/q3.png']);   
  

