clear all
close all
clc



%Sistemas
Gs = tf([3, 9], [1, 11, 19.25, 92.5]);
Hs = zpk([-5], [-2, -4, -4], 2);

%ceros
Gs_ceros = zero(Gs);
Hs_ceros = zero(Hs);

%polos
Gs_polos = pole(Gs);
Hs_polos = pole(Hs);

%Gráficos
fig = figure;
theme(fig, "light");
pzmap(Gs);
hold on;
pzmap(Hs);


%%
%Sistema G retroalimentado por H
C1 = feedback(Gs, Hs);

%%

%Uso del connect

%Primer sistema
Hs.InputName = 'r';
Hs.OutputName = 'u';
Gs.InputName = 'e';
Gs.OutputName = 'y';
Sum = sumblk('e = u - y');
sys1 = feedback(Gs, 1);

C2 = connect(Hs, sys1, Sum, 'r', 'y');

%Entrada escalón
tiledlayout(2,1);
ax1 = nexttile;
stepplot(ax1, Gs, 'r', Hs, 'b--', C2, 'g');
title(ax1, 'Respuesta escalón')

%Entrada impulso
ax2 = nexttile;
impulseplot(ax2, Gs, 'r', Hs, 'b--', C2, 'g');
title(ax2,  'Respuesta impulso')

%Voy a determinar la info con lsiminfo para el impulso
[yG, tG] = impulse(Gs);
[yH, tH] = impulse(Hs);
[yC2, tC2] = impulse(C2);

info_gs_impulso = lsiminfo(yG, tG, 0);
info_hs_impulso = lsiminfo(yH, tH, 0);
info_c2s_impulso = lsiminfo(yC2, tC2, 0);


%% 

%Diagrama de bode
fig = figure;
theme(fig, "light");
bode(fig, Gs, 'r', Hs, 'b');

s = tf(['s']);
Fs = 3/((s + 2 - 9i)*(s + 2 + 9i));
bode(fig, Fs, 'r');

%Ancho de banda
anchoG = bandwidth(Gs);
anchoH = bandwidth(Hs);

%Diagrama de Nyquist
nyquist(fig, Gs);

%%

%Representación de sistemas lineales mediante ecuaciones diferenciales

A = [-3, 5;
    1, -7];

b = [2;
    3];

c = [4, 5];

d = [0];

M = ss(A, b, c, d);

% step(M);
% bode(M);

%Esto me devuelve el numerado y denominador de la tf
[num, den] = ss2tf(A, b, c, d);

%Construyo la función transferencia
tfM = tf(num, den);

%Grafico
step(tfM, 'b');
hold on;
% step(M, 'r');

%Con ss2zp me devuelve los ceros y polos
[z, p, k] = ss2zp(A, b, c, d);

%Construyo la tf con los polos, ceros y ganancia
tf_zpk = zpk(z, p, k);
step(tf_zpk)


%G a espacio de datos
[AG, BG, CG, DG] = tf2ss([3, 9], [1, 11, 19.25, 92.5]);    








