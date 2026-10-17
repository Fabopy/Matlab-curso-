% frecuencia natural no amortiguada
w = 3;

% %factor de amortiguamiento relativo
% z = 0.4;


%Nombre del archivo
mdl = "Curso_Matlab\semana4\mod_08.slx";
t_sim = '5'; %tiempo de ejecución
% mod = sim(mdl, "StopTime", t_sim);

for i = 1:4
    switch i
        case 1
            z = 3;
        case 2 
            z = 0.6;
        case 3
            z = -0.4;
        case 4 
            z = -2;
    end
    %atenuación
    o = z*w;
    mod = sim(mdl, 'StopTime', t_sim);

    %función transferencia
    num = [w^2];
    den = [1 2*o w^2];
    G = tf(num, den);
    display(G)
    disp(['Polos del sistema', num2str(i)])
    polos_G = pole(G)
        
    % extraigo los datos del simulink
    data = mod.yout.extractTimetable;
    t = data.Data; x = data.Data_1; y = data.Data_2;

    subplot(2, 2, i)
    plot(t, y)
    title("z = " + z)
end

%%
syms s t omega_n zeta
w = 3;
Gs(zeta, omega_n) = omega_n^2 / (s^2 + 2*zeta*omega_n*s + omega_n^2);
Rs = 1/s; %entrada escalón

ilaplace(Gs(-2, w)*Rs, s, t)










