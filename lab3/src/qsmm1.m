function [U, R, Q, X, p0] = qsmm1( lambda, mu )
  lambda = lambda(:)';
  mu = mu(:)';
  U = lambda ./ mu; % utilization
  rho = U;
  p0 = 1-rho;
  Q = rho ./ (1-rho);
  R = 1 ./ ( mu .* (1-rho) );
  X = lambda;
end