function simulated_data = simularData(original_data, N, k)
    % Simulate Data
    % Inputs: original_data - k x 1 matrix of initial data
    %         N - number of data points to simulate
    %         k - number of initial data points
    % Output: simulated_data - N x 1 matrix of simulated data
    
    % Initialize the simulated data with the original data
    simulated_data = original_data;
    
    % Generate N-k additional data points
    for i = k+1:N
        % Use a random number generator to simulate new data points
        simulated_data(i) = simulated_data(i-k) + randn();
    end
end