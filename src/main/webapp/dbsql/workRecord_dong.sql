/* ���°��� */
-- DROP TABLE workRecord CASCADE CONSTRAINTS;
-- drop sequence workRecord_seq;

/* ���°��� */
CREATE TABLE workRecord (
	CMP_NO NUMBER NOT NULL, /* ���°��� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	CMP_IN VARCHAR2(30), /* ��ٽð� */
	CMP_OUT VARCHAR(30), /* ��ٽð� */
	CMP_STATUS VARCHAR2(50), /* ���»��� */
	CMP_REGDATE VARCHAR(30) DEFAULT sysdate, /* ���糯¥ */
	CMP_MONTH VARCHAR2(30) /* ���� �� */
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
values(workrecord_seq.nextval,111910,'09:00','17:00','���','2020-08-01','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'09:00','17:00','���','2020-08-02','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'09:00','17:00','���','2020-08-03','2020-08');

insert into workRecord(cmp_no,memNo,cmp_in,cmp_out,cmp_status,cmp_regdate,cmp_month)
values(workrecord_seq.nextval,111910,'10:00','11:00','�̻�','2020-08-04','2020-08');

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