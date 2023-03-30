%% filtado mediante desviacion estandard
    % simualcion
    data02 = mu + sigma*randn(1000,1);

    % media aretmetica
    xbar = mean(data02);

    %desviacion estandard muestral
    S = std(data02);

    % Z-score
    Z = (data02-xbar)/S;

    % ubicacion de los valores mayores a 3 sigma 
    I1 = find(Z>3);
    % valores mayores a 3 sigma
    O1 = data02(I1);
    % ubicacion de los valores menores a 3 sigma 
    I2 = find(Z<3);
    % valores menores a 3 sigma
    O2 = data02(I2);
    figure
    hist(data02)
    figure
    hist(O2)