close all;
clear all;
clc;
%%
M = 2;
X = [1,0.6];
for N = 1:21 
%     arithmhths = buzen(N,M,X);
    G_N(N) = buzen(N,M,X);       % N+1 giati h arithmhsh twn grammwn ston Buzen xekinaei apo to 0 
end

for N = 1:20
    for i = 1:M
        E_n(i,N) = 0;
        for k = 1:(N-1)
           E_n(i,N) = E_n(i,N) + X(i)^k * G_N(N-k) / G_N(N); 
        end  
        P(i,N) = X(i) * G_N(N) / G_N(N+1);
    end
    pop(N) = E_n(1,N)+E_n(2,N);
end

%%
fontsize = 12;
lineWidth = 1;
plotLineWidth = 4;
width=1024;
height=568;
colors = 'rbgyk';
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
for k = 1:M
    plot(P(k,:),'b--o','MarkerSize',10,'MarkerFaceColor',colors(k));
end
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off


ylabel(['$P(n_{i}\geq 1)$'],'FontSize',20,'Interpreter','latex');
xlabel(['N'],'FontSize',20, 'Interpreter','latex');
legend('i=1','i=2');
grid on;
saveas(gcf,'figure_2a.png');   
 

%%
colors = 'rbgyk';
fig1 = figure();
fig1.Color = 'w';
set(gcf,'units','pixels','position',[0,0,width,height]) ; 
hold on
for k = 1:M
    plot(E_n(k,:),'b--o','MarkerSize',10,'MarkerFaceColor',colors(k));
end
temp = gca;
temp.Color = 'w';
temp.LineWidth = lineWidth;
temp.GridColor = 'k';
% temp.GridAlpha = 0.5;
temp.FontSize = fontsize;
hold off


ylabel(['$E(X_i)$'],'FontSize',20,'Interpreter','latex');
xlabel(['N'],'FontSize',20, 'Interpreter','latex');
legend('i=1','i=2');
grid on;
saveas(gcf,'figure_2b.png');   
 
