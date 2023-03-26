
n = 10;   % Se establece el numero de Clases
n2 = 10000; % Numero de Datos a Simular

Datos_Crudos = readtable('aguacates2017'); % Lee el archivo de los datos
Datos_Crudos = Datos_Crudos{:,3};
Datos_Crudos = randnDatos_Crudos;
%z=-log(rand(100,1));    % Simula x datos que sigan una logaritmica
%Datos_Crudos =z;

%x1=2+randn(100,1);
%x2=20+randn(50,1);

%Datos_Crudos=[x1
  %  x2];

%Datos_Crudos = sort(Datos_Crudos{:,1});

Cant = length(Datos_Crudos);    % Cantidad de datos ingresados
%Cant = height(Datos_Crudos); 
% Datos Crudos

Est_C(1,1) = "Mean";
Est_C(1,2) = "Median";
Est_C(1,3) = "Var";
Est_C(1,4) = "Std";
Est_C(1,5) = "Mode"; 
Est_C(1,6) = "Min";
Est_C(1,7) = "Max";
Est_C(1,8) = "Quantile1";
Est_C(1,9) = "Quantile2";
Est_C(1,10) = "Quantile3";
Est_C(1,11) = "Kurtosis";

Est_C(2,1) = mean(Datos_Crudos);       % Media
Est_C(2,2) = median(Datos_Crudos);     % Mediana
Est_C(2,3) = var(Datos_Crudos);        % Varianza
Est_C(2,4) = std(Datos_Crudos);        % Desviacion Estandar
Est_C(2,5) = mode(Datos_Crudos);       % Moda  
Est_C(2,6) = min(Datos_Crudos);        % Dato Minimo
Min = min(Datos_Crudos);
Est_C(2,7) = max(Datos_Crudos);        % Dato Maximo
Max = max(Datos_Crudos);
Est_C(2,8) = quantile(Datos_Crudos,0.25);  % Cuartil 1
Est_C(2,9) = quantile(Datos_Crudos,0.50);  % Cuartil 2
Est_C(2,10) = quantile(Datos_Crudos,0.75); % Cuartil 3
Est_C(2,11) = kurtosis(Datos_Crudos);      % Curtosis

%%
% Calculo de Valores para la Tabla de Frecuencias

Int_lenght = (Max-Min)/n; % Longitud del Intervalo

Start = Min;
for c = 1:n                 % Genera los intervalos desde el Dato Minimo 
    Tabla_f(c,1) = Start;   
    End = Start + Int_lenght;
    Tabla_f(c,2) = End;
    Tabla_f(c,3) = (Start+End)/2;   % Marcas de Clase - Tabla
    Start = End;
    
    Tabla_f(c,4)=sum(Datos_Crudos>=Tabla_f(c,1) & Datos_Crudos<Tabla_f(c,2)); % Frecuencia Absoluta
                
    if c == 1
        Tabla_f(c,5) = Tabla_f(c,4); % Caso 1 Frec Acum
        else
            Tabla_f(c,5)= Tabla_f(c-1,5)+Tabla_f(c,4);  % Frecuencia Absoluta Acumulada
    end   
    Tabla_f(c,6) = Tabla_f(c,4)/Cant;   % Frecuencia Relativa
    Tabla_f(c,7) = Tabla_f(c,5)/Cant;   % Frecuencia Relativa Acumulada
    
end
    % y los anade a la tabla de Frecuencias

%%
Mean_T = 0;
flag = 1;
for c = 1:n
    Mean_T = Mean_T + Tabla_f(c,3)*Tabla_f(c,4);    % Media de la Tabla por formula
    if flag==1
        if (Cant/2 >= Tabla_f(c,5) && Cant/2 <= Tabla_f(c+1,5)) % Flag para la  posicion de c
            c2 = c;
            flag = 0;
        end
    end
end
Mean_T = Mean_T/Cant;   % Media de la Tabla por formula

Var_T = 0;
for c = 1:n
    Var_T = Var_T + ((Tabla_f(c,3)-Mean_T)^2)*Tabla_f(c,4); % Varianza de la Tabla por formula
end

Var_T = Var_T/Cant; % Varianza de la Tabla por formula
Std_T = sqrt(Var_T);

Median_T = Tabla_f(c2,1)*((Cant/2)-Tabla_f(c2-1,5))*Int_lenght/Tabla_f(c2,4); % Mediana de la Tabla por formula
%Q1_T = Tabla_f(c2,1)*((Cant*0.75)-Tabla_f(c2-1,5))*Int_lenght/Tabla_f(c2,4); % Cuartil 1 de la Tabla por formula
%Q3_T = Tabla_f(c2,1)*((Cant*0.25)-Tabla_f(c2-1,5))*Int_lenght/Tabla_f(c2,4); % Cuartil 2 de la Tabla por formula


%%
% Estadisticos de la Tabla de Frecuencias

Est_T(1,1) = "Mean";       
Est_T(1,2) = "Median";
Est_T(1,3) = "Var";
Est_T(1,4) = "Std";
Est_T(1,5) = "Mode";
Est_T(1,6) = "Min";
Est_T(1,7) = "Max";
Est_T(1,8) = "Quantile1";
Est_T(1,9) = "Quantile2";
Est_T(1,10) = "Quantile3";
Est_T(1,11) = "Kurtosis";

Est_T(2,1) = Mean_T;   
Est_T(2,2) = Median_T;     
Est_T(2,3) = Var_T;
Est_T(2,4) = Std_T;
Est_T(2,5) = 0;
Est_T(2,6) = Min;
Est_T(2,7) = Max;
%Est_T(2,8) = Q1_T;
Est_T(2,9) = Median_T;
%Est_T(2,10) = Q3_T;
Est_T(2,10) = "";

%%
% Datos Simulados
Simu = [];
for c = 1:n
    Simu = [Simu; Tabla_f(c,1) + (Tabla_f(c,2)-Tabla_f(c,1)).*rand(ceil(n2*Tabla_f(c,6)),1)];
end

% Estadisticos de los Datos Simulados

Est_S(1,1) = "Mean";
Est_S(1,2) = "Median";
Est_S(1,3) = "Var";
Est_S(1,4) = "Std";
Est_S(1,5) = "Mode";
Est_S(1,6) = "Min";
Est_S(1,7) = "Max";
Est_S(1,8) = "Quantile1";
Est_S(1,9) = "Quantile2";
Est_S(1,10) = "Quantile3";
Est_S(1,11) = "Kurtosis";


Est_S(2,1) = mean(Simu);    % Media
Est_S(2,2) = median(Simu);  % Mediana   
Est_S(2,3) = var(Simu);     % Varianza
Est_S(2,4) = std(Simu);     % Desviacion Estandar
Est_S(2,5) = mode(Simu);    % Moda
Est_S(2,6) = min(Simu);     % Minimo
Min = min(Simu);
Est_S(2,7) = max(Simu);     % Maximo
Max = max(Simu);
Est_S(2,8) = quantile(Simu,0.25);   % Cuartil 1
Est_S(2,9) = quantile(Simu,0.50);   % Cuartil 2
Est_S(2,10) = quantile(Simu,0.75);  % Cuartil 3
Est_S(2,11) = kurtosis(Simu);       % Curtosis

%%
% Estadisticos, Tablas, Histogramas y BoxPlot
Est_C;
Est_T;
Est_S;
Tabla_f;
%boxplot(Datos_Crudos);
%hist(Datos_Crudos);
%boxplot(Simu);
%hist(Simu);