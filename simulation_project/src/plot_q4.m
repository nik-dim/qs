%% PLOT for question 4
% IT IS NECESSARY TO RUN q4.m BEFORE

fontsize = 12;
lineWidth = 1.5;
plotLineWidth = 4;
width=1024;
height=568;

for lambda = 6:8
    fig1 = figure();
    fig1.Color = 'w';
    set(gcf,'units','pixels','position',[0,0,width,height]) ; 

    k = 3:6;
    stem(k,NumberOfTransitions(:,lambda-5),'o-r','LineWidth', 3);
%     bar(k,NumberOfTransitions(:,lambda-5));
    temp = gca;
    temp.Color = 'w';
    temp.LineWidth = lineWidth;
    temp.GridColor = 'k';
    temp.FontSize = fontsize;

    xlabel(['$k$'],'FontSize',20,'Interpreter','latex');
    title(['number of transitions for $\lambda=$',num2str(lambda)],'FontSize',20, 'Interpreter','latex');
    grid on;
    saveas(gcf,['output/q4_lambda=',num2str(lambda),'.png']);   
end

