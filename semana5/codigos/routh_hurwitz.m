%voy a implementar un sistema Routh-Hurwitz para solucionar el
%el siguiente sistema

% y^(4) + 2*y^(3) + 4*y^(2) + y^(1) + 1 = r(t)

function estable(M)
    first_row = M(1);
    for i = 1:length(first_row)
        if i < 0
            disp('Sistema no estable!')
            break
        end
    disp('Sistema estable!')
    end
end

function RH_4(y)
    len = length(y);
    H = zeros(len, 3);
    a4 = y(1); a3 = y(2); a2 = y(3); a1 = y(4); a0 = y(5);
    alpha1 = ((a3*a2) - (a4*a1))/a3;
    alpha2 = ((a3*a0) - (a4*0))/a3;
    beta1 = ((alpha1*a1)-(a3*alpha2))/alpha1;
    gamma1 = ((beta1*alpha1)-(0*alpha1))/beta1;

    H(1, [1:3]) = [a4, a2, a0];
    H(2, [1:2]) = [a3, a1];
    H(3, [1:2]) = [alpha1, alpha2];
    H(4, 1) = beta1;
    H(5, 1) = gamma1;
    
    estable(H);
    H
end

coef1 = [1, 2, 4, 1, 1];
% coef2 = [3, 2, 2, 0, -1];
RH_4(coef1)

