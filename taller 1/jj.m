
%miu=3.5;
%sigma=0.2;
%N=miu+sigma*randn(1000,1)
%hist(N);



%x=datamode(:,1);
%lol=table2array(x);
%xbar=mean(lol);
%S=std(lol);
%z=(lol-xbar)/S
%I1=find(z>3)
%o1=lol(I1)


X1=randn(1000,2)
X2=[3 -3]+rand(100,2)
X=[X1 
    X2];
plot(X(:,1),X(:,2),"o")
theta=0:0.01:2*pi;
x=cos(theta);
y=sin(theta);
V=[x
    y]
P=X*V;
plot(x,y,".")

A=skewness(P)
aux=abs(A)
Ma=max(aux)

I=find(aux==Ma)

XP=P(:,I)
hist(XP)
boxplot(XP)
ri=iqr(XP)
Q3=prctile(XP,75)
L=Q3+1.5*ri
I2=find(XP>L)
plot(X(:,1),X(:,2),"o")
hold on
plot(X(I2,1),X(I2,2),"or")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


P=rand(1000,3)
plot3(P(:,1),P(:,2),P(:,3),"o")