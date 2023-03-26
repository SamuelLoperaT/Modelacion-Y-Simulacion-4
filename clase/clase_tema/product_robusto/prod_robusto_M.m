%% Taller 1
m = 4; % Número de filas de la primera matriz
n = 5; % Número de filas de la segunda matriz
k = 7; % Numero de columnas de la primera y segunda matriz
a = rand(m,k)*(numsup-numinf)+numinf; % Primera matriz generada con números aleatorios 
b = rand(k,n)*(numsup-numinf)+numinf; % Segunda matriz generada con números aleatorios 
vec = zeros(k,1); % Vector que guarada las multiplicaciónes de la matirz 
Respr = zeros(m,n);

%% multiplicación robusta de matrices
for i=1:m
    for j= 1:n
        for p =1:k
            vec(p)=a(i,p)*b(p,j);
        end
        Respr(i,j) = k*quantile(vec,0.5);
    end
end