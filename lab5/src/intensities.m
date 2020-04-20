function [ rho, erg ] = intensities( lambda , mu )

lambda_Q(1) = lambda(1);
lambda_Q(2) = 2/7 * lambda(1) + lambda(2);
lambda_Q(3) = 4/7 * lambda(1);
lambda_Q(4) = 1/2 * lambda_Q(3) + 1/7 * lambda_Q(1);
lambda_Q(5) = 1/2 * lambda_Q(3) + lambda_Q(2);
 
for i=1:5
    rho(i) = lambda_Q(i) / mu(i);
end

erg = ( rho < 1);

% display(rho);

end

