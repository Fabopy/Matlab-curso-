clear all;
load count.dat;


fig = figure('Name', 'Guía 03', 'PaperPosition', [0, 0, 30, 15]);
theme(fig, 'light');
grid on;
hold on;

t = 1:24;
tsuave = linspace(1, 24, 100);

%3 señales
s1 = count(:, 1);
s2 = count(:, 2);
s3 = count(:, 3);


%Interpolación
coef1 = polyfit(t, s1, 10);
s1_suave = polyval(coef1, tsuave);    

%ploteo
plot(t, s1, 'ro')
plot(t, s2, 'pentagram-', Color='black')
plot(t, s3, Color='cyan', LineWidth=5)
plot(tsuave, s1_suave, Color='blue', LineWidth=3)
title('Autos \alpha por hora')
ylabel('Cantidad de autos')
legend('s1', 's2', 's3', 's1 suavizado')
set(gca,'XLimMode','manual','XLim',[1 24]);
set(gca,'XTick',6:6:24); % etiquetas a las horas: 6,12,18 y 24.
set(gca,'XTickLabel',{'6';'mediodia';'18 hs';'medianoche'});
set(gca,'XGrid','on')

%%
fig2 = figure;
theme(fig2, 'light')
z = peaks(50); %Si aumento el número densifico más la malla
mesh(z)
colormap("hot")
xlabel('x')
ylabel('y')
zlabel('z')
title('Figura 3D')
view([-27, 68]) %Con esto modifico la vista inicial