%% sim 1
    % genracion de datos sinteticos X~Norm(0,1)
    data01 = randn(100,5);
    % tamaño de los datos
    [n, k] = size(data01);
    % matriz para centrar los datos
    P = eye(n)-ones(n)/n;
    % datos centados
    center_data01 = P * data01;
%% sim 2
    % genracion de datos sinteticos X~Norm(0,1)
    data02 = randn(1000,2);

    % vector unitario con angulo 45° en R^2
    unit_vect = [sqrt(2)/2
                sqrt(2)/2];
    
    % proyeccion de los datos en el vector definido
    data02_proj = data02*unit_vect;
    
    % varianza total de los datos apartir de la 
    % matriz de covarianza
    var_data02 =  unit_vect'*sigma*unit_vect;

    % varianza total de los datos proyectados
    sample_var_data02 = var(data02_proj);

%% sim 3 
    % genracion de datos sinteticos X~Norm(0,1)
    data03 = randn(10000,5);

     % Scatter plot matrix de los datos
    plotmatrix(data03)

    % matriz de covarianza
    sigma = cov(data03);

    % autovectores y autovalores de la matriz de covarianza
    [eig_vect, eig_value] = eig(sigma);
   
    % proporcion la varianza total de cada autovalor
    disp(diag(eig_value)/sum(diag(eig_value)))

