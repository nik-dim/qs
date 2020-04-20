fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;


fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 


hold on
MeanValue(1:length(Mean_values_of_clients)) = mean_clients;
plot(Mean_values_of_clients,'r','LineWidth', lineWidth);
plot(MeanValue,'--k','LineWidth', lineWidth);
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
xlim([0 index]);
hold off


xlabel(['$Transitions (\cdot10^{3})$'],'FontSize',20,'Interpreter','latex');
title(['\begin{tabular}{c}  Average number of clients in the M/M/2/8 system \\for $\lambda= $ ', num2str(lambda),' clients/sec \& k = ',num2str(k),' \end{tabular}'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,['output/clients_lambda=',num2str(lambda),'k=',num2str(k),'.png']);   
  
