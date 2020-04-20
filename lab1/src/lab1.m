clc;
clear all;
close all;


%% Poisson A
% # TASK: In a common diagram, desing the power density functions of Poisson processes
% # with lambda parameters 3,10,50. In the horizontal axes, choose k parameters 
% # between 0 and 70. 

k = 0:1:70;
lambda = [3,10,50];

for i=1:length(lambda)
  poisson(i,:) = poisspdf(k,lambda(i));
end

colors = 'rbgky';
figure(1);
hold on;
for i=1:length(lambda)
  plot(k,poisson(i,:),colors(i),'linewidth',1.2);
end
hold off;

title('probability density function of Poisson processes');
xlabel('k values');
ylabel('probability');
legend('lambda=3','lambda=10','lambda=50');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros1_A.png']);
%% Poisson B

% # TASK: regarding the poisson process with parameter lambda 30, compute its mean 
% # value and variance
lambda = 30;
poisson30 = poisspdf(k,lambda);
mean_value = 0;
for i=0:(length(poisson30)-1)
  mean_value = mean_value + i.*poisson30(i+1);
end

display('mean value of Poisson with lambda 30 is');
display(mean_value);

second_moment = 0;
for i=0:(length(poisson30)-1)
  second_moment = second_moment + i.*i.*poisson30(i+1);
end

variance = second_moment - mean_value.^2;
display('Variance of Poisson with lambda 30 is');
display(variance);

%% Poisson C

% # TASK: consider the convolution of the Poisson distribution with lambda 20 with 
% # the Poisson distribution with lambda 30. 

first = find(lambda==10);
second = find(lambda==50);
poisson_first = poisson(2,:);
poisson_second = poisson(3,:);

composed = conv(poisson_first,poisson_second);
new_k = 0:1:(2*70);

figure(2);
hold on;
plot(k,poisson_first(:),colors(1),'linewidth',1.2);
plot(k,poisson_second(:),colors(2),'linewidth',1.2);
plot(new_k,composed,'ko','linewidth',2);
hold off;
title('Convolution of two Poisson processes');
xlabel('k values');
ylabel('Probability');
legend('lambda=10','lambda=50','new process');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros1_C.png']);
%% Poisson D

% # TASK: show that Poisson process is the limit of the binomial distribution.
k = 0:1:50;
% # Define the desired Poisson Process
lambda = 30;
i = 1:1:5;
% n = lambda.*i; 
% p = lambda./n;
n = [ 100, 200, 300, 3000, 30000];
p = lambda./n;

figure(3);
title('Poisson process as the limit of the binomial process');
% legend('n=300','n=3000','n=30000');
xlabel('k values');
ylabel('Probability');
hold on;
for i=1:5
  binomial = binopdf(k,n(i),p(i));
  plot(k,binomial,colors(i),'linewidth',1.2);
end
legend('n=100','n=200','n=300','n=3000','n=30000');
hold off;
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros1_D.png']);