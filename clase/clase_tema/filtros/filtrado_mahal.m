%% sim01
    data01 = data10;
    data01 = data01(:,[1,2]);
    dist_mahal = mahal(data01,data01);
    
    p90 = prctile(dist_mahal, 90);
    
    I = find(dist_mahal<p90);
    
    plot(data01(:,1),data01(:,2),'.')
    hold on 
    plot(data01(I,1),data01(I,2),'.')