%La sucesión de Fibonacci se define mediante
% f_n = f_{n-1} + f_{n - 2}


function fn = fibonacci2(n)
    a = 0; b = 1;
    arr = 1:1:n;
    for i = arr
        fn = a + b;
        temp = a;
        a = fn ; b = temp;
    end
end


function fn = fibonacci(n)
    a = 0 ; b = 1; %f_0 = 0,  f_1 = 1
    m = n - 1; %le resto 1 ya que arranco con 2 valores de la sucesión
    i = 0;
    while i <= m
        fn = a + b;
        i = i + 1;
        temp = a;
        a = fn; b = temp;
    end
end


function fn = fibonacci_10000()
    a = 0 ; b = 1;
    fn = a + b;
    while fn < 10000
        fn = a + b;
        temp = a;
        a = fn ; b = temp;
    end
end


function fn = fibonacci_v(v)
    a = 0; b = 1;
    i = 1;
    fn = 0;
    while fn < v
        fn = a + b;
        i = i + 1;
        temp = a;
        a = fn ; b = temp;
    end
end

% fibonacci_v(20000)
fibonacci2(40)
p_valor = fibonacci(40)
% fibonacci_10000()