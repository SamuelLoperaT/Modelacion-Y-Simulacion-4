function robust_product = ProductoRobustoMatrices (A,B)
    % Robust Matrix Product
    % Inputs: A,B - matrices
    % Output: robust_product - robust product of A and B
    
    % Calculate the SVD of A and B
    [Ua,Sa,Va] = svd(A);
    [Ub,Sb,Vb] = svd(B);
    
    % Calculate the pseudoinverse of Sa and Sb
    Sa_pinv = diag(1./diag(Sa));
    Sa_pinv(isinf(Sa_pinv)) = 0;
    Sb_pinv = diag(1./diag(Sb));
    Sb_pinv(isinf(Sb_pinv)) = 0;
    
    % Calculate the robust product
    robust_product = Ua*Sa_pinv*Ub'*Sb_pinv*Va*Vb';
    
    % Analysis of robustness
    singular_values = svd(robust_product);
    condition_number = max(singular_values)/min(singular_values);
    disp(['Condition number of the robust product: ',num2str(condition_number)]);
end