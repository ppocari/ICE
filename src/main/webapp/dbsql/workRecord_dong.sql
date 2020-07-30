/* 근태관리 */
--DROP TABLE workRecord CASCADE CONSTRAINTS
--drop sequence workRecord_seq

CREATE TABLE workRecord (
	CMT_NO NUMBER NOT NULL, /* 근태관리 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	CMP_IN VARCHAR2(30), /* 출근시간 */
	CMP_OUT VARCHAR2(30), /* 퇴근시간 */
	CMP_STATUS VARCHAR2(50) /* 근태상태 */
);


ALTER TABLE workRecord
	ADD
		CONSTRAINT PK_workRecord
		PRIMARY KEY (
			CMT_NO
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
		
select * from workRecord;


/*insert into workRecord
values(workRecord_seq.nextval,111910,sysdate,sysdate,'출근');*/