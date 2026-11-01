clc
close all
clear all

%Constantes 
a = 1000 + 1100*rand;
b = round(rand);
c = 40 + 5*rand;
d = 100 + 50*rand;
e = 1000 + 200*rand;

%Modelo
modelo = sim('mod_22.slx', 60);
t = modelo.tout;
data = modelo.yout.extractTimetable;
y = data.Data;

%%
%Ploteamos  
plot(t, y, 'r')

   
%%
%Disminuimos el ruido tomando los últimos 50 valores
n = length(y);
k = sum(y(n - 49:end)/50);

function zeta = factor_amortiguamiento(y, k)
    ymax = max(y);
    num = -2*log(ymax/k - 1);
    den = pi^2 - 2*log(ymax/k - 1);
    zeta = sqrt(num/den);
end

zeta = factor_amortiguamiento(y, k);
indice = find(y > 0.5*k, 1, 'first');
td = t(indice);
omega = (1.1 + 0.125*zeta + 0.469*zeta^2)/td;

%Armamos la función transferencia de segundo orden
G = tf([k*omega^2], [1, 2*omega*zeta, omega^2]);


[yout, tout] = step(G);


subplot(2,1,1)
plot(t, y, 'r')
hold on
step(G, 'm')
subplot(2,1,2)
plot(t(1:400), y(1:400), 'r')
hold on 
plot(tout, yout, 'm')

%%

% Implementamos el sistema real sin ruido
sis_no_ruido = tf([a], [b, c, d, e]);
ltiview(sis_no_ruido, G)



