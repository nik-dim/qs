clear all
close all
clc

N = 21;
M = 2;
X = [1, 0.6];
for n = 1:N
    g(n,1) = 1;
end

for m = 1:M
    g(1,m) = 1;
end
 

for m = 2:M
    for n = 2:N
        g(n,m) = g(n,m-1) + X(m)*g(n-1,m);
    end 
end


G = g(:,M);



for i = 1:M
    r(i) = 0;
    for k = 1:(N-1)
       r(i) = r(i) + X(i)^k * G(N-k) / G(N); 
    end
end



%%
M = 3;
X = [1,1,2]
for N = 1:5
%     arithmhths = buzen(N,M,X);
    G_N(N) = buzen(N,M,X);       % N+1 giati h arithmhsh twn grammwn ston Buzen xekinaei apo to 0
end
