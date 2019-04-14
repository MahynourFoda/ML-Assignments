clc
clear all

ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
[r,c]=size(T);

x= T{:,4:21};

Corr_x=corr(x);

%  Before running PCA, it is important to first normalize X
[x_norm, mu, sigma] = featureNormalize(x);

[m,n]=size(x_norm);
%-------------------------------------------
% PCA
%-------------------------------------------
% PCA conv matrix 
x_cov=cov(x_norm);

[U,S,V]= svd(x_cov);
%[nxn]=[18x18]
%------------------
%get min k

for k=1:18
alpha=sum(diag(S(1:k,1:k)))/sum(diag(S));
if(alpha>=0.999)
    break;
end
end
k  
%%Dimensionality Reduction
U_reduce = U(:,[1:k]);
%R=x_norm * U_reduce;
R=U_reduce'*x_norm';
size(R);

%%Recover x
x_approx=(U_reduce*R)';
size(x_approx);

%-------------------------------------------
%Projection Error
%-------------------------------------------
Projection_Error=0;
for i=1:m
Projection_Error= Projection_Error+ (1/m)*sum((x_norm(i,:)-x_approx(i,:)).^2) ;
end
Projection_Error
%-------------------------------------------
%Linear Regression
%-------------------------------------------
Y= T{:,3}; 
[Y_norm, muY, sigmaY] = featureNormalize(Y);

mY=length(Y);

X_LG=[ones(mY,1) R'];

[J,theta]=LR(X_LG,Y_norm);  
plot(J);

%-------------------------------------------
%%Clustering
%-------------------------------------------
X_cluster = x_norm;
TotalDistanceK = zeros(1,8);
for K=1:8


centroids = initCentroids(X_cluster, K);
for i=1:100
[idx, TotalDistanceK(1,K)] = getClosestCentroids(X_cluster, centroids);

centroids = computeCentroids(X_cluster, idx, K);

end
[idx, TotalDistanceK(1,K)] = getClosestCentroids(X_cluster, centroids);
end

%k = min(TotalDistanceK)
TotalDistanceK
%-------------------------------------------
%%Anomoly
%-------------------------------------------


 x_anomaly=x_norm;
 An_Prob = anomoly(x_anomaly)

