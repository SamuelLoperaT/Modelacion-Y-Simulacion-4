% box plot
    data03 = -log(rand(1000,1));
    figure
    boxplot(data03,'Orientation','horizontal')

    Q1 = prctile(data03,25);
    Q3 = prctile(data03,75);

    RI = Q3 - Q1;
    BI = Q1 - 1.5*RI;
    BS = Q3 + 1.5*RI;
    OS = find(data03 > BS);
    OI = find(data03 < BI);

    data03(OS) = [];
    figure
    boxplot(data03,'Orientation','horizontal')
