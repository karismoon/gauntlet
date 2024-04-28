load("scan1.mat")
mainframe1 = mainframe_pos;
scatter(mainframe1(1, :), mainframe1(2, :)); 
hold on
load("scan2.mat")
mainframe2 = mainframe_pos;
scatter(mainframe2(1, :), mainframe2(2, :));
