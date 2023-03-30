 %% sim 3
    data03 = exprnd(5,1000,1);
    sorted_data03 = sort(data03);
    % noise = 
    exp_dist = expcdf(sorted_data03,5);
    plot(sorted_data03,exp_dist)
    hold on
    ecdf(data03)