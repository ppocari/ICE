
DROP TABLE boardComment 
	CASCADE CONSTRAINTS;
	
DROP TABLE companyBoard_recommend 
	CASCADE CONSTRAINTS;

/* 사내게시판 댓글 */
CREATE TABLE boardComment (
	bComNo NUMBER NOT NULL, /* 댓글번호 */
	ComNo NUMBER, /* 댓글순서번호 */
	boardNo NUMBER, /* 게시글번호 */
	MEMNO VARCHAR2(50), /* 사원번호* */
	content CLOB, /* 내용 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

COMMENT ON TABLE boardComment IS '사내게시판 댓글';

COMMENT ON COLUMN boardComment.bComNo IS '댓글번호';

COMMENT ON COLUMN boardComment.ComNo IS '댓글순서번호';

COMMENT ON COLUMN boardComment.boardNo IS '게시글번호';

COMMENT ON COLUMN boardComment.MEMNO IS '사원번호*';

COMMENT ON COLUMN boardComment.content IS '내용';

COMMENT ON COLUMN boardComment.regdate IS '작성일';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		bComNo ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			bComNo
		);

/* 사내게시판추천 */
CREATE TABLE companyBoard_recommend (
	recNo NUMBER NOT NULL, /* 추천번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	boardNo NUMBER /* 게시글번호 */
);

COMMENT ON TABLE companyBoard_recommend IS '사내게시판추천';

COMMENT ON COLUMN companyBoard_recommend.recNo IS '추천번호';

COMMENT ON COLUMN companyBoard_recommend.MEMNO IS '사원번호';

COMMENT ON COLUMN companyBoard_recommend.boardNo IS '게시글번호';

CREATE UNIQUE INDEX PK_companyBoard_recommend
	ON companyBoard_recommend (
		recNo ASC
	);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT PK_companyBoard_recommend
		PRIMARY KEY (
			recNo
		);



drop table board;
drop sequence board_seq;

/* 사내게시판 */
CREATE TABLE board (
	boardNo NUMBER NOT NULL, /* 게시글번호 */
	title VARCHAR2(100), /* 글제목 */
	memNo VARCHAR2(50), /* 사원번호 */
	nickname VARCHAR2(50), /* 별명 */
	content CLOB, /* 글내용 */
	regdate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	visited NUMBER DEFAULT 0, /* 조회수 */
	recommend NUMBER DEFAULT 0, /* 추천 */
	category VARCHAR2(10), 
	isMain VARCHAR2(10) default 'N', /* 메인여부 */
	filePath VARCHAR2(300) /* 파일경로 */
);
/*
fileName VARCHAR2(300), 
saveFileName VARCHAR2(300), 
contentType VARCHAR2(300),
fileSize NUMBER
*/

create sequence board_seq
start with 1
increment by 1;

CREATE UNIQUE INDEX PK_board
	ON board (
		boardNo ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			boardNo
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_MEMBER_TO_boardComment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_board_TO_boardComment
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_MEMBER_TO_comBoard_recom
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_board_TO_comBoard_recom
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_MEMBER_TO_board
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);