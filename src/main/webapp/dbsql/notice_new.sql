drop table notice;

/* 공지사항 */
CREATE TABLE notice (
	noticeNo NUMBER NOT NULL, /* 공지사항게시글번호 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	memNo VARCHAR2(50), /* 사원번호 */
	content CLOB NOT NULL, /* 글내용 */
	regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	fileName VARCHAR2(100) DEFAULT 0, /* 업로드파일명 */
	fileSize LONG DEFAULT 0, /* 파일사이즈 */
	orFileName VARCHAR2(100) DEFAULT 0, /* 변경전 업로드 파일명 */
	downcount NUMBER DEFAULT 0, /* 다운수 */
	readcount NUMBER DEFAULT 0, /* 조회수 */
	category VARCHAR2(100) NOT NULL, /* 카테고리 */
	main VARCHAR2(5) DEFAULT 'N', /* 메인여부 */
	newImgTerm VARCHAR2(200) DEFAULT 0 /* 24시간 */
);

drop sequence notice_seq;

create sequence notice_seq
start with 1
increment by 1;

COMMENT ON TABLE notice IS '공지사항';

COMMENT ON COLUMN notice.noticeNo IS '공지사항게시글번호';

COMMENT ON COLUMN notice.title IS '글제목';

COMMENT ON COLUMN notice.memNo IS '사원번호';

COMMENT ON COLUMN notice.content IS '글내용';

COMMENT ON COLUMN notice.regdate IS '등록일';

COMMENT ON COLUMN notice.fileName IS '업로드파일명';

COMMENT ON COLUMN notice.fileSize IS '파일사이즈';

COMMENT ON COLUMN notice.orFileName IS '변경전 업로드 파일명';

COMMENT ON COLUMN notice.downcount IS '다운수';

COMMENT ON COLUMN notice.readcount IS '조회수';

COMMENT ON COLUMN notice.category IS '카테고리';

COMMENT ON COLUMN notice.main IS '메인여부';

COMMENT ON COLUMN notice.newImgTerm IS '24시간';

CREATE UNIQUE INDEX PK_notice
	ON notice (
		noticeNo ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			noticeNo
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_MEMBER_TO_notice
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);