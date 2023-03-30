%% sim01
    data01 = data10(:,[1,2]);
    
    dist_mahal = mahal(data01,data01);
    
    p90 = prctile(dist_mahal, 90);
    
    I = find(dist_mahal<p90);
    
    plot(data01(:,1),data01(:,2),'.')
    hold on 
    plot(data01(I,1),data01(I,2),'.')

%% sim02
    data02 = data5;
    
    cov_data = cov(data02);

    inv_cov_data = inv(cov_data);

    diag_cov_data = diag(cov_data);

    diag_inv_cov_data = diag(inv_cov_data);
    
    R = 1 - (1./(diag_cov_data.*diag_inv_cov_data))