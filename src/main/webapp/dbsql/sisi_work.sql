select * from member;

select * from position;

select * from department;

create view log_mem
as
select name , memno, pwd,  p.PNAME, d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  
select * from log_mem;

create view mypage_mem
as
select m.*,  p.PNAME, d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  
  
select * from mypage_mem;
  
  