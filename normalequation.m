function thetas=normalequation(X,y)
thetas=(X'*X)^-1*X'*y;
end