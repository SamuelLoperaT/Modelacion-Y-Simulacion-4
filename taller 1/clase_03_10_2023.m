X=rand(100,5);%datamode([1:5],:);
[n k]=size(X);
P=eye(n)-ones(n)/n;
Xcentrado=P*X;

%matrizconvarianza=(Xcentrado'*Xcentrado)/n
matrizconvarianza=(X'*P*X)/n

X=table2array(datamode(:,[1 2]));
v=[sqrt(2)/2 
    sqrt(2)/2];
DP=X*v
s2=var(DP)
sigma=cov(X);
v'*sigma*v;
[vector valor]=eig(sigma);

XP=X*vector(:,end);
var(XP)
%% 

X=table2array(datamode);
plotmatrix(X)
sigma=cov(X);
[vector valor]=eig(sigma)
d=diag(valor)
d2=d/sum(d)
XP=X*vector(:,end)



