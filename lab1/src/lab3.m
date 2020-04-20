clc;
clear all;
close all;

%% Poisson Process A

R = exprnd(5,1,100);
X(1) = R(1);
for i = 2:100
    X(i) = X(i-1) + R(i);
end
figure()
stairs(X);
title('Stair plot of 100 consecutive random events');
xlabel('t');
ylabel('N(t)');
legend('\lambda = 5');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros3_A.png']);

%% Poisson Process B
n = max(size(X));
answer = X(n) / n;


%% Poisson Process C

loops = 100;
mean_49_50 = 0;
mean_50_51 = 0;
for k = 1:loops
   R = exprnd(5,1,100); 
   mean_49_50 = mean_49_50 + abs( R(50)-R(49) );
   mean_50_51 = mean_50_51 + abs( R(51)-R(50) );
end

mean_49_50 = mean_49_50 / loops;
mean_50_51 = mean_50_51 / loops;

