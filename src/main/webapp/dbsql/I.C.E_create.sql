--sys�� system �������� �α����ؼ� ����� ����, ���̺������̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace ICE
datafile 'C:\myoracle\data\ICE.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user ICE
identified by ICE123
default tablespace Ice;

--����� ���Ѻο�
grant connect,resource to ICE;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to ICE;