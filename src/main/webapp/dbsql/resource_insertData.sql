

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '회의실');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '차량');


select * from resmanage;


insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '회의실1', 1, '4층 A동', 'red', 
'인원: 12인용
장비 : V-플랫 2m / 젬볼 85cm / C스탠드 / 소프트박스 등
플래시 : 포멕스 E600 x 2 +동조기
LED 지속광 : 고독스 sl200w * 1 / 고독스 sl60w × 2',
'회의실1.jpg', '회의실1.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '회의실2', 1, '4층 B동', 'green',
'인원: 20인용
장비 : 75인치 모니터, 케이터링, 프린터, 음향/마이크',
'회의실2.jpg', '회의실2.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '회의실3', 1, '2층 본관', 'orange',
'인원: 18인용
장비 : 5G 무선 와이파이, 대형 IPTV(노트북, 스마트폰 연결 케이블 있음), 냉온풍기, 강의용 화이트보드',
'회의실3.jpg', '회의실3.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '회의실4', 1, '4층 A동', 'blue',
'인원: 12인용
장비 : 무선 와이파이, 빔프로젝터, 대형 IPTV(노트북, 스마트폰 연결 케이블 있음), 냉온풍기, 강의용 화이트보드 ',
'회의실4.jpg', '회의실4.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '회의실3', 1, '2층 본관', 'orange',
'인원: 18인용
장비 : 5G 무선 와이파이, 대형 IPTV(노트북, 스마트폰 연결 케이블 있음), 냉온풍기, 강의용 화이트보드',
'회의실3.jpg', '회의실3.jpg');
--자동차 : 자원번호, 자원명, 자원종류번호, 자원장소, 자원색깔, 자원부가설명
--자원변경전이미지파일명, 이미지파일명

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 
'2019 제네시스 G80', 
2, 
'주차장A', 
'Casablanca White',
'차량번호: 164하 9435,
출고일:2019년 3월,
구매시기:2019년 3월,
인원: 5명,
가격: 6347만원,
연료: 가솔린,
연비: 8.0~13.8km/ℓ',
'G80.jpg',
'G80.jpg'
);

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 
'2017 아반떼 Ad', 
2, 
'주차장B', 
'Phantom Black',
'차량번호: 33호 3469,
출고일: 2017년 3월,
구매시기:2017년 3월
인원: 5명,
가격: 2670만원,
연료: 디젤,
연비: 10.6 ~ 17.8km/ℓ',
'avante.jpg', 
'avante.jpg'
);

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2016 스타렉스', 
2, 
'주차장B', 
'Creamy White',
'차량번호: 31하 1963,
출고일: 2016년 3월,
구매시기: 2017년 2월,
인승: 11인승,
가격: 1480만원,
연료: 디젤,
연비: 6.1~11.0km/ℓ',
'starex.jpg', 
'starex.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2019 모닝', 
2, 
'주차장B', 
'Sparkling Silver',
'차량번호: 134하 4693,
출고일: 2019년 6월,
구매시기: 2020년 4월,
인승: 5인승,
가격: 910만원,
연료: 가솔린,
연비: 11.8~16.0km/ℓ',
'morning.jpg', 
'morning.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2017 봉고3', 
2, 
'주차장B', 
'Navy',
'차량번호: 32호 7321,
출고일: 2017년 6월,
구매시기: 2017년 12월,
인승: 3인승,
가격: 1673만원,
연료: 디젤,
연비: 6.4~9.6km/ℓ',
'bongo.jpg', 
'bongo.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2016 코란도 스포츠', 
2, 
'주차장B', 
'Space Black',
'차량번호: 72허 9317,
출고일: 2016년 3월,
구매시기: 2016년 3월,
인승: 5인승,
가격: 3247만원,
연료: 디젤,
연비: 11.4~13.3km/ℓ',
'korando.jpg', 
'korando.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2020 K5', 
2, 
'주차장B', 
'Aurora Black Pearl',
'차량번호: 117호 3723,
출고일: 2020년 6월,
구매시기: 2020년 6월,
인승: 5인승,
가격: 3473만원,
연료: 가솔린,
연비: 9.8~13.8km/ℓ',
'K5.jpg', 
'K5.jpg');

-- resImage -> /webapp/resources/img/resource 파일에 있는 이미지를 활용할 것. 
    -- 수정 페이지에서 이미지를 첨부하면 /webapp/resource_file에 이름이 변경되서 저장됨.


insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '회의실1', 1, '4층 A동', 'red');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '회의실2', 1, '4층 B동', 'green');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '회의실3', 1, '2층 본관', 'orange');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '제네시스 G80', 2, '주차장A', 'lightgray');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '아반떼', 2, '주차장B', 'violet');

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

delete from resreserve;

insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/05 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), to_date('2020/08/08 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
  
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 10:30:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 12:30:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 20:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 21:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/09 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/11 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/11 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
 insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 19:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 20:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/06/29 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/2 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2018/01/05 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2019/12/21 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 09:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);

select * from resreserve;
delete from resreserve where rvno=53;

----------------------------------------------------------------------------