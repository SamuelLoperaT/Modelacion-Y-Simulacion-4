%% sim 2 
    % malla 100 datos de 0 a 2*pi
    x = linspace(0,2*pi,100);
    y = sin(3*x) + 0.5 * randn(1,100);
    plot(x,y,'.')
    crrelation = corr(x',y')