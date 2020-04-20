%% PLOT for question 2
% IT IS NECESSARY TO RUN q2.m BEFORE

fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;


fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 

k = 3:6;
hold on
plot(k,results(:,1),'o-k','LineWidth', lineWidth);
plot(k,results(:,2),'o-r','LineWidth', lineWidth);
plot(k,results(:,3),'o-g','LineWidth', lineWidth);
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.FontSize = fontsize;
hold off

legend('\lambda=6','\lambda=7','\lambda=8')
xlabel(['$k$'],'FontSize',20,'Interpreter','latex');
title(['mean\_clients(k)'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,['output/q2.png']);   

