clc;
clear all;
close all;

%% REMEMBER TO COMMENT LINES 5&6 IN runSINGLE.m
plotsON = 0;
p = 0.5;
for lambda = 6:8
    for k = 3:6
        run('runSINGLE.m');
        throughput_a(k-2,lambda-5) = mu_a*(1 - P(1) - P(10) );
        throughput_b(k-2,lambda-5) = mu_b*(1 - sum(P(1:k+2)));
        ratio(k-2,lambda-5) = throughput_a(k-2,lambda-5)/throughput_b(k-2,lambda-5);
    end 
    k_min(lambda-5) = find(ratio(:,lambda-5) > 5,1) + 2;
    display(['The minimum ratio for lambda=', num2str(lambda),' is achieved for k=', num2str( k_min(lambda-5))]);
end

%%
plotsON = 0;    
for lambda = 6:8
    k = k_min(lambda-5);
    for ii=1:9
        p=ii/10;
        run('runSINGLE.m');
        thr_a = mu_a*(1 - P(1) - P(10) );
        thr_b = mu_b*(1 - sum(P(1:k+2)));
        ratio_Q3(ii,lambda-5) = thr_a/thr_b;
    end
end


%% plot question 3
run('plot_q3.m');


