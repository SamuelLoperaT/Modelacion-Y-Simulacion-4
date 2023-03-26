function [freq_table,org_stats_table ,freq_stats_table,sim_data,sim_stats_table,Histograms,Graphics] = stats(data, num_bins,data_quant,histmode)
    data = data(:); % Convierte los datos a un vector columna, para que se puedan procesar datos nxm-dimensionales
    %Estadisticos Originales
    org_mean_val = mean(data);
    org_median_val = prctile(data,50);
    org_mode_val = mode(data);
    org_std_val = std(data);
    org_1stQuartile_val = prctile(data,25);
    org_3rdQuartile_val = prctile(data,75);
    org_kurtosis_val = kurtosis(data); %Kurtosis Original
    org_skewness_val = skewness(data); %Asimetria Original
    freq_stats = [org_mean_val org_std_val org_1stQuartile_val org_median_val org_3rdQuartile_val org_skewness_val org_kurtosis_val];
    org_stats_table = array2table(freq_stats,"VariableNames",["Media" "Desviacion_Estandar" "1er_Cuartil" "Mediana_(2do_Cuartil)" "3er_Cuartil" "Asimetria" "Kurtosis"]);
    %Variables Necesarias para la Tabla de Frecuencia
    
    min_data = min(data);
    max_data = max(data);
    num_bins = ceil(num_bins); %toma en cuenta reglas de seleccion como la regla de sturges o raiz cuadrada; toma el entero superior mas cercano
    bin_width = (max_data - min_data) / num_bins; % Tamaño (Amplitud) de las clas
    bins = min_data:bin_width:max_data; % Bordes de las clases
    freq_table = zeros(num_bins, 7); % Inicializa la tabla de frecuencia en ceros
    

    %Creacion de la Tabla de Frecuencia
    for i = 1:num_bins
        bin_indices = (data >= bins(i)) & (data < bins(i + 1)); % Indices para la clase Actual
        freq_table(i, 1) = bins(i);
        freq_table(i, 2) = bins(i+1);
        freq_table(i, 3) = (bins(i) + bins(i + 1)) / 2; % Marca de Clase (Naive, dato de la mitad)
        freq_table(i, 4) = sum(bin_indices); % Frecuencia Absoluta
    end
    
    %Estadisticos de los datos originales(tabla)
    [~, max_index] = max(freq_table(:,2)); % indice de la clase con la mayor frecuencia/Densidad
    freq_mode_val = freq_table(max_index, 1); %  Moda
    
    sorted_data = sort(data); % Organiza la data
    
    n = length(data);
    
    %Mediana
    if mod(n, 2) == 1 %Caso Impar
        median_index = (n + 1) / 2;
        freq_median_val = sorted_data(median_index);
    else
        median_index_1 = n / 2; %Caso Par
        median_index_2 = median_index_1 + 1;
        freq_median_val = (sorted_data(median_index_1) + sorted_data(median_index_2)) / 2;
    end
  
    
    freq_table(:, 5) = freq_table(:, 4) / n; % Frecuencia Relativa
    freq_table(:, 6) = cumsum(freq_table(:, 4)); % Frecuencia Absoluta Acumulada
    freq_table(:, 7) = freq_table(:, 6) / n; % Frecuencia Relativa Acumulada (debido al error de punto flotante, puede retornar valores muy cercanos a 0 en la suma total, normal)
  
    freq_table = array2table(freq_table, 'VariableNames', {'Limite_Inferior','Limite_Superior','Marca_De_Clase', 'Frecuencia_Absoluta', 'Frecuencia_Relativa', 'Frecuencia_Absoluta_Acumulada', 'Frecuencia_Relativa_Acumulada'});
    
    prcentile_vals = repelem(freq_table.Marca_De_Clase, freq_table.Frecuencia_Absoluta);
    freq_1st_Percentile_val = prctile(prcentile_vals,25);
    freq_3rd_Percentile_val = prctile(prcentile_vals,75);
    freq_mean_val = sum(freq_table.Frecuencia_Absoluta .* freq_table.Marca_De_Clase)/n; %Media Aritmetica/Estimador, Naive
    freq_std_val = sqrt(sum((freq_table.Frecuencia_Absoluta .* (freq_table.Marca_De_Clase-freq_mean_val).^2))/(n-1)); %Desviacion Estandar Muestral, Naive
    freq_skweness_val = skewness(prcentile_vals);
    freq_kurtosis_val = kurtosis(prcentile_vals);
    %Asigna los estadisticos a una tabla, para reducir la cantidad de
    %outputs
    freq_stats = [freq_mean_val freq_std_val freq_1st_Percentile_val freq_median_val freq_3rd_Percentile_val freq_skweness_val freq_kurtosis_val];
    freq_stats_table = array2table(freq_stats,"VariableNames",["Media" "Desviacion_Estandar" "1er_Cuartil" "Mediana_(2do_Cuartil)" "3er_Cuartil" "Asimetria" "Kurtosis"]);
    %determina el modo del histograma, si se debe realizar con los valores
    %de frecuencia relativa (Probabilidad) o si se debe realizar sin
    %normalizar
    if histmode == "abs"
        figure;
        %Crea Histograma con el modo por defecto (Frecuencia Absoluta) y
        %asigna un titulo arbitrario y las marcas de clase como identificadores
        %en el eje x
        Histograms(1) = histogram(data,num_bins);
        xticks(freq_table.Marca_De_Clase)
        title("Data Histogram")
        %Adiciones
        hold on
        grid on
        %grafica la Media, Mediana y la tendencia general de la distribucion
        xline(freq_mean_val,"r","LineWidth",3.5,"Alpha",0.4)
        xline(freq_median_val,"g","LineWidth",0.6)
        plot(freq_table.Marca_De_Clase,freq_table.Frecuencia_Absoluta,"--","Color",[185/255 27/255 140/255])
        %Asigna Leyenda a los tres añadidos anteriores, ignora las barras del
        %histograma
        legend(['' "Media" "Mediana" "Dist"],"Location","eastoutside")
        hold off
    elseif histmode == "prob"
        figure;
        %Crea Histograma con el modo de probabilidad (Frecuencia Relativa) y
        %asigna un titulo arbitrario y las marcas de clase como identificadores
        %en el eje x
        Histograms(1) = histogram(data,num_bins,"Normalization","probability");
        xticks(freq_table.Marca_De_Clase)
        title("Data Histogram")
        %Adiciones
        hold on
        grid on
        %grafica la Media, Mediana y la tendencia general de la distribucion
        xline(freq_mean_val,"r","LineWidth",3.5,"Alpha",0.4)
        xline(freq_median_val,"g","LineWidth",0.6)
        plot(freq_table.Marca_De_Clase,freq_table.Frecuencia_Relativa,"--","Color",[185/255 27/255 140/255])
        %Asigna Leyenda a los tres añadidos anteriores, ignora las barras del
        %histograma
        legend(['' "Media" "Mediana" "Dist"],"Location","eastoutside")
        hold off
    end
    %Simula data sintetica a partir de los datos de la tabla de frecuencia
    sim_data = [];
    for i = 1:num_bins
        sim_data = [sim_data unifrnd(bins(i),bins(i+1),1,ceil(freq_table.Frecuencia_Relativa(i)*data_quant))]; %Warning de complejidad computacional
    end
    %Estadisticos comunes de la data simulada; realizados con las funciones
    %de matlab
    sorted_sim_data = sort(sim_data);
    sim_mode_val = mode(sim_data);
    sim_1st_cuartile_val = prctile(sorted_sim_data,25);
    sim_3rd_cuartile_val = prctile(sorted_sim_data,75);
    sim_median_val = prctile(sorted_sim_data,50);
    sim_mean_val = mean(sim_data);
    sim_std_val = std(sim_data);
    sim_kurtosis_val = kurtosis(sim_data);
    sim_skewness_val = skewness(sim_data);
    
    sim_stats = [sim_mean_val,sim_std_val,sim_1st_cuartile_val,sim_median_val,sim_3rd_cuartile_val,sim_skewness_val,sim_kurtosis_val];
    sim_stats_table = array2table(sim_stats,"VariableNames",["Media" "Desviacion_Estandar" "1er_Cuartil" "Mediana_(2do_Cuartil)" "3er_Cuartil" "Asimetria" "Kurtosis"]);
    
    if histmode == "abs"
        figure;
        %Crea Histograma con el modo por defecto (Frecuencia Absoluta) y
        %asigna un titulo arbitrario y las marcas de clase como identificadores
        %en el eje x
        Histograms(2) = histogram(sim_data,num_bins);
        xticks(freq_table.Marca_De_Clase)
        title("Simulated Data Histogram")
        %Adiciones
        hold on
        grid on
        %grafica la Media, Mediana y la tendencia general de la distribucion
        xline(freq_mean_val,"r","LineWidth",3.5,"Alpha",0.4)
        xline(sim_median_val,"g","LineWidth",0.6)
        xline(sim_1st_cuartile_val,"LineWidth",2,"Color",[1,146/255,0])
        xline(sim_3rd_cuartile_val,"LineWidth",2,"Color",[1,146/255,0])
        %plot(freq_table.Marca_De_Clase,freq_table.Frecuencia_Absoluta,"--","Color",[185/255 27/255 140/255])
        %Asigna Leyenda a los tres añadidos anteriores, ignora las barras del
        %histograma
        legend(['' "Media" "Mediana" "1er Cuartil" "3er Cuartil"],"Location","eastoutside")
        hold off
    elseif histmode == "prob"
        figure;
        %Crea Histograma con el modo de probabilidad (Frecuencia Relativa) y
        %asigna un titulo arbitrario y las marcas de clase como identificadores
        %en el eje x
        Histograms(2) = histogram(sim_data,num_bins,"Normalization","probability");
        xticks(freq_table.Marca_De_Clase)
        title("Simulated Data Histogram")
        %Adiciones
        hold on
        grid on
        %grafica la Media, Mediana y los cuartiles restantes
        xline(sim_mean_val,"r","LineWidth",3.5,"Alpha",0.4)
        xline(sim_median_val,"g","LineWidth",0.6)
        xline(sim_1st_cuartile_val,"g","LineWidth",2,"Color",[1,146/255,0])
        xline(sim_3rd_cuartile_val,"g","LineWidth",2,"Color",[1,146/255,0])
        %plot(freq_table.Marca_De_Clase,freq_table.Frecuencia_Absoluta/sim_n,"--","Color",[185/255 27/255 140/255])
        %Asigna Leyenda a los tres añadidos anteriores, ignora las barras del
        %histograma
        legend(['' "Media" "Mediana" "1er Cuartil" "3er Cuartil"],"Location","eastoutside")
        hold off
    end
    grida = 0.5:0.5:99.5;
    
    org_percentiles = prctile(data,grida);
    sim_percentiles = prctile(sim_data,grida);
    xy = linspace(min(org_percentiles),max(org_percentiles),length(org_percentiles));
    figure;
    Graphics =plot(sim_percentiles,org_percentiles,"b");
    hold on
    title("Percentile vs Percentile")
    plot(xy,xy,"r--")
    xlabel("Percentiles Simulados")
    ylabel("Percentiles Crudos")
    legend(["Percentiles" "y = x"])
    hold off

end