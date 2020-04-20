close all;
clear all;
clc;
%%
% TAKEN gamma, E_T_sd from Octave
gamma = [  0.25000,  0.40000,  0.49383,  0.55385,  0.59271,  0.61803,  0.63461,  0.64549 ];
E_T_sd = [  1.5000,  1.6875,  1.8375,  1.9537,  2.0410,  2.1049,  2.1504,  2.1823 ];

fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;

fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(gamma,'bo','MarkerSize',20,'MarkerFaceColor','b');
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
xlim([0 8]);
ylim([0 1.1*max(gamma)]);
hold off


ylabel(['$\gamma$'],'FontSize',20,'Interpreter','latex');
xlabel(['W'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure1.png');   
    
%%
fig2 = figure();
fig2.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(E_T_sd,'ko','MarkerSize',20,'MarkerFaceColor','k');
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
xlim([0 8]);
ylim([0 1.1*max(E_T_sd)]);
hold off


ylabel(['$\mathbf{E}(T_{sd})$'],'FontSize',20,'Interpreter','latex');
xlabel(['W'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure2.png');   
    
%%
fig3 = figure();
fig3.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
plot(gamma, E_T_sd,'ko','MarkerSize',20,'MarkerFaceColor','k');
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
xlim([0 1.1*max(gamma)]);
ylim([0 1.1*max(E_T_sd)]);
hold off


ylabel(['$\mathbf{E}(T_{sd})$'],'FontSize',20,'Interpreter','latex');
xlabel(['$\gamma$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure3.png');   
    

