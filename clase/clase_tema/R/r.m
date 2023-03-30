data01 = data5;

% covariance matrix
C = cov(data01);
CI = inv(C);
% inverse of C
diag_matrix = diag(C); 
% diagonal of C
diag_inverse = diag(CI); 
% diagonal of inverse C

% indicador que representa la proporción de variabilidad, 
% en un modelo lineal, explicada por las otras variables.
R_ind = 1-1./(diag_matrix.*diag_inverse)

