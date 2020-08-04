
insert into addressGroup
values(adgNo_seq.nextval, '회사', '111910');
insert into addressGroup
values(adgNo_seq.nextval, '친구', '111910');
insert into addressGroup
values(adgNo_seq.nextval, '지인', '111910');
insert into addressGroup
values(adgNo_seq.nextval, '아무나', '121920');
insert into addressGroup
values(adgNo_seq.nextval, '오키', '121920');


insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '박길동', '010', '2222', '3333', 'wotkdf', 'naver.com', 1, '(주)I.C.E' ,'인사부', '대리');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '김연아', '010', '4545', '3333', null, null, 1, null , null, null);
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '이수찬', null, null, null, 'wowwwf', 'gmail.com', 2, null ,'인사부', '대리');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '이라희', '010', '2222', '3333', 'wotkdf', 'naver.com', 2, null ,'인사부', '대리');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '김대리', '010', '3434', '7777', 'ready', 'daum.net', 4, '(주)I.C.E' ,'인사부', '대리');

select * from position;
select * from department;
select * from member;

select * from address;
select * from addressGroup;