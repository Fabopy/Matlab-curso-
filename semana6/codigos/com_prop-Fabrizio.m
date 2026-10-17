clear all

%{
Primer ejercicio
%}
Gs = tf([1, 1, 1], [1, 0.5, 0, 3]); %sistema de la guía 04
Hs = tf([6], [1]);
feed = feedback(Gs, Hs);
polos = pole(feed);

%%
%{
Segundo ejercicio
%}

% fig = figure;
% hold on;
% grid on;
% theme(fig, 'light')
% matriz_polos = [];
% for c = 3:0.5:9
%     i = 1;
%     Hs = tf([c], [1]);
%     sis = feedback(Gs, Hs);
%     polos = pole(sis);
%     x = real(polos) ; y = imag(polos);
%     % disp(x)
%     plot(x, y, 'b.', MarkerSize=12)
%     axis([-10, 1, -3, 3])
%     title(['Polos del sistema con H =', num2str(c)])
%     xlabel('Parte real de los polos')
%     ylabel('Parte imaginaria de los polos')
%     drawnow
%     pause(0.1)
%     i = i + 1;
% end

%{
El código ayuda a ubicar el lugar de raíces.
Me genera una 'animación' a medida que el 
el compensador aumenta de valor. Es estable
para todos los valores; todos se encuentran
en el semiplano izquierdo (estabilidad del
sistema).

Aunque el resultado es lindo, calcular 
de esta forma las raíces del sistema
es laborioso. Por lo tanto, la mejor opción
es usar la función 'rlocus(Gs)' y me grafica
todo el lugar de raíces de dicho sistema.
Aunque la función de rlocus es fácil, no 
presenta la ventaja de cambiar el compensador
%}

% Nuevo Gs
fig2 = figure;
theme(fig2, 'light')
Gs1 = tf([1, 1], [1, 0.5, 0, 3]); 
rlocus(Gs)




%%

%{
Implemento el nuevo sistema G*H/(1+G*H)
Es prácticamente lo mismo que el sistema
anterior.
%}
fig3 = figure;
theme(fig3, 'light')
hold on;
for c = 3:0.5:9
    Hs = tf([c], [1]);
    new_sis = Gs*Hs/(1+Gs*Hs);
    polos = pole(new_sis);
    x = real(polos) ; y = imag(polos);
    plot(x, y, 'r.', MarkerSize=12)
    axis([-10, 1, -3, 3])
    title(['Polos del sistema con H =', num2str(c)])
    xlabel('Parte real de los polos')
    ylabel('Parte imaginaria de los polos')
    drawnow
    pause(0.1)
end



