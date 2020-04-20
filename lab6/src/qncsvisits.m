function V = qncsvisits( P, r )

%   V = zeros(size(P));
  A = P-eye(K);
  b = zeros(1,K);
  A(:,r) = 0; 
  A(r,r) = 1;
  b(r) = 1;
  V = b/A;
  V = max(0,V);
endfunction

