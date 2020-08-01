
/* 스케줄 */
--drop table schedule;
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* 스케줄 번호 */
	MEMNO VARCHAR2(50) NOT NULL, /* 사원번호 */
	TITLE VARCHAR2(100) NOT NULL, /* 스케줄 제목 */
	START_DAY VARCHAR2(100) NOT NULL, /* 스케줄 시작 날짜 */
	END_DAY VARCHAR2(100) NOT NULL, /* 스케줄 끝날짜 */
	PLACE VARCHAR2(100), /* 스케줄 장소 */
	CONTENT VARCHAR2(100) /* 스케줄 내용 */
);


ALTER TABLE schedule
	ADD
		CONSTRAINT PK_schedule
		PRIMARY KEY (
			SCHNO
		);
		
ALTER TABLE schedule
	ADD
		CONSTRAINT FK_MEMBER_TO_schedule
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
--drop sequence schedule_seq;
create sequence schedule_seq
increment by 1
start with 1;


select * from SCHEDULE;

insert into SCHEDULE(schno,memNo,title,start_day,end_day,place,content)
		values(schedule_seq.nextval,111910,'제목',sysdate,sysdate,'교육관','8시집합');
		
		
commit;