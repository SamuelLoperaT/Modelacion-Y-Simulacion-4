% plot data in sctter plot matrix 

plotmatrix(data5)

% construction of a indicatior

    % covariance matrix
        C = cov(data5);
        CI = inv(C);
        % inverse of C
        diag_matrix = diag(C); 
        % diagonal of C
        diag_inverse = diag(CI); 
        % diagonal of inverse C
        R_ind = 1-1./(diag_matrix.*diag_inverse);
        % indicator
        disp(R_ind)

