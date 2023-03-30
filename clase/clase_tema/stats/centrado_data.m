%% sim 1
    % genracion de datos sinteticos X~Norm(0,1)
    data01 = 2 + randn(100,2);
    % tamaño de los datos
    [n, k] = size(data01);
    % matriz para centrar los datos
    P = eye(n)-ones(n)/n;
    % datos centados
    center_data01 = P * data01;
    plot(data01(:,1), data01(:,2),'.')
    hold on
    plot(center_data01(:,1), center_data01(:,2),'.')