/*
drop table boardComment;
drop table companyBoard_recommend;
drop table board;
drop sequence board_seq;
*/

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

COMMENT ON TABLE board IS '사내게시판';

COMMENT ON COLUMN board.boardNo IS '게시글번호';

COMMENT ON COLUMN board.title IS '글제목';

COMMENT ON COLUMN board.MEMNO IS '사원번호';

COMMENT ON COLUMN board.content IS '글내용';

COMMENT ON COLUMN board.regdate IS '등록일';

COMMENT ON COLUMN board.visited IS '조회수';

COMMENT ON COLUMN board.recommend IS '추천';

COMMENT ON COLUMN board.isMain IS '메인여부';

COMMENT ON COLUMN board.fileName IS '이미지이름';

COMMENT ON COLUMN board.saveFileName IS '이미지저장이름';

COMMENT ON COLUMN board.contentType IS '이미지타입';

COMMENT ON COLUMN board.filePath IS '파일경로';

COMMENT ON COLUMN board.fileSize IS '파일사이즈';

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
		CONSTRAINT FK_MEMBER_TO_companyBoard_recommend
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_board_TO_companyBoard_recommend
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