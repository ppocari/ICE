

select * from SpayView -- 주문한 사람 정보 , 결제 내역 보여주는 용도
where memno = '111910';

CREATE TABLE  ticket (
	TICNO NUMBER NOT NULL, /* 식권구매관리 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	TICQUANTITY NUMBER, /* 구매매수 */
	TICPRICE NUMBER, /* 가격 */
	TICREGDATE DATE DEFAULT SYSDATE /* 구매일 */
);

commit;



create or replace view SpayView
as
select t.*, m.name, m.hp1, m.hp2, m.hp3, m.email1, m.email2
from ticket t join member m
on t.MEMNO = m.MEMNO;

create sequence ticket_seq
start with 1
increment by 1
nocache;

select * from SpayView;