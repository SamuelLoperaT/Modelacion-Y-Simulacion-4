mu= [2 2];
sigma=[1 0.9
    0.9 1];
X=mvnrnd(mu,sigma,1000);
plot(X(:,1),X(:,2),'o')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu1=[1 5];
sigma1=[0.2 0
    0 0.2];
hold on
X1=mvnrnd(mu1,sigma1,200);
plot(X1(:,1),X1(:,2),'ok')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu2=[4 -2];
sigma2=[0.1 0
    0 0.1];
hold on
X2=mvnrnd(mu2,sigma2,200);
plot(X2(:,1),X2(:,2),'ok')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data=exprnd(5,1000,1);

M=max(data);
dataR=sort(data);
R=expcdf(dataR,5);
plot(dataR,R)
hold on
ecdf(data)
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%