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
    propor_var = diag(eig_value)/sum(diag(eig_value))