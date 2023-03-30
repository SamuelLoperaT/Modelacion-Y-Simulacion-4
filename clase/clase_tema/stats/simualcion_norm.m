% simulacion de datos Norm(mu,sigma^2)
    % parametros
    mu = 3.5;
    sigma = 0.2;
    % simualcion de X~Norm(mu,sigma^2)
    data01 = mu + sigma*randn(1000,1);
    figure
    hist(data01)
    

%% simulacion de datos Norm(0,1)
    % simalacion normal estadar con 3 dimenciones
    data04 = randn(1000,3);
    % grafica 3D
    plot3(data04(:,1),data04(:,2),data04(:,3),'o')