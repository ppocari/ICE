/* 사내게시판 댓글 */
drop table boardComment;

CREATE TABLE boardComment (
	no NUMBER NOT NULL, /* 댓글번호 */
	boardNo NUMBER, /* 게시글번호 */
	memNO VARCHAR2(50), /* 사원번호* */
	nickname VARCHAR2(50) NOT NULL, /* 별명 */
	content CLOB NOT NULL, /* 내용 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

drop sequence boardComment_seq;

create sequence boardComment_seq
start with 1
increment by 1;

COMMENT ON TABLE boardComment IS '사내게시판 댓글';

COMMENT ON COLUMN boardComment.no IS '댓글번호';

COMMENT ON COLUMN boardComment.boardNo IS '게시글번호';

COMMENT ON COLUMN boardComment.memNO IS '사원번호*';

COMMENT ON COLUMN boardComment.nickname IS '별명';

COMMENT ON COLUMN boardComment.content IS '내용';

COMMENT ON COLUMN boardComment.regdate IS '작성일';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		no ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			no
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_MEMBER_TO_boardComment
		FOREIGN KEY (
			memNO
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