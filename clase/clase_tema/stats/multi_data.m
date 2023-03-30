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

    data01 = [sub_data01; sub_data02; sub_data03];


    plot(data01(:,1), data01(:,2), '.')
    
    trim20_mean = trimmean(data01,20)
    average = mean(data01)
    median_trim_mean = trimmean(data01,99)
    meadian = median(data01)