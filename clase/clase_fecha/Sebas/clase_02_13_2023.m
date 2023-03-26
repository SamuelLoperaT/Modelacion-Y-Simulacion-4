% sim 1
    data01 = randn(1000,1);
    hist(data01)
    % coeficiente de asimetria 
    A = skewness(data01) 
    % centro de masa
    x_bar = mean(data01) 
    % punto que divide el area em dos
    data01_median = median(data01) 

% sim 2
    data02 = log(rand(1000,1))
    hist(data02)
    A = skewness(data02) 
    x_bar = mean(data02) % centro de masa
    data01_median = median(data02)

% kurtosis
    % alta curtosis: es mucho a puntadimto
    % en otras para datos raros extremos
    % baja kurotsis se drealaciona con la bimodalidad 
    % o  mixtura de variables aleatorias (poblaciones)
    %
    % se toma como referente el tres, es decir
    % si k > 3: alta kurtosis
    % si k < 3: baja kurtosis

    x01 = randn(1000,1);
    x02 = 5 + randn(1000,1);
    x = [x02 
         x01];
    hist(x)
    k = kurtosis(x)

    G = kmeans(x,2);
    aux = sum(G == 1)
    plot(x)

% box plot
    data03 = -log(rand(1000,1));
    boxplot(data03,'Orientation','horizontal')

    Q1 = prctile(data03,25);
    Q3 = prctile(data03,75);

    RI = Q3 - Q1;
    BI = Q1 - 1.5*RI;
    BS = Q3 + 1.5*RI;
    OS = find(data03 > BS)
    OI = find(data03 < BI)

    data03(OS) =[]
    boxplot(data03,'Orientation','horizontal')




