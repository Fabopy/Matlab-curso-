syms s t w a; %así defino simbólicamente 
f1 = exp(-t);
F1 = laplace(f1); %transformada de laplace de e^-t
f2 = t*sin(2*t) + 3*exp(-4*t);
F2 = laplace(f2);
f3 = exp(-a*t)*cos(w*t);
F3 = laplace(f3);
f4 = dirac(t); f5 = heaviside(t);
F3 = laplace(f4); F4 = laplace(f5);

f2_inv = ilaplace(F2); %de esta forma calculo la inversa de Laplace, 
% recuperando la función original

H1_s = 2/s;
h1_t = ilaplace(H1_s);

H3_S = 1 / (s*(s + 2)*(s + 3));
h3_t = ilaplace(H3_S);

H4_s = 2 / (s^2 + 4)*exp(-a*s);
h4_t = ilaplace(H4_s);

H5_S = sin(s)^2 + cos(s)^2;
h5_t = ilaplace(H5_S);

%% DE ESTA FORMA PUEDO SEPARAR LOS CÓDIGOS

%así se define una función transferencia
num = [1 2];
den = [1 7 0 4];
Gs = tf(num, den);
[y, t] = step(Gs, 20); %de esta forma puedo acotar el dominio.
% Cabe aclarar que si lo guardo en una variable al momento de desempaquetar 
% los valores me va a tirar errores 
datos = [round(y, 2), round(t, 2)];
% writematrix(datos, 'respuesta_gs.txt', 'Delimiter', 'tab');
polos = pole(Gs);
ceros = zero(Gs);
disp(polos);
plot(t, y, 'ro');


