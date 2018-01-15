clear all; close all;

load('workspace/jointNum.mat');
m = load(sprintf('data/j%d_exp.csv',jointNum));
 t = m(:,1);
 ft = t(1);

 for i=1:1:size(t)
     t(i)=t(i)-ft;
 end
 
 j1 = m(:,2);
 j2 = m(:,3);
 j3 = m(:,4);
 j4 = m(:,5);
 j5 = m(:,6);
 
 w1 = m(:,7);
 w2 = m(:,8);
 w3 = m(:,9);
 w4 = m(:,10);
 w5 = m(:,11);
 
 t1 = m(:,12);
 t2 = m(:,13);
 t3 = m(:,14);
 t4 = m(:,15);
 t5 = m(:,16);
 
 task1 = m(:,17);
 task2 = m(:,18);
 task3 = m(:,19);
 task4 = m(:,20);
 task5 = m(:,21);
 
 if jointNum == 1
     task = task1;
     t = t1;
     w = w1;
     j = j1;
 end;
 
 if jointNum == 2
     task = task2;
     t = t2;
     w = w2;
     j = j2;
 end;
 
 
 if jointNum == 3
     task = task3;
     t = t3;
     w = w3;
     j = j3;
 end;
 
 if jointNum == 4
     task = task4;
     t = t4;
     w = w4;
     j = j4;
 end;
 
 if jointNum == 5
     task = task5;
     t = t5;
     w = w5;
     j = j5;
 end;
 
 save('workspace/measured.mat','t','task','w','j','jointNum');
 