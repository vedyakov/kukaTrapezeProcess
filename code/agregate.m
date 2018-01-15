clear all; close all;
load('workspace/measured.mat');
 
s = size(task);
curSize = -1;
b = [];
middleSum = 0;
middleCnt = 0;  
% крайние значения 
minJ = min(j);
maxJ = max(j);
flg = 0;
for i=1:1:s(1)
     if (task(i) ~= 0 && abs(task(i))~=curSize)         
        b = [b i];
        curSize = abs(task(i));
     end
     if (abs(t(i))<0.0001 && abs(j(i)-minJ)>0.4&& abs(j(i)-maxJ)>0.4)
         middleSum = middleSum+j(i);
     end;
       middleCnt = middleCnt+1;        
end
% середина
middleJ = middleSum/middleCnt;

sb = size(b);
start = [];
finish = [];
for i=1:1:sb(2)-1
    start = [start b(i)];
    finish = [finish b(i+1)];
end;

resTauL = [];
resWL = [];
resTauR = [];
resWR = [];

for exp = 1:1:sb(2)-1
%for exp = 1:1:3
    st = start(exp);
    fn = finish(exp);
    leftStart = [];
    leftEnd = [];
    rightStart = [];
    rightEnd = [];
    state = 0;
    % получаем начало и конец для движения влево и вправо в виде списков
    % номеров
    flg = 0;
    for i =st:1:fn
        if task(i)>0
            if state==0
                leftStart = [leftStart i];
                state = 1;
            end;
        end;
        if task(i)==0
            if state == 1
               leftEnd = [leftEnd  i-1];
               state = 2;
            end
            if state == 3
               rightEnd = [rightEnd  i-1];
               state = 0;
            end        
        end;
        if task(i)<0
            if state==2
                rightStart = [rightStart i];
                state = 3;
            end;
        end;
    end;

 
    
    sz = size(rightEnd);
    for k =1:1:sz(2)-1
    delta = 0.1;
    flg = 0;
    wl = w(leftStart(k):leftEnd(k));
    wr = w(rightStart(k):rightEnd(k));
    
    jl = j(leftStart(k):leftEnd(k));
    jr = j(rightStart(k):rightEnd(k));
    
    tl = t(leftStart(k):leftEnd(k));
    tr = t(rightStart(k):rightEnd(k));
    
    
    taskr = task(rightStart(k):rightEnd(k));
    taskl = task(leftStart(k):leftEnd(k));
    
    maxL = max(abs(wl));
    sl = abs(wl)> maxL*(1-delta);
    maxR = max(abs(wr));
    sr = abs(wr)> maxR*(1-delta);
    
    lj = jl(sl);
    lt = tl(sl);
    rj = jr(sr);
    rt = tr(sr);    
    lw = wl(sl);
    rw = wr(sr);
    ltask = taskl(sl);
    rtask = taskr(sr);
    
    C = dataApproxV2(lj,lt,rj,rt);
    %try
      %  myplot(C(:,1),[C(:,2),C(:,3),C(:,2)-C(:,3)],{'$\tau^+$','$\tau^-$','$\tau^++\tau^-$'},sprintf('C:\\tex\\tr\\exp_%d.jpg',exp),'southwest',sprintf('W = %.3f',task4l(1)));
   % catch
      %   disp(sprintf('error in test %d',exp)); 
    %end
    %figure;
    resWL(exp,k) = mean(lw);
    resTauL(exp,k) = mean(C(:,2)-C(:,3));

    resWR(exp,k) = mean(rw);
    resTauR(exp,k) = -mean(C(:,2)-C(:,3));
    end;
end;
%myplot(abs(resW),resTau,{'$\tau$'},'C:\\tex\\tr\\result.jpg','southwest','\tau=f(\omega)');
save('workspace/fricTr.mat','resWL','resTauL','resWR','resTauR');

    
