
insert into resmanage(resno, resname)
values(resno_seq.nextval, '회의실1');
insert into resmanage(resno, resname, reslocation, ressubdesc)
values(resno_seq.nextval, '회의실2', '4층 별관', '노트북 3대, 프로젝트 유, 칠판 유');

select * from resmanage;

desc resmanage;