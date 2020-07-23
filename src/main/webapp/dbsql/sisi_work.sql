select * from member;

select * from position;

select * from department;

create view log_mem
as
select m.name , m.memno, m.pwd, m.FIREDATE, p.PosNAME
from member m join position p
 on m.POSCODE = p.POSCODE;
 
  
select * from log_mem;

desc log_mem;

create view mypage_mem
as
select m.*,  p.posname , d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  

  
select * from mypage_mem;
  
 /* 
  drop view log_mem;
  drop view mypage_mem;
  drop table position;
  drop table department;
  */
  
 
  
  commit;
  

insert into member(memNo, name, pwd, deptcode, poscode)
values(member_seq.nextval, 'Á¤±×·¡', '123', '111','910');

insert into department
values('111', '¿µ¾÷1ÆÀ');

insert into department
values('121', '±âÈ¹ÆÀ');


insert into position
values('910', '»ç¿ø');

insert into position
values('920', '°æ¸®');