clc
clear all
close all

s = tf('s');
G1 = exp(-2*s)*3*s/(s^2 + s + 2);
G2 = zpk([], [-2, -4, -5], 1);

A = [-8, -2.5;
      2,    0];

B = [2;
     0];

C = [0.5, 0.75];
D = [0];

G3 = ss(A, B, C, D); 

%salida
sis = sim('mod_18.slx');

%%
data = sis.yout.extractTimetable;
plot(sis.tout, data.Data)