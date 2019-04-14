function centroids = computeCentroids(X, idx, K)

  [m n] = size(X);
  centroids = zeros(K, n);
  
for i = 1:K
      idx_i = find(idx==i);       %indexes of all the input which belongs to cluster j
      centroids(i,:) = mean(X(idx_i,:)); % calculating mean using built-in function
end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end