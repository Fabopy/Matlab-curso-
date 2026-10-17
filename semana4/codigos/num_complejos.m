clear all;

G1 = zpk([], [-1-i, -1+i], 2);
G2 = zpk([], [-1-3i, -1+3i], 10);
G3 = zpk([], [-3-3i, -3+3i], 18);
G4 = zpk([-18], [-3-3i, -3+3i], 1);

% figure;
% hold on;
% step(G1)
% step(G2)
% step(G3)
% step(G4)

%Verifico el tiempo de sobreenlongación
stepinfo(G2)

%%
syms s t 

Rs = 1/s;
G1_sym = 2/(s^2 + 2*s + 2);
G2_sym = 10/(s^2 + 2*s + 10);
G3_sym = 18/(s^2 + 6*s + 18);
G4_sym = (s+18)/(s^2 + 6*s + 18);

ilaplace(G4_sym*Rs, s, t)