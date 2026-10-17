
function p = primes_vec(n)
    n_primes = [];
    m = 2:1:n;
    c = 1;
    for i = m %3
        flag = 1;
        for j = 2:1:i-1 
            if mod(i, j) == 0
                flag = 0;
                break;
            end
        end
        if flag == 1
            n_primes(c) = i;
        end
        c = c + 1;
    end 
    l = n_primes(n_primes > 0);
    p = l;
end

% mis_primes = primes_vec(10000);

for i = 300:900
    q = prod(primes(i)) + 1;
    if ~isfinite(q)
            q = prod(primes(i - 1) + 1);
            break
    end
end



