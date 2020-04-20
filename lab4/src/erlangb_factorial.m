function p = erlangb_factorial( rho, n )
    if n==0
        p = 1;
    end
    a = erlangb_factorial(rho, n-1);

    p = rho*a / (rho*a + n);
end

