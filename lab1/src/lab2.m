clc;
clear all;
close all;


%% Exponential A

k = 0:0.00001:8;
m = [0.5,1,3];

for i=1:length(m)
  exponential(i,:) = exppdf(k,m(i));
end

colors = 'rbm'; 
figure();
hold on;
for i=1:length(m)
  plot(k,exponential(i,:),colors(i),'linewidth',1.2);
end
hold off;

title('PDFs of exponential distribution');
xlabel('k values');
ylabel('pdf');
legend('\lambda = 0.5','\lambda = 1','\lambda = 3');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros2_A.png']);
%% Exponential B
for i=1:length(m)
  exponential(i,:) = expcdf(k,m(i));
end

colors = 'rbm'; 
figure();
hold on;
for i=1:length(m)
  plot(k,exponential(i,:),colors(i),'linewidth',1.2);
end
hold off;

title('CDFs of exponential distribution');
xlabel('k values');
ylabel('probability');
legend('\lambda = 0.5','\lambda = 1','\lambda = 3');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros2_B.png']);
%% Exponential C
% no code required for this. It is only theoretical.

%% Exponential D
X1 = exprnd(1, 5000, 1);
X2 = exprnd(0.5, 5000, 1);

Y = min(X1, X2);

histogram(Y,50,'Normalization', 'pdf');
% plot(Y,f,'LineWidth',1.5)
xlabel('k values');
ylabel('pdf value');
set(gcf,'color','w');
temp = getframe(gcf);
imwrite(temp.cdata, [ 'output/meros2_D.png']);