/* 받는사람 */
DROP TABLE message_rec 
	CASCADE CONSTRAINTS;

/* 쪽지함 */
DROP TABLE message 
	CASCADE CONSTRAINTS;

drop sequence message_seq;
drop sequence message_rec_seq;

DROP VIEW message_view;

/* 받는사람 */


CREATE TABLE message_rec (
	no NUMBER NOT NULL, /* 쪽지관리번호 */
	msgno NUMBER NOT NULL, /* 쪽지번호 */
	recMemNo VARCHAR2(50) NOT NULL /* 받는 사원 */
);

CREATE UNIQUE INDEX PK_message_rec
	ON message_rec (
		no ASC
	);

ALTER TABLE message_rec
	ADD
		CONSTRAINT PK_message_rec
		PRIMARY KEY (
			no
		);

/* 쪽지함 */
CREATE TABLE message (
	msgno NUMBER NOT NULL, /* 쪽지번호 */
	msgstatus VARCHAR2(50)  NOT NULL, /* 쪽지상태 */
	msgcontent CLOB, /* 쪽지내용 */
	msgregdate DATE DEFAULT sysdate, /* 날짜 */
	sendMemNo VARCHAR2(50) /* 보낸사원번호 */
);

CREATE UNIQUE INDEX PK_message
	ON message (
		msgno ASC
	);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			msgno
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_message_TO_message_rec
		FOREIGN KEY (
			msgno
		)
		REFERENCES message (
			msgno
		);

ALTER TABLE message
	ADD
		CONSTRAINT FK_MEMBER_TO_message
		FOREIGN KEY (
			sendMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
create view message_view
as
select mr.NO, mem.name as recname , mr.RECMEMNO ,m.* , memb.name as sendname
from message_rec mr join message m
on mr.MSGNO = m.MSGNO
join member mem
on mem.memno = mr.RECMEMNO
join member memb
on memb.memno = m.sendmemno;

select * from message_view;

create sequence message_rec_seq
start with 100
increment by 1;


create sequence message_seq
start with 1
increment by 1;

