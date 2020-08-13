/* 공지사항댓글 */
drop table noticeComment;
CREATE TABLE noticeComment (
	no NUMBER NOT NULL, /* 댓글번호 */
	noticeNo NUMBER, /* 게시글번호 */
	memNo VARCHAR2(50), /* 사원번호 */
	name VARCHAR2(50), /* 사원명 */
	content CLOB NOT NULL, /* 내용 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

create view noticeCommentView
as
select c.No,c.noticeNo,c.MEMNO,m.name, c.content, c.regdate from 
noticeComment c join member m
on c.memNo = m.memNo;

--drop sequence noticeComment_seq;
create sequence noticeComment_seq
start with 1
increment by 1;

COMMENT ON TABLE noticeComment IS '공지사항댓글';

COMMENT ON COLUMN noticeComment.no IS '댓글번호';

COMMENT ON COLUMN noticeComment.noticeNo IS '게시글번호';

COMMENT ON COLUMN noticeComment.memNo IS '사원번호';

COMMENT ON COLUMN noticeComment.name IS '사원명';

COMMENT ON COLUMN noticeComment.content IS '내용';

COMMENT ON COLUMN noticeComment.regdate IS '작성일';

CREATE UNIQUE INDEX PK_noticeComment
	ON noticeComment (
		no ASC
	);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT PK_noticeComment
		PRIMARY KEY (
			no
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_notice_TO_noticeComment
		FOREIGN KEY (
			noticeNo
		)
		REFERENCES notice (
			noticeNo
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_MEMBER_TO_noticeComment
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
commit;

select * from noticeComment;