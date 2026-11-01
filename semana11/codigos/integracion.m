clc
close all

h = 0.001; %paso
t = 0.1:h:3;
ft = exp(cos(-1./t.^2));
%{
Las partes más fáciles para integrar esta función
es desde 0.5 hacia adelante. Aunque cumple con
las condiciones de integrabilidad (según las condiciones
de Riemann), numéricamente es difícil resolverlo.
Las partes problemáticas son las oscilaciones que tiene
al principio
%}

% plot(t, ft, 'r')


%Podemos usar el método Simpson o del trapecio

function S = trapecio(func, h)
    %{
    func : función a encontrar la integral
    h : paso de integración
    %}
    S = h/2*(func(1) + 2*sum(func(2:end-1)) + func(end));
end


function S = simpson(func, h)
    A = h/3*(func(1) + func(end));
    n = length(func);
    for i = 2:1:n-1
        if mod(i, 2) == 0
            A = A + h/3*4*func(i);
        else
            A = A + h/3*2*func(i);
        end
    end
    S = A;
end


ft_trapecio = trapecio(ft, h);
ft_simpson = simpson(ft, h);
ft_matlab = integral(@(t) exp(cos(-1./t.^2)), 0.1, 3);


%%

%Mediante una ecuación diferencial

function [df] = f21(t, y)
    df = exp(cos(-1./t.^2));
end

opts = odeset('RelTol',1e-7,'AbsTol',1e-4);
%Si agrego el opts mejora la precisión
%https://la.mathworks.com/help/matlab/ref/ode45.html?s_tid=ta_help_results
%Primer Método
[T1, Y1] = ode45(@f21, [0.1, 3], 0.1, opts);
ft_ode45 = Y1(end) - Y1(1);

%Segundo método
[T2, Y2] = ode15s(@f21, [0.1, 3], 0.1, opts);
ft_ode15 = Y2(end) - Y2(1);

%Tercer método
[T3, Y3] = ode23s(@f21, [0.1, 3], 0.1, opts);
ft_ode23 = Y3(end) - Y3(1);


%%

% Ecuación diferencial.
f = @(t, x) -x.^2;

% Podés conservar tus propias opciones si ya definiste opts.
opts = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);

% Solución con condición inicial x(-10) = 1.
[time, xt] = ode23(f, [-10, 15], 1, opts);

%--------------------------------------------------
% 1. Cuadrícula donde dibujaremos las flechas.
%--------------------------------------------------
t_campo = -10:1:15;
x_campo = -2:0.2:2;

[T, X] = meshgrid(t_campo, x_campo);

%--------------------------------------------------
% 2. Componentes del campo: (1, f(t,x)).
%--------------------------------------------------
U = ones(size(T));    % Componente horizontal.
V = f(T, X);         % Componente vertical: -X.^2.

% Normalizar sin cambiar la dirección de las flechas.
L = sqrt(U.^2 + V.^2);

U = U ./ L;
V = V ./ L;

%--------------------------------------------------
% 3. Campo de pendientes y solución.
%--------------------------------------------------
figure('Position', [100, 100, 1100, 500]);

quiver(T, X, U, V, 0.5, ...
    'Color', [0.6, 0.6, 0.6], ...
    'DisplayName', 'Campo de pendientes');

hold on;

plot(time, xt, 'r', ...
    'LineWidth', 2, ...
    'DisplayName', 'Solución: x(-10) = 1');

plot(time(1), xt(1), 'ko', ...
    'MarkerFaceColor', 'k', ...
    'DisplayName', 'Condición inicial');

yline(0, 'k--', ...
    'DisplayName', 'Equilibrio: x = 0');

xlabel('t');
ylabel('x');
title('Campo de pendientes de dx/dt = -x^2');

xlim([-10, 15]);
ylim([-2, 2]);

grid on;
legend('Location', 'best');
hold off;


%%
syms x z a
f = 3*a+x;
int_f = int(f, a); %Integra con respecto a x si no pongo nada
g = x / (1+z^2);
int_g_x = int(g, x);
int_g_z = int(g, z);

h = exp(x^2);
int_h = int(h);