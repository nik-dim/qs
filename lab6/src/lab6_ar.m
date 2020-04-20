W = 8;
S = 1./[1, 2, 2, 2, 2/3];
P = [ 0 1 0 0 0 ; 0 0 1 0 0 ; 0 0 0 1 0 ; 0 0 0 0 1 ; 1 0 0 0 0 ];
V = qncsvisits(P);


for i = 1:W
  % X = throughput
  [U R Q X] = qnclosed( i , S , V );
  gamma(i) = X(1);
  E_T_sd(i) = 0;
  for j = 2:4 
    E_T_sd(i) = E_T_sd(i) + R(j) ;
  endfor
%  disp(E_T_sd)
endfor

% PLOTS



%% erwthma 2


for i = 1:W
  for k = 1:5
    S_now = S / k;
  % X = throughput
    [U R Q X] = qnclosed( i , S_now , V );
    U_analytics(i,k,:) = U;
    Q_analytics(i,k,:) = Q;
    gamma2(i,k) = X(1);
    E_T_sd2(i,k) = 0;
    for j = 2:4 
      E_T_sd2(i,k) = E_T_sd2(i,k) + R(j) ;
    endfor
  endfor
endfor
