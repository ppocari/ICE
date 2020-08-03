/* 공지사항 */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* 공지사항게시글번호 */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* 글제목 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	NOTI_CONTENT CLOB NOT NULL, /* 글내용 */
	NOTI_REGDATE DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	NOTI_FILENAME VARCHAR2(100), /* 업로드파일명 */
	NOTI_FILESIZE LONG, /* 파일사이즈 */
	NOTI_ORFILENAME VARCHAR2(100), /* 변경전 업로드 파일명 */
	NOTI_DOWNCOUNT NUMBER default 0, /* 다운수 */
	NOTI_READCOUNT NUMBER default 0, /* 조회수 */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL, /* 카테고리 */
	NOTI_MAIN NUMBER /* 상위노출 */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		NOTI_NO ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			NOTI_NO
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_MEMBER_TO_notice
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
create sequence notice_seq
start with 1
increment by 1;

--select * from notice;

commit;


select * from member;