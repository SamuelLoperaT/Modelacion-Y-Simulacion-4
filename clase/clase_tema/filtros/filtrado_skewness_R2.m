 %% Ejersicio
    % generar n vectores en una circurferencia euclidea
    % proyectar datos sobre cada vector
    % calcular la asimetria sobre los datos
    % identificar vector con maxima asimetria 
    % identificar datos raros bajo este vector
    % graficar identificando datos raros 
    
    % generar datos
        % dsitribucion objetivo 
        x1 = randn(1000,2);
        % ruido
        x2 = [3 -3]+ randn(100,2);
        % concatenacion
        data03 = [x1
                    x2];
        %grafica de los datos generados
        %plot(data03(:,1),data03(:,2),'o')

    % generar n vectores en una circurferencia euclidea
        % espacio de linea de 
        % direcciones de los vectores
        theta = 0 : 0.01 : 2*pi;
        % componenete en x de cada angulo
        x = cos(theta);
        % componenete en y de cada angulo
        y = sin(theta);
        % fomacion de los vectores mendiante la 
        % concatenacion de los componentes
        vect = [x
                y];
        % grafica de los vectores
        %plot(x,y,'.')

    % proyeccino de los datos sobre cada vector
        % prouducto punto dato y vecto resulta
        % en la projeccion de datos en cada vector
        Proj_data = data03*vect;
        % vector de asimetrias de cada projeccion
        CA_vect = skewness(Proj_data);

    % identificar vector con maxima asimetria 
        % ubicacion de la projecion con la mayor asimetria
        I = find(abs(CA_vect) == max(abs(CA_vect)));
        % datos en la proyeccion con mayor asimetria
        Max_proj_data = Proj_data(:,I);
        % grafica de los datos projectados con la 
        % mayor asimetria
        % hist(Max_proj_data)
        % boxplot(Max_proj_data)

    
    % identificar datos raros bajo este vector*
        % rango interquiartil: Q3 - Q1
        RI = iqr(Max_proj_data);
        % 3er cuartil
        Q3 = prctile(Max_proj_data,75);
        % valor del bigote superior
        BS = Q3 + 1.5*RI;
    
        % ubiccacion de todos los puntos mayores al
        % bigote superior
        I2  = find(Max_proj_data > BS);
    % *parte superior

    % graficar identificando datos raros 
        plot(data03(:,1),data03(:,2),'o')
        hold on
        plot(data03(I2,1),data03(I2,2),'or')