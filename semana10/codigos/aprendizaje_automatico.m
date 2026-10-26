clc
clear all
close all

%% Ejemplo 1
cig = 0:1:32;
cancer = 1.7*cig + 22 + 5*randn(size(cig));

fig = figure;
theme(fig, 'light')
%Casos de cancer
plot(cig, cancer, 'b')
hold on;

%Hacemos una regresión lineal
lin = polyfit(cig, cancer, 1);
cancer_est = polyval(lin, cig);
plot(cig, cancer_est, 'r')
xlabel('Cigarrillos por día')
ylabel('Casos de cancer')

%Hacemos una regresión de grado 15
orden15 = polyfit(cig, cancer, 15);
cancer_est15 = polyval(orden15, cig);
plot(cig, cancer_est15, 'g')

%Cálculo de

%% Ejemplo 2

t = 1:1:60;
y =  50*sin(pi/6*t) + 90 + 10*randn(1, 60);
plot(t, y)

%% Ejemplo 3

