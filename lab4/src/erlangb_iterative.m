function p = erlangb_iterative( rho, n )
    if n==0
        p = 1;
    else
        a = erlangb_iterative(rho, n-1);
        p = rho*a / (rho*a + n);
    end
end

