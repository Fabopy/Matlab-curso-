syms s t;

%creo la función de transferencia
num = [1 1 1];
den = [1 0.5 0 3];
G = tf(num, den);

%Realimentación H = 6
H = 6;

%Realimentación H = 1
H1 = 1;

%Funciones C
sist = feedback(G, H); 
sist1 = feedback(G, H1);
% esto devuelve la función de transferencia de
% lazo abierto del sistema retroalimentado con H

[y, t] = step(sist, 10); %sistema con realimentacion H = 6
datos_h6 = [t, y];
writematrix(datos_h6, 'respuesta_gsh6.txt', 'Delimiter', 'tab');
[y1, t1] = step(sist1, 10); %sistema con realimentacion H = 1
datos_h1 = [t1, y1];
writematrix(datos_h1, 'respuesta_gsh1.txt', 'Delimiter', 'tab');
[yg, tg] = step(G, 20); %Sistema sin compensador
datos_sin_compensador = [tg, yg];
writematrix(datos_sin_compensador, 'respuesta_gs_sinc.txt', 'Delimiter', 'tab');

% plot(t, y, 'b');
hold on;
% plot(t1, y1, 'r'); % es inestable
plot(tg, yg, 'g')
legend('H = 6', 'H = G')

polosG = pole(G); %polos positivos
polos_sist = pole(sist);
polos_sist_h1 = pole(sist1);


%%
%Por último calculo los polos de la siguiente función transferencia

s = tf('s'); %si primero defino Fs me va a tirar error ya que no le estoy pasando
% en formato array, en cambio si defino a 's' como una función
% transferencia entonces ahí si me dejará
Fs = exp(-s) / (s^2 + s + sqrt(2)); 
polosFs = pole(Fs);
[y, t] = step(Fs, 10);
plot(t, y);


