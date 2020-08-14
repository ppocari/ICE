

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '회의실');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '차량');


select * from resmanage;

insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '회의실1', 1, '4층 A동');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '회의실2', 1, '4층 B동');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '회의실3', 1, '2층 본관');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '제네시스 G80', 2, '주차장A');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '아반떼', 2, '주차장B');

-- resSubdesc -> 수정 페이지에서 자원설명에 붙여서 등록할 것.
-- resImage -> /webapp/resources/img/resource 파일에 있는 이미지를 활용할 것. 
    -- 수정 페이지에서 이미지를 첨부하면 /webapp/resource_file에 이름이 변경되서 저장됨.
 
/* 회의실1
인원: 12인용
장비 : V-플랫 2m / 젬볼 85cm / C스탠드 / 소프트박스 등
플래시 : 포멕스 E600 x 2 +동조기
LED 지속광 : 고독스 sl200w * 1 / 고독스 sl60w × 2
*/

/* 회의실2
인원: 20인용
장비 : 75인치 모니터, 케이터링, 프린터, 음향/마이크
*/

/* 회의실3
인원: 18인용
장비 : 5G 무선 와이파이, 대형 IPTV(노트북, 스마트폰 연결 케이블 있음), 냉온풍기, 강의용 화이트보드
*/

/* 제네시스 G80
인원: 4명
연비: 복합연비: 9 ~ 15 km/l (도심: 8 ~ 13 km/l, 고속도로: 11 ~ 18 km/l)
적재 용량: 433L
엔진: 2.2L 4-실린더 디젤, 2.5L 6-실린더, 3.5L V6
*/

/* 아반떼
인원: 4명
가격: 1,376 ~ 2,454만원
연료: LPG,가솔린,디젤
연비: 10.6 ~ 17.8km/l
*/
-------------------------------------------------------------------------

select * from resreserve;

insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/05 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), to_date('2020/08/05 13:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, '2020-08-01', '2020-08-02', 121920);

insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 15:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 17:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);    
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 09:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 11:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 20:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 21:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/09 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/11 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 2, to_date('2020/08/10 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 09:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 3, to_date('2020/08/10 12:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 14:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);




----------------------------------------------------------------------------