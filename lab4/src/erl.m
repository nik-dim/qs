function  B  = erlangb_factorial(rho, c)
    sum = 0;
    for k = 0 : c
       sum = sum + (rho^k)/(factorial(k));
    end
    B = ((rho^c)/factorial(c))*(1/sum);
end
