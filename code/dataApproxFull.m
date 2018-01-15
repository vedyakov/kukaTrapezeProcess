% нужно усреднить показания за каждый "пролёт"
function left = dataApproxFull(leftStart,leftEnd,j4,t4)
    zeroValue = 1000;
    n = min([size(leftStart,2),size(leftEnd,2)]);  
    tab = table();
    nameLst = ['j4'];
    for i=2:1:n
        nameLst = [nameLst;'d'+int2str(i)];
    end
   % tab.Properties.VariableNames = {'j4'};
    disp(nameLst);
    %for i=2:1:n
    %    lj = j4(leftStart(i):leftEnd(i));
    %    lt = t4(leftStart(i):leftEnd(i));
    %    tab = 
   % end;
    
    
   % zeroValue = 100;
    % объединяем списки
   % tab1 = table(t1,v1,populateArray(v1,zeroValue));
  %  tab1.Properties.VariableNames = {'ta','v1a','v2a'};
  %  tab2 = table(t2,populateArray(v2,zeroValue),v2);
   % tab2.Properties.VariableNames = {'ta','v1a','v2a'};
   % C = table2array(union(tab1,tab2));
  %  disp(C);
    % удаляем нули по краям, потому что интервалы не симметричны
 %   s = size(C);    
 %   if C(1,2)==zeroValue
 %       i = 1;
  %      while C(i,2)==zeroValue
 %           i = i+1;
 %       end;
  %      C = C(i-1:s(1),:);
 %   end;
  %  s = size(C); 
 %   if C(1,3)==zeroValue
  %       i = 1;
  %      while C(i,3)==zeroValue
   %         i = i+1;
   %     end;
 %       C = C(i-1:s(1),:);
  %  end;
  %  s = size(C);    
  %  if C(s(1),2)==zeroValue
   %     i = s(1);
  %      while C(i,2)==zeroValue
  %          i = i-1;
  %      end;
  %      C = C(1:i+1,:);
  %  end;
 %   s = size(C);    
  %  if C(s(1),3)==zeroValue
 %       i = s(1);
 % %      while C(i,3)==zeroValue
 %           i = i-1;
  %      end;
 %       C = C(1:i+1,:);
  %  end;
 %   s = size(C);
    % апроксимируем
 %   for i=2:1:s(1)-1
  %      if C(i,2)==zeroValue
  %          j = i+1;
    %        while(C(j,2)==zeroValue && j<s(1))
   %             j = j+1;
  %          end;                
   %         newVal = getApproxMiddle(C(i-1,2),C(i-1,1),C(i,1),C(j,2),C(j,1));
   %         C(i,2)=newVal;
  %      end;
   %     if C(i,3)==zeroValue
  %          j = i+1;
  %          while(C(j,3)==zeroValue && j<s(1))
   %             j = j+1;
   %         end;      
   %         newVal = getApproxMiddle(C(i-1,3),C(i-1,1),C(i,1),C(j,3),C(j,1));
   %         C(i,3)=newVal;
   %     end;
 %   end;
    % срезаем крайние неапроксимированные значения
  %  s = size(C);
 %   C = C(2:s(1)-1,:);
 %   disp(C);
%end

