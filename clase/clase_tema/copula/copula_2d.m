%% sim01
    data01 = data5(:,[1,5]);
    
    for i=1:length(data01(:,1))
        emp01(i) = sum(data01(i,1)<= data01(:,1))/length(data01(:,1));
    end
    
    for i=1:length(data01(:,2))
        emp02(i) = sum(data01(i,2) <= data01(:,2))/length(data01(:,2));
    end
     
    plot(emp01,emp02,'o');
