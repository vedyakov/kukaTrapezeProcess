% ����� ���� ������� ����� �����, ������� ������ ����������������
% ���� ����� ������ ������ � ����� data � ���������� j1_exp.csv, j3_exp.csv
% ��� ������� � �������� ������� ��������������
jointNum = 3;
save('workspace/jointNum.mat');
%disp('>> ������������ ���-����');
loadData;
disp('>> �������� ����� � ������ ����');
agregate;
disp('>> �������������� ������ ������');
agregate2;