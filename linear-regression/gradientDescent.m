function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


% % matrix method
%     h = X * theta;
%     errVect = h - y;
%     change = (X' * errVect)*(alpha/m);
    
%     theta = theta - change;
%     J_history(iter) = computeCost(X, y, theta);

% iterative method

    % ok - calculate current cost value 
    currentCost = computeCost(X, y, theta);
    % ok - display cost value and theta values
    % disp(sprintf('current cost: %0.2f, theta0=%0.5f, theta1=%0.5f', currentCost, theta(1), theta(2)));

    sum1 = 0;
    sum2 = 0;
    for i=1:m
        currentRow = X(i,:);
        partialErr = currentRow(1)*theta(1) + currentRow(2)*theta(2) - y(i);
        sum1 = sum1 + partialErr;
        sum2 = sum2 + partialErr*currentRow(2);

        % partialSum1 = (currentRow(1)*theta(1) + currentRow(2)*theta(2)) - y(i);
        % partialSum2 = partialSum1 * currentRow(2);
        % sum1 = sum1 + partialSum1;
        % sum2 = sum2 + partialSum2;

    end;

    theta(1) = theta(1) - (alpha/m) * sum1;
    theta(2) = theta(2) - (alpha/m) * sum2;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = currentCost;

% end

end
