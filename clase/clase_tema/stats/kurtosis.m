% kurtosis
    % alta curtosis: es mucho a puntadimto
    % en otras para datos raros extremos
    % baja kurotsis se drealaciona con la bimodalidad 
    % o  mixtura de variables aleatorias (poblaciones)
    %
    % se toma como referente el tres, es decir
    % si k > 3: alta kurtosis
    % si k < 3: baja kurtosis

    x01 = randn(1000,2);
    x02 = 5 + randn(1000,2);
    x = [x02 
         x01];
    figure
    hist(x)
    k = kurtosis(x)
    
    

 