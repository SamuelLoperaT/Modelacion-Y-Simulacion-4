% conusltar metodo de la transformada inversa
% consultar copula empirica
% consultar copula producto
% funcion copula
% teoria de copulas
% tarea
% proyecciones maxima simetria y maxima kurtosis
% copula de intedendnecia

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

%% sim 2 
    % malla 100 datos de 0 a 2*pi
    x = linspace(0,2*pi,100);
    y = sin(3*x) + 0.5 * randn(1,100);
    plot(x,y)
    corr(x',y')

%% sim 3 
    sub01_data03 = randn(1000,2);
    sub02_data03 = 10 + randn(800,2);
    data03 = [sub01_data03
        sub02_data03];
    
    corr(data03(:,1),data03(:,2))

    emp_data03_x = ecdf(data03(:,1));
    emp_data03_y = ecdf(sub02_data03(:,2));
    size(emp_data03_y)
    size(emp_data03_y)
    plot(emp_data03_x,emp_data03_y,'o')
    