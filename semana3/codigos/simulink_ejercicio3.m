mod = sim("Curso_Matlab\semana3\mod_mal.slx");   
data = mod.yout.extractTimetable;
vec = [data.Time, data.Data];
plot(vec(:, 1), vec(:, 2))
