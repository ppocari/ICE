/* 받는사람 */
CREATE TABLE messageRec (
	noteNo NUMBER NOT NULL, /* 쪽지관리번호 */
	recieveMemNo VARCHAR2(50) NOT NULL, /* 받는사원번호 */
	no NUMBER NOT NULL, /* 쪽지번호 */
	flagCondition VARCHAR2(50)  default 0/* 쪽지상태 읽지않음: 0 읽음 : 1 보관 : 2 삭제 : 3 */
);

create sequence messageRec_seq
start with 1
increment by 1;

COMMENT ON TABLE message_rec IS '받는사람';

COMMENT ON COLUMN message_rec.noteNo IS '쪽지관리번호';

COMMENT ON COLUMN message_rec.recieveMemNo IS '받는사원번호';

COMMENT ON COLUMN message_rec.no IS '쪽지번호';

COMMENT ON COLUMN message_rec.flagCondition IS '쪽지상태';

CREATE UNIQUE INDEX PK_message_rec
	ON message_rec (
		noteNo ASC
	);

ALTER TABLE message_rec
	ADD
		CONSTRAINT PK_message_rec
		PRIMARY KEY (
			noteNo
		);

/* 쪽지함 */
CREATE TABLE message (
	no NUMBER NOT NULL, /* 쪽지번호 */
	flagCondition VARCHAR2(50) DEFAULT 0 NOT NULL, /* 쪽지상태 */
	title VARCHAR2(200), /* 쪽지제목 */
	content CLOB, /* 쪽지내용 */
	regdate DATE DEFAULT sysdate, /* 날짜 */
	sendMemNo VARCHAR2(50) /* 보낸사원번호 */
);

create sequence message_seq
start with 1
increment by 1;

COMMENT ON TABLE message IS '쪽지함';

COMMENT ON COLUMN message.no IS '쪽지번호';

COMMENT ON COLUMN message.flagCondition IS '쪽지상태';

COMMENT ON COLUMN message.title IS '쪽지제목';

COMMENT ON COLUMN message.content IS '쪽지내용';

COMMENT ON COLUMN message.regdate IS '날짜';

COMMENT ON COLUMN message.sendMemNo IS '보낸사원번호';

CREATE UNIQUE INDEX PK_message
	ON message (
		no ASC,
		flagCondition ASC
	);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			no,
			flagCondition
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MEMBER_TO_message_rec2
		FOREIGN KEY (
			recieveMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_message_TO_message_rec
		FOREIGN KEY (
			no,
			flagCondition
		)
		REFERENCES message (
			no,
			flagCondition
		);

ALTER TABLE message
	ADD
		CONSTRAINT FK_MEMBER_TO_message
		FOREIGN KEY (
			sendMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);