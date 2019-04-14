function [J,theta]=LR(X,Y)
Alpha=0.01;
theta=zeros(15,1);
hypothesis=X*theta;
m=length(Y);
rep=200;
for i=1:rep
   hypothesis=X*theta;
   theta=theta-(Alpha/m)*X'*(hypothesis-Y);
   J(i)=(1/(2*m))*sum((hypothesis-Y).^2);
end

end