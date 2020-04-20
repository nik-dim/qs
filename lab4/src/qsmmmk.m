function [U, R, Q, X, p0, pK] = qsmmmk( lambda, mu, m, K )

  lambda = lambda(:)'; % make lambda a row vector
  mu = mu(:)'; % make mu a row vector
  m = m(:)'; % make m a row vector
  K = K(:)'; % make K a row vector

%   U = 0; R = 0; Q = 0; X = 0; p0 = 0; pK = 0;
  for i=1:length(lambda)
    % Build and solve the birth-death process describing the M/M/m/k system
    birth_rate = lambda(i)*ones(1,K(i));
    death_rate = [ linspace(1,m(i),m(i))*mu(i) ones(1,K(i)-m(i))*m(i)*mu(i) ];
    p = ctmc(ctmcbd(birth_rate, death_rate));
    p0(i) = p(1);
    pK(i) = p(1+K(i));
    j = [1:K(i)];
    Q(i) = dot( p(1+j),j );
  end
  % Compute other performance measures
  X = lambda.*(1-pK);
  U = X ./ (m .* mu );
  R = Q ./ X;
end
