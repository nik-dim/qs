clc;
clear all;
close all;

%% REMEMBER TO COMMENT LINES 5-7 IN runSINGLE.m
plotsON = 0;
p = 0.5;
for lambda = 6:8
    for k = 3:6
        run('runSINGLE.m');
        results(k-2,lambda-5) = mean_clients;
        NumberOfTransitions(k-2,lambda-5) = transitions;
    end 
end

%% plot question 4
run('plot_q4.m');
