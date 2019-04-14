function An_Prob = anomoly(x_anomaly)

x_anamoly_mean=mean(x_anomaly);
x_anomaly_std=std(x_anomaly);
 
 for an=1:18
     A(1,an)=normpdf(x_anomaly(1,an),x_anamoly_mean(1,an),x_anomaly_std(1,an));
 end
An_Prob = prod(A);

end
