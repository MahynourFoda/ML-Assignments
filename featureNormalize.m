
function [x_norm, mu, sigma] = featureNormalize(x)

mu = mean(x);
x_norm = bsxfun(@minus, x, mu);

sigma = std(x_norm);
x_norm = bsxfun(@rdivide, x_norm, sigma);

end