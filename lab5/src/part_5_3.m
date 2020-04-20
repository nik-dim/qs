clc
clear all;
close all;
%%
lambda = [4, 1];
mu = [6, 5, 8, 7, 6];
[ rho, erg ] = intensities( lambda , mu );

[~, bottleneck] = max(rho)
if (erg == 1)
    Q = mean_clients( lambda , mu );
end
%% epalhteysh bottleneck
lambda = [6, 1];
mu = [6, 5, 8, 7, 6];
[ rho, erg ] = intensities( lambda , mu );


%% 
for j = 10 : 99
    i =  0.01 * j;  
    lambda1 = mu(1) * i ;
    lambda = [lambda1, 1];
    [ rho, erg ] = intensities( lambda , mu );
    if (erg == 1)
        Q = mean_clients( lambda , mu );
    end
    E_T(j-9) = sum(Q) / sum(lambda);
end
%%
fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;

fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
lambda1 = mu(1) * (0.1:0.01:0.99);
plot(lambda1,E_T,'Color','b','LineWidth',plotLineWidth);
% y(1:length(E)) = val;
% plot(a,y,'--k','LineWidth', 2);
temp = gca;
xlim([0 6]);
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off


title(['Average Delay Time'],'FontSize',20,'Interpreter','latex');
xlabel(['$\lambda_1$'],'FontSize',20, 'Interpreter','latex');
grid on;
saveas(gcf,'figure3.png');   
    


