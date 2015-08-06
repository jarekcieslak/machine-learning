function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% I have prepared two methods for calculating cost
% first one is iterative - it creates a loop over each sample from the sample set
% and sums up costs
% second one is based on matrix multiplication.
% comment proper method. They should return same result.



% iterative method
% sum = 0;
% for i=1:m,
% 	% get i-th row from the X matrix eg. [1 5.11] and transpose it
% 	% to create vector
% 	tempX = X(i,:)';
% 
% 	% calculate intermediate hypothesis value
% 	tempHypothesisValue = (theta'*tempX);
% 
% 	% calculate temporary hypothesis and outcome squared difference 
% 	% and add it to the sum
% 	tempVal = (tempHypothesisValue - y(i))^2;
% 	sum = sum + (tempHypothesisValue - y(i))^2;
% end
% 
% calculate cost funciton output	
% J = (1/(2*m)) * sum;


% matrix multiply method. I have no idea why sum(costMatrix) doesn't work...
costMatrix = (((X*theta).-y).^2);
totalCost = 0;
for j=1:length(costMatrix)
	totalCost = totalCost + costMatrix(j);
end;

% disp('Matrix multiplication method cost:');
J = totalCost/(2*m);
% =========================================================================

end
