%% sim01
    data01 = data5(:,[1,2,3]);
    
    for i=1:length(data01(:,1))
        emp01(i) = sum(data01(i,1)<= data01(:,1))/length(data01(:,1));
    end
    
    for i=1:length(data01(:,2))
        emp02(i) = sum(data01(i,2) <= data01(:,2))/length(data01(:,2));
    end
     
    for i=1:length(data01(:,3))
        emp03(i) = sum(data01(i,3) <= data01(:,3))/length(data01(:,3));
    end

    plot3(emp01,emp02,emp03,'o');