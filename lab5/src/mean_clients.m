function [ Q ] = mean_clients( lambda , mu )

[ rho, erg ] = intensities( lambda , mu );

if (erg == 1)
    Q = rho ./ (1-rho);
else
    fprintf('Error\n');
    Q = (-1) * ones(1,length(erg));
end


end

