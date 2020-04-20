function G_N = buzen( N, M , X)

	for n = 1:N
	    g(n,1) = 1;
	end

	for m = 1:M
	    g(1,m) = 1;
	end
	 
	for m = 2:M
	    for n = 2:N
	        g(n,m) = g(n,m-1) + X(m)*g(n-1,m);
	    end 
	end

	G_N = g(N,M);

end

