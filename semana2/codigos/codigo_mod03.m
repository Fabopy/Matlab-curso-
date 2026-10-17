%Código para un sistema de amortiguamiento con entrada escalón
M = 100; %kg
B = 1000; %NS/m
K = 50000; %N/m
omegan = sqrt(K/M); %frecuencia natural no amortiguada
zeta = 1/(2*omegan*M)*B; %amortiguamiento relativo 
A = 2*zeta*omegan;
O = omegan^2;
modelado = sim("mod_03.slx"); %Acá puedo cambiar el nombre de la variable del Workspace
datos = modelado.yout.extractTimetable;
t = datos.Time;
entrada_escalon = datos.Data;
salida = datos.Data_1;
figure;
plot(t, entrada_escalon, 'r')
hold on;
plot(t, salida, 'b')

%%



