% 1. Variables: falta definir d y e
a=1; b=100; c=1; d = 1; e = 10;

% 2. Sumar los parámetros:
suma1 = sum([a b c d e]);


% 3. Crear una variable s para G(s): falta encerrar entre comillas a s
s = tf('s');

% 4. Función de transferencia: falta multiplicar. Además tengo que borrar
% la variable 'sum' del workspace para que funcione correctamente 

Fs = (a*s+b)/(c*s^2+d*s+e);

% 5. Sumar los parámetros de nuevo: anteriormente declaré una variable sum
% y sum es una función reservada de Matlab. Hay que cambiar el nombre de la
% variable de arriba

suma_2 = sum([a b c d e]); 

% 6. Respuesta ante un escalón: acá hay que cambiar el orden [y, t]
[y, t] = step(s/(s^2+s));

% 7. Definir los vectores "t" y "x": se cambia el 0.5 por 0.1 para el paso
tx = 0 : 0.1 : 12;
x = sin(0 : 0.1 : 12);

% 8. Graficar "x" sobre "t":
plot(tx,x) 