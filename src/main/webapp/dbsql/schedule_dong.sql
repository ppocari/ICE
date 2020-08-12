
/* 스케줄 */
--drop table schedule;
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* 스케줄 번호 */
	MEMNO VARCHAR2(50) NOT NULL, /* 사원번호 */
	TITLE VARCHAR2(100) NOT NULL, /* 스케줄 제목 */
	START_DAY VARCHAR2(100) NOT NULL, /* 스케줄 시작 날짜 */
	END_DAY VARCHAR2(100) NOT NULL, /* 스케줄 끝날짜 */
	PLACE VARCHAR2(100), /* 스케줄 장소 */
	CONTENT VARCHAR2(100), /* 스케줄 내용 */
	resourceId VARCHAR2(100) /* 리소스 아이디 */
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

insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'db작업','2020-08-01','2020-08-03','업무관련','스케줄db작업','a');

insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'회식','2020-08-31','2020-08-31','기타','회식','b');		
		
insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'휴가','2020-08-10','2020-08-15','휴가/연차','휴가','c');

insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'반차','2020-08-18','2020-08-18','유연근무','반차','d');

commit;