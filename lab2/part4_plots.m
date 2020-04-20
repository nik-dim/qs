%% Part 4 : Birth-Death Process in M/M/1/4 system
clear all;
close all;
clc;

fontsize = 12;
lineWidth = 1;
plotLineWidth = 2;
width=1920;
height=1080;

%%%%%%%%%%%%%%%%%
Q = [ ];        %
P = [ ];        %
%%%%%%%%%%%%%%%%% 
initial_state = [1 0 0 0 0]; % initial state: empty system
 
 
index = 0;
 
for t=0:0.01:50
  index = index + 1;
  temp = initial_state*expm(Q*t);
  for j=1:5
     Prob(index, j) = temp(j); 
  end
  if (temp-P) < 0.01
    break;
  end
end

P0(1:index) = P(1);
P1(1:index) = P(2);
P2(1:index) = P(3);
P3(1:index) = P(4);
P4(1:index) = P(5);

T = 0:0.01:t;
  
fig1 = figure(1);
fig1.Color = 'w';
 
hold on;



plot1 = plot(T,Prob(:,1),'Color','k','LineWidth',plotLineWidth);
plot1 = plot(T,Prob(:,2),'Color','r','LineWidth',plotLineWidth);
plot1 = plot(T,Prob(:,3),'Color','g','LineWidth',plotLineWidth);
plot1 = plot(T,Prob(:,4),'Color','b','LineWidth',plotLineWidth);
plot1 = plot(T,Prob(:,5),'Color','m','LineWidth',plotLineWidth);
plot1 = plot(T,P0,'--k','LineWidth',0.8);
plot1 = plot(T,P1,'--k','LineWidth',0.8);
plot1 = plot(T,P2,'--k','LineWidth',0.8);
plot1 = plot(T,P3,'--k','LineWidth',0.8);
plot1 = plot(T,P4,'--k','LineWidth',0.8);

ax = gca;
 
ax.Color = 'w';
ax.LineWidth = 1.2;
ax.GridColor = 'k';
ax.GridAlpha = 0.5;
ax.FontSize = 14;
 
% yticks([]); %insert y axis values here!!!
 
xlabel(['time (sec)'],'FontSize',20, 'Interpreter', 'latex');
ylabel('$P_{k}(t)$','FontSize',20,'Interpreter', 'latex');
title('State occupancy probabilities','FontSize',20,'Interpreter', 'latex');
 
leg = legend('$P_{0}(t)$','$P_{1}(t)$','$P_{2}(t)$','$P_{3}(t)$','$P_{4}(t)$');
leg.FontSize = 18;
set(leg, 'Interpreter', 'latex');
set(gcf,'units','pixels','position',[0,0,width,height]) ;

hold off;
grid off;
saveas(gcf,'figure5.png');