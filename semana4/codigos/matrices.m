v1 = [1 2 3];

v2 = [4; 5; 6];

M1 = [
    1 1 0;
    3 0 7;
    5 4 2
    ];

M2 = [
    0 2 3;
    -1 0 5;
    0 -6 9
    ];

M1*M2;

[V, D] = eig(M1);

[col, fil] = size(v1); 


A = [
    2, log(10), -1
    1, -5, -pi
    sqrt(2), -1, 7
];

B = [2, 4, 6];

if det(A) ~= 0
    X = inv(A)*B';
end


C = zeros(3, 4);
O = ones(7, 4);
E = eye(3, 3);
N = nan(4, 1);
M = magic(5); %es una matriz cuadrado mágico. Si sumo las filas y columnas
%así como la diagonal principal, todas suman lo mismo

for i = 1:length(M)
    filas = M(i, :);
    col = M(:, i);
   display(sum(col)); 
end




%Distribución Gaussiana
G = randn(5000, 1);
% histogram(G, 100);
% writematrix(G, 'distri_gauss.txt', 'Delimiter', 'tab');

% big_matrix = magic(1000);
% b_unos = ones(1000, 1);
% 
% tic,
% inversa = inv(big_matrix)*b_unos;
% ;
% toc 