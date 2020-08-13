/* 근태관리 */
DROP TABLE workRecord CASCADE CONSTRAINTS;
drop sequence workRecord_seq;

/* 근태관리 */
CREATE TABLE workRecord (
	CMP_NO NUMBER NOT NULL, /* 근태관리 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	CMP_IN VARCHAR2(30), /* 출근시간 */
	CMP_OUT VARCHAR(30), /* 퇴근시간 */
	CMP_STATUS VARCHAR2(50), /* 근태상태 */
	CMP_REGDATE VARCHAR(30) DEFAULT sysdate, /* 현재날짜 */
	CMP_MONTH VARCHAR2(30) /* 현재 월 */
);


ALTER TABLE workRecord
	ADD
		CONSTRAINT PK_workRecord
		PRIMARY KEY (
			CMP_NO
		);

ALTER TABLE workRecord
	ADD
		CONSTRAINT FK_MEMBER_TO_workRecord
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

create sequence workRecord_seq
increment by 1
start with 1;

/*
insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'09:00','17:00','출근','2020-08-01','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'09:00','17:00','출근','2020-08-02','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'09:00','17:00','출근','2020-08-03','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'10:00','11:00','이상','2020-08-04','2020-08');

select * from WORKRECORD;
*/
commit;


/*
delete from WORKRECORD
where cmp_no = 1;

delete from WORKRECORD
where memno = 111910;

select * from (select * from workRecord 
            where memno=111910 order by cmp_regdate desc) 
where rownum = 1;

select * from workRecord where memno = 111910 and cmp_regdate = '20-07' order by cmp_in desc;
*/