select * from member;

select * from position;

select * from department;

create view log_mem
as
select m.name , m.memno, m.pwd, m.FIREDATE, p.posCode,p.PosNAME ,d.deptCode,d.deptNAME
from member m join position p
 on m.POSCODE = p.POSCODE
join department d
 on m.DEPTCODE = d.DEPTCODE;
 
  
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
  drop table member;
  */
  
 
  
  commit;
  
 --delete from member;
  

insert into member(memNo, name, pwd, deptcode, poscode)
values('111910', '정그래', '123', '111','910');

insert into member(memNo, name, pwd, deptcode, poscode)
values('121920', '이경리', '123', '121','920');

insert into member(memNo, name, pwd, deptcode, poscode)
values('141930', '김과장', '123', '141','930');

insert into member(memNo, name, pwd, deptcode, poscode)
values('999999', '박관리', '123', '999','999');


select * from companyCard;

insert into companyCard
values('1111222233334444','111910','102036',9000,'서울시','2020-07-12');

select * from accountCode;
--102306
--102307

