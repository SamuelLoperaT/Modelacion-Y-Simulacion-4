%% sim 2
    % genracion de datos sinteticos X~Norm(0,1)
    data02 = randn(1000,2);

    % vector unitario con angulo 45° en R^2
    unit_vect = [sqrt(2)/2
                sqrt(2)/2];
    % sigma: covariance matrix 
    sigma = cov(data02);
    % proyeccion de los datos en el vector definido
    data02_proj = data02*unit_vect;
    
    % varianza total de los datos apartir de la 
    % matriz de covarianza
    var_data02 =  unit_vect'*sigma*unit_vect

    % varianza total de los datos proyectados
    sample_var_data02 = var(data02_proj)