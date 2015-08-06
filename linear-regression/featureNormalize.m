function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2)); % 1 row 2 cols
sigma = zeros(1, size(X, 2)); % 1 row 2 cols

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

houseAvg = mean(X)(:,1);
stdDevHousePrices = std(X(:,1));
housePricesNormalized = (X(:,1) .- houseAvg)./stdDevHousePrices;

bedromAvg = mean(X)(:,2);
stdDeviationBedrooms = std(X(:,2));
bedroomsNormalized = (X(:,2) .- bedromAvg)./stdDeviationBedrooms;


mu = [houseAvg bedromAvg];
sigma = [stdDevHousePrices stdDeviationBedrooms];
% X_norm = bsxfun(@rdivide, bsxfun(@minus, X, mu), sigma);

X_norm = [housePricesNormalized bedroomsNormalized];
% disp(X_norm);
% disp(sprintf('%0.2f \t %0.2f\n',X_norm(:,1),X_norm(:,2)));
% disp(sprintf('%0.2f \t %0.2f \n', housePricesNormalized, bedroomsNormalized))

% ============================================================

end
