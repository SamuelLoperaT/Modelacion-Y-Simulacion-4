%x=rand(10000,1);
%y=rand(10000,1);
%plot(x,y,"o")

resultad_real=exp(2)-exp(1)
M=exp(2);
a=1;
b=2;
N=10000;
x=a+(b-a)*rand(N,1);
y=0+M*rand(N,1);
I=mean((y<=exp(x)));
integral=I*M*(b-a)


