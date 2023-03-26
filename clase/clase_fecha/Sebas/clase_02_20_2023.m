%% sim 1
    mu01 = [2 2];
    std01 = [1 0.9
           0.9 1];
    sub_data01 = mvnrnd(mu01, std01, 10000);

    mu02 = [1 5];
    std02 = [0.1 0
           0 0.1];
    sub_data02 = mvnrnd(mu02, std02, 2000);

    mu03 = [4 -2];
    std03 = [0.1 0
           0 0.1];
    sub_data03 = mvnrnd(mu03, std03, 2000);

    data01 = [sub_data01
              sub_data02
              sub_data03];


    plot(data01(:,1), data01(:,2), '.')
    
    [trimmean(data01,20)
    mean(data01)
    trimmean(data01,99)
    median(data01)]

%% sim 2
    data02 = 500 + 100 * randn(10000,1);
    
    for  i = 0:1:1000
        data02_noise(5) = i + data02_noise(5);

    end

 %% sim 3
    data03 = exprnd(5,1000,1);
    sorted_data03 = sort(data03);
    % noise = 
    exp_dist = expcdf(sorted_data03,5);
    plot(sorted_data03,exp_dist)
    hold on
    ecdf(data03)


 



    