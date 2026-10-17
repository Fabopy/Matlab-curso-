clear all;
%Datos numéricos
r = rand;


%Datos text
a = 42
fprintf('El resultado es %s \n', num2str(a))


%Datos structure
auto(1).velocidad = 80;
auto(1).nombre = 'espantomobil';
auto(1).ruedas = 3;
auto(2).ruedas = 4;

ruedas_auto2 = getfield(auto(2), 'ruedas');

personas(1).nombre = 'Fabrizio';
personas(1).altura = 1.80;
personas(2).nombre = 'Bautista';
personas(2).altura = 1.65;

function [alto] = masAlto(personas)
    if personas(1).altura > personas(2).altura
        alto = personas(1).nombre;
    else
        alto = personas(2).nombre;
    end
end

a = masAlto(personas);



%Datos cell
bebidas{1, 1} = {'Coca', 15, 0};
bebidas{2, 1} = {'Cerveza', 30, 5};
bebidas{3, 1} = {'Fernet', 75, 40};
bebidas{3, 1}{1}(1:4);

%booleanos
flag = true;
if flag
    display('Se ejecutó esta parte del código')
else
    display('El valor de flag es falso') 
end



%function handle
f1 = figure;
f2 = figure;
f3 = figure;

figure(f1);
set(f1, "Name", 'Primera figura', 'Position', [50 100 400 300]);
set(f2, 'Color', [0.5, 0.1, 0.2])
plot(1:10);