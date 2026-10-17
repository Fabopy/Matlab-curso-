a = 1;
b = 2;
c = 1;
d = 10;
e = 5;
f = 8;


mdl = "C:\Users\fabri\OneDrive\Documents\MATLAB\sem_05_errores.slx";
mod = sim(mdl);
y = mod.yout.extractTimetable;
t = y.Data_1;
er = y.ess;
datos = [t, er];
% writematrix(datos, 'Curso_Matlab\semana5\parabola_error_integrador.txt', 'Delimiter', 'tab')


plot(t, er)

%%

syms s a b c d e f

g = (a*s + b) / (s^4 + c*s^3 + d*s^2 + e*s + f);
h = 1/(s);
r = 1/s^2;
ess = s/(1+g*h)*r;
f_lim = limit(ess, s, 0)


%%

Gs = tf([a, b], [1, c, d, e, f]);
Hs = [tf([1], [1, 1]), tf([1], [1, 0]), tf([1], [1, 0, 0])];
Fs = feedback(Gs, Hs(3)); %función transferencia de lazo cerrado
polos_fs = pole(Fs);




