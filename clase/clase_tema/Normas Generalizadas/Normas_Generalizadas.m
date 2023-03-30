X=rand(1000000,2);
media=mean(X);
XC=X-media;

for j=1:1000000
    d(j)=norm(XC(j,:),2);
end

p=prctile(d,50);
I=find(d<p);

plot(XC(:,1),X(:,2),'o')
hold on
plot(XC(I,1),X(I,2),"o")
hold off