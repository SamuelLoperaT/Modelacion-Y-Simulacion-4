%% sim 1
    % empirica aproximacion a distribucion
    % M.A.S. de X ~ Exp(1)
    data01 = -log(rand(1000,1));
    min_data01 = min(data01);
    max_data01 = max(data01);
    % malla de el minimo al maximo en aumentos de 0.1 
    line_space = min_data01 : 0.1 : max_data01;
    % exponencial teorica en la malla
    teo_exp = expcdf(line_space);
    % grafica de la exponecial teorica
    plot(line_space,teo_exp)
    hold on
    % grafica de la empirica de los datos
    ecdf(data01);