
X=table2array(datamode)
plot(X(:,1),X(:,2),"o")
d=mahal(X,X)
C=prctile(d,95)
I=find(d>C)
plot(X(:,1),X(:,2),'o')
hold on
plot(X(I,1),X(I,2),'o r')
%%  
X=exprnd(1,100,1)
Y=exprnd(1,100,1)
aux=[X Y]
auz=aux'
TS=min(auz)
TZ=TS'
ecdf(TZ)

TP=max(auz)
TL=TP'
hold on 
ecdf(TL)
