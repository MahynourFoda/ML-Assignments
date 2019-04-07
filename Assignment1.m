
data = tabularTextDatastore('house_data_complete.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
featuers=read(data);
%Read featuers
x1=table2array(featuers(1:15000,4));
x2=table2array(featuers(1:15000,5));
x3=table2array(featuers(1:15000,6));
x4=table2array(featuers(1:15000,7));
x0=ones(15000,1);

%Normalize featuers
x1_norm=x1/max(x1);
x2_norm=x2/max(x2);
x3_norm=x3/max(x3);
x4_norm=x4/max(x4);

X=[x0 x1_norm x2_norm x3_norm x4_norm];
%
y=table2array(featuers(1:15000,3));
y_norm=y/max(y);



%1st hypo.
[J,Thetas]=Regression(X,y_norm,1);
%2nd hypo.
[J1,Thetas1]=Regression(X,y_norm,2);
%3rd hypo.
[J2,Thetas2]=Regression(X,y_norm,3);
%4th hypo.
[J3,Thetas3]=Regression(X,y_norm,4);
figure(1)
plot(J);
figure(2)
plot(J1);
figure(3)
plot(J2);
figure(4)
plot(J3);

normalequation(X,y_norm)