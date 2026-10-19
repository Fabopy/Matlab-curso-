clc;
clear all;
close all;

%sistema de simulink
sis = sim('sistema1.slx');
datos = sis.yout.extractTimetable;
t = sis.tout;
y = datos.Data;

%Función de transferencia
s = tf('s');
G = exp(-5*s)/(s + 2);
[yg, tg] = step(G);

%Ploteo
figure;
hold on;
plot(tg, yg, 'r')
plot(t, y, 'b')
legend('Matlab', 'Simulink')



%%

%Sistema desde el Workspace
t_array = 0:0.01:10;
x1 = t_array.*sin(sin(t_array)) + t_array;
x2 = t_array.^2.*exp(-0.5*t_array);

simin = [t_array', x1', x2'];

fcn = sin(x1) - x2 + 10;
plot(simin(:, 1), fcn)
