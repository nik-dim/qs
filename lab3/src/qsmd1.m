function [U, R, Q, X, p0] = qsmd1( lambda, mu )
  lambda = lambda(:)';
  mu = mu(:)';
  U = lambda ./ mu; % utilization
  rho = U;
  p0 = 1-rho;
  Q = rho + (0.5*rho.^2) ./ (1-rho);
  R = Q ./ lambda;
  X = lambda;
end