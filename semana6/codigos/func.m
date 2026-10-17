clear all;
%{
Funciones
%}

function raiz_t = raiz(t)
    raiz_t = sqrt(t);
end



function [k, w, z] = prototipo2(a, denom)
    b = denom(1);
    c = denom(2);
    d = denom(3);
    w = sqrt(d/b);
    k = a/b*w^2;
    z = c/(2*w);
end

%{
Para G1: no tiene sobrepaso ya que z = 1 
%}
[k1, w1, z1] = prototipo2(16, [2, 4, 8]); 

%{
Para G2: no tiene sobrepaso ya que z = 2
%}
[k2, w2, z2] = prototipo2(18, [1, 12, 9]); 

%{
Para G3: no tiene sobrepaso ya que z = 1.6016
%}
[k3, w3, z3] = prototipo2(11, [1.7, 6.5, 7]); 
