x01 = randn(1000,2);
x02 = [5,5] + randn(1000,2);
x = [x02 
     x01];

G = kmeans(x,2);
g_01 = find(G == 1);
g_02 = find(G == 2);
figure
plot(x(:,1),x(:,2),'.')

figure
plot(x(g_01,1),x(g_01,2),'.')
hold on
plot(x(g_02,1),x(g_02,2),'.')