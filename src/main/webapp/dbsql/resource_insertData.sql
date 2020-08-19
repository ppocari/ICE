

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '회의실');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '차량');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '장비');


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

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'미니빔프로젝터 PJM-H2000', 
3, 
'3층 관리실', 
'Black',
'제품사양: HD(1280x720),
투사화면크기: 50형~160형,
화면비율: 16:9,
USB지원: 2.0,
구성품 : HDMI 케이블,
리모컨, 전원선, 사용설명서, 렌즈커버',
'PJM-H2000.jpg', 
'PJM-H2000.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'시네빔 PF50KS FHD', 
3, 
'3층 관리실', 
'White',
'제품사양: FULL HD(1920x1080),
투사화면크기: 50형~200형,
화면비율: 16:9,
USB지원: 2.0, TYPE-C,
구성품 : HDMI 케이블,
리모컨, 전원선, 사용설명서, 렌즈커버',
'PF50KS FHD.jpg', 
'PF50KS FHD.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'빔프로젝터 G86', 
3, 
'3층 관리실', 
'White',
'제품사양: FULL HD(854x480),
투사화면크기: 32형~150형,
화면비율: 4:3,
USB지원: 2.0, TYPE-C,
구성품 : HDMI 케이블,
리모컨, 전원선, 사용설명서, 렌즈커버',
'G86.jpg', 
'G86.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'니콘 D3500 AF-P18-55VR KIT', 
3, 
'3층 관리실', 
'Black',
'제품사양: FULL HD(1080/60),
화소: 2416만,
구성품 : HDMI 케이블,
충전식 배터리, 배터리 충전기, 사용설명서, 렌즈커버',
'D3500.jpg', 
'D3500.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'캐논 PSSX420IS', 
3, 
'3층 관리실', 
'Black',
'제품사양: FULL HD(1080/60),
화소: 1876만,
구성품 : HDMI 케이블,
충전식 배터리, 배터리 충전기, 사용설명서, 렌즈커버',
' PSSX420IS.jpg', 
' PSSX420IS.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'캐논 EOS 100D', 
3, 
'3층 관리실', 
'Black',
'제품사양: FULL HD(1080/60),
화소: 1800만,
구성품 : HDMI 케이블,
충전식 배터리, 배터리 충전기, 사용설명서, 렌즈커버',
'EOS100D.jpg', 
'EOS100D.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'캐논 EOS 800D', 
3, 
'3층 관리실', 
'Black',
'제품사양: FULL HD(1080/60),
화소: 2420만,
구성품 : HDMI 케이블,
충전식 배터리, 배터리 충전기, 사용설명서, 렌즈커버',
'EOS800D.jpg', 
'EOS800D.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'LG전자 그램15 15ZD90N-VX50K', 
3, 
'3층 관리실', 
'White',
'CPU: 코어i5-1035G7,
RAM: 8GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
SSD: 256GB,
무게: 1.12kg,
구성품 : 베터리 충전기, 가방',
'15ZD90N-VX50K.jpg', 
'15ZD90N-VX50K.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'삼성전자 갤럭시북 이온 NT950XCR-G58A', 
3, 
'3층 관리실', 
'Aura Silver',
'CPU: 코어i5-10210U,
RAM: 8GB,
Graphics: MX250,
화면크기: 15인치,
해상도: 1920x1080(FHD),
SSD: 256GB,
무게: 1.26kg,
구성품 : 베터리 충전기, 가방',
'NT950XCR-G58A.jpg', 
'NT950XCR-G58A.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'ASUS 비보북 R564DA-BQ774', 
3, 
'3층 관리실', 
'Silver',
'CPU: 라이젠5-3500U,
RAM: 8GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
SSD: 512GB,
무게: 1.37kg,
구성품 : 베터리 충전기, 가방',
'R564DA-BQ774.jpg', 
'R564DA-BQ774.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'삼성전자 노트북 플러스 NT550XCR-AD1A', 
3, 
'3층 관리실', 
'Silver',
'CPU: 셀러론-5205U,
RAM: 4GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
SSD: 128GB,
무게: 1.37kg,
구성품 : 베터리 충전기, 가방',
'NT550XCR-AD1A.jpg', 
'NT550XCR-AD1A.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'MSI GF75 Thin 9SC-i7', 
3, 
'3층 관리실', 
'Black',
'CPU:  코어i7-9750H,
Graphics:  지포스GTX1650,
RAM: 8GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
SSD: 128GB,
무게: 1.25kg,
구성품 : 베터리 충전기, 가방',
'9SC-i7.jpg', 
'9SC-i7.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'레노버 아이디어패드 L340-15IRH', 
3, 
'3층 관리실', 
'Black',
'CPU:  코어i5-9300HF,
Graphics:  지포스GTX1650,
RAM: 4GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
무게: 1.3kg,
구성품 : 베터리 충전기, 가방',
'L340-15IRH.jpg', 
'L340-15IRH.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'LG전자 울트라PC 15UD70N-GX56K', 
3, 
'3층 관리실', 
'Black',
'CPU:  코어i5-10210U,
RAM: 8GB,
화면크기: 15인치,
해상도: 1920x1080(FHD),
무게: 1.75kg,
구성품 : 베터리 충전기, 가방',
'15UD70N-GX56K.jpg', 
'15UD70N-GX56K.jpg');

-- resImage -> /webapp/resources/img/resource 파일에 있는 이미지를 활용할 것. 
    -- 수정 페이지에서 이미지를 첨부하면 /webapp/resource_file에 이름이 변경되서 저장됨.

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