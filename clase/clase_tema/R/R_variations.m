%% R
    data01 = data5;
    
    cov_data = cov(data01);
    
    inv_cov_data = inv(cov_data);
    
    diag_cov_data = diag(cov_data);
    
    diag_inv_cov_data = diag(inv_cov_data);
    
    R = 1 - (1./(diag_cov_data.*diag_inv_cov_data))
    
%% R-mahal
    data01 = data5;

    dist_mahal = mahal(data01,data01);
    
    p90 = prctile(dist_mahal, 90);
    
    I = find(dist_mahal<p90);
    
    data02 = data01(I,:);

    cov_data = cov(data02);
    
    inv_cov_data = inv(cov_data);
    
    diag_cov_data = diag(cov_data);
    
    diag_inv_cov_data = diag(inv_cov_data);
    
    R_mahal = 1 - (1./(diag_cov_data.*diag_inv_cov_data))

%% R-euclidea
    data01 = data5;
    [m, n] = size(data01);
    
    for j = 1:m
        dist_eucl(j) = norm(data01(j,:),2);
    end
    
    p90 = prctile(dist_eucl, 90);
    
    I = find(dist_eucl<p90);
    
    data02 = data01(I,:);

    cov_data = cov(data02);
    
    inv_cov_data = inv(cov_data);
    
    diag_cov_data = diag(cov_data);
    
    diag_inv_cov_data = diag(inv_cov_data);
    
    R_eucl = 1 - (1./(diag_cov_data.*diag_inv_cov_data))