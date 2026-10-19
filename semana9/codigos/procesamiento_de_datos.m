clc
clear all
close all


[num, txt, todo] = xlsread("Libro1.xlsx");
vec = [];

for i=1:size(todo, 1)
    for j = 1:size(todo, 2)
        if ischar(todo{i, j})
            temp = todo{i, j};
            for k=1:length(temp)
                n = str2num(temp(k));
                if ~isempty(n)
                    fprintf('%g es un número\n', n)
                    vec = [vec, n];
                end
            end
        end
    end
end

vec;


%%

%# Leo el archivo
l = imread('fox_photo.jpg');
% image(l)

%# Grafico para las primeras 300 columnas
% image(l(:, 1:300, :))

%Grafico para las primeras 300 filas
% image(l(1:300, :, :))

%# canales o colores
R = l(:, :, 1);
G = l(:, :, 2);
B = l(:, :, 3);

% image(B)

%imagen 200x200x3
% image(l(1:200, 1:200, :))

%# Agregamos una línea blanca
figure;
subplot(1, 2, 1);
l(:, 50:75, :) = 255;
image(l)
title('Franja blanca')
axis image;

%# Agregamos una línea negra
subplot(1, 2, 2);
l(150:175, :, :) = 0;
image(l)
title('Franja blanca y negra')
axis image;







