t = 0:0.1:10;
x = sin(t);

%Ploteo de la función con puntos verdes
ax1 = nexttile;
plot(ax1, t, x, color = 'g', Marker = '.', MarkerSize = 10, LineStyle = 'none')

%Ploteo de la función con diamantes negros
ax2 = nexttile;
plot(ax2, t, x, color = 'black', Marker = 'diamond', MarkerSize = 10, LineStyle = 'none')

%Ploteo de la función con rosa-triángulos con puntos
ax3 = nexttile;
plot(ax3, t, x, color = 'magenta', Marker = '^', MarkerSize = 10, LineStyle = '-.')

%%
Gs = tf([1], [1 4 3]);
tarray = 0:0.1:15;
[y, t] = impulse(Gs, tarray);
datos = [t, y];
plot(t, y, color = 'red')
writematrix(datos, 'impulso_response.txt', 'Delimiter', 'tab');