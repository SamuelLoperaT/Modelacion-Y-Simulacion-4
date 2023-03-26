%%%%%% Taller 1 %%%%%%%
m = 4; % Número de filas de la primera matriz
n = 5; % Número de filas de la segunda matriz
k = 7; % Numero de columnas de la primera y segunda matriz
numinf = -5; % Número min
numsup = 5; % Número Max
a = rand(m,k)*(numsup-numinf)+numinf; % Primera matriz generada con números aleatorios 
b = rand(k,n)*(numsup-numinf)+numinf; % Segunda matriz generada con números aleatorios 
vec = zeros(k,1); % Vector que guarada las multiplicaciónes de la matirz 
Respr = zeros(m,n);
Respn = zeros(m,n);
RespnO = Respn;
ResprO = Respr;

%%%%%%%%%% multiplicación normal de matrices %%%%%%%%%%%%

for i=1:m
    for j= 1:n
        for p =1:k
            Respn(i,j)=Respn(i,j)+a(i,p)*b(p,j);
        end
    end 
end

%%%%%%%%%%%%%% multiplicación robusta de matrices %%%%%%%%%%%%%%%%%%%
for i=1:m
    for j= 1:n
        for p =1:k
            vec(p)=a(i,p)*b(p,j);
        end
        Respr(i,j) = k*quantile(vec,0.5);
    end
end
%%%%%%%%%%%%%% Modificación de un elemento con outlier %%%%%%%%%%%%%%%%%%%

a(1,1) = numsup*10;
b(n,k) = numsup*20;

%%%%%%%%%%%%%% Multiplicación de matrices con outlier %%%%%%%%%%%%%%%%%%%
for i=1:m
    for j= 1:n
        for p =1:k
            RespnO(i,j)=RespnO(i,j)+a(i,p)*b(p,j);
        end
    end
end
%%%%%%%%%%%%%% Multiplicación de matrices robusta con outlier %%%%%%%%%%%%%%%%%%%
for i=1:m
    for j= 1:n
        for p =1:k
            vec(p)=a(i,p)*b(p,j);
        end
        ResprO(i,j) = k*quantile(vec,0.5);
    end
end
disp("Multiplicación de matrices normales");
disp(Respn);
disp("Multiplicación de matrices normales con outlier");
disp(RespnO);
disp("Multiplicación de matrices robustas");
disp(Respr);
disp("Multiplicación de matrices robustas con outlier");
disp(ResprO);

%%%%%%%% Probar que para cualquier matriz A, A ∗ AT es semidefinida positiva (punto 5) %%%%

l = 4;
Matriz = rand(l,l)*(numsup-numinf)+numinf;
Matrizsim = Matriz*Matriz';   
VecProp = eig(Matrizsim);
disp("Matriz");
disp(Matrizsim);
disp("eigen valores");
disp(VecProp);

%%%%%%%%%%%%%%% Generación de números aleatorios que conserve la covarianza %%%%%%%%%%%%%%%
hh = 6;
media = rand(hh,1)*(numsup-numinf)+numinf;
sigma = (1-0.5*rand(hh,hh))*(numsup-numinf);
sigma = sigma*sigma';
simcov = mvnrnd(media,sigma,10);

disp("Números que conservan la covarianza");
disp(simcov);

























