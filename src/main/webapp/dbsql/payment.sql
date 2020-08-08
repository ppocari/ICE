/* 코멘트 */
DROP TABLE payComment 
	CASCADE CONSTRAINTS;

/* 문서양식 */
DROP TABLE docForm 
	CASCADE CONSTRAINTS;

/* 결재문서 */
DROP TABLE payment 
	CASCADE CONSTRAINTS;

/* 결재선 */
DROP TABLE paymentLine 
	CASCADE CONSTRAINTS;

/* 결재첨부파일 */
DROP TABLE paymentFile 
	CASCADE CONSTRAINTS;

/* 문서타입 */
DROP TABLE docType 
	CASCADE CONSTRAINTS;
	
/* 코멘트 */
CREATE TABLE payComment (
	commentNo NUMBER NOT NULL, /* 코멘트번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	content CLOB, /* 내용 */
	docNo NUMBER, /* 문서번호 */
	regdate DATE DEFAULT sysdate, /* 작성일 */
	signName VARCHAR2(100), /*서명*/
	originalSignName VARCHAR2(100) /*원본파일명*/
);

COMMENT ON TABLE payComment IS '코멘트';

COMMENT ON COLUMN payComment.commentNo IS '코멘트번호';

COMMENT ON COLUMN payComment.MEMNO IS '사원번호';

COMMENT ON COLUMN payComment.content IS '내용';

COMMENT ON COLUMN payComment.docNo IS '문서번호';

COMMENT ON COLUMN payComment.regdate IS '작성일';

CREATE UNIQUE INDEX PK_payComment
	ON payComment (
		commentNo ASC
	);

ALTER TABLE payComment
	ADD
		CONSTRAINT PK_payComment
		PRIMARY KEY (
			commentNo
		);

/* 문서양식 */
CREATE TABLE docForm (
	formNo NUMBER NOT NULL, /* 양식번호 */
	formName VARCHAR2(50), /* 양식명 */
	content CLOB /* 내용 */
);

COMMENT ON TABLE docForm IS '문서양식';

COMMENT ON COLUMN docForm.formNo IS '양식번호';

COMMENT ON COLUMN docForm.formName IS '양식명';

COMMENT ON COLUMN docForm.content IS '내용';

CREATE UNIQUE INDEX PK_docForm
	ON docForm (
		formNo ASC
	);

ALTER TABLE docForm
	ADD
		CONSTRAINT PK_docForm
		PRIMARY KEY (
			formNo
		);

/* 결재문서 */
CREATE TABLE payment (
	docNo NUMBER NOT NULL, /* 문서번호 */
	MEMNO VARCHAR2(50), /* 보낸사원번호 */
	formNo NUMBER, /* 양식번호 */
	typeNo NUMBER, /* 문서타입번호 */
	title VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	hasFile VARCHAR2(10), /* 파일여부 */
	progress VARCHAR2(100), /* 진행상황 */
	writeDate VARCHAR2(100) DEFAULT sysdate, /* 기안일 */
	keep NUMBER, /* 보존기간 */
	expiryDate DATE, /* 만료일 */
	imsy VARCHAR2(10) DEFAULT 'N' /* 임시보관 */
);

COMMENT ON TABLE payment IS '결재문서';

COMMENT ON COLUMN payment.docNo IS '문서번호';

COMMENT ON COLUMN payment.MEMNO IS '보낸사원번호';

COMMENT ON COLUMN payment.formNo IS '양식번호';

COMMENT ON COLUMN payment.typeNo IS '문서타입번호';

COMMENT ON COLUMN payment.title IS '제목';

COMMENT ON COLUMN payment.content IS '내용';

COMMENT ON COLUMN payment.hasFile IS '파일여부';

COMMENT ON COLUMN payment.progress IS '진행상황';

COMMENT ON COLUMN payment.writeDate IS '기안일';

COMMENT ON COLUMN payment.keep IS '보존기간';

COMMENT ON COLUMN payment.expiryDate IS '만료일';

COMMENT ON COLUMN payment.imsy IS '임시보관';

CREATE UNIQUE INDEX PK_payment
	ON payment (
		docNo ASC
	);

ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment
		PRIMARY KEY (
			docNo
		);

/* 결재선 */
CREATE TABLE paymentLine (
	payNo NUMBER NOT NULL, /* 결재건번호 */
	docNo NUMBER references payment(docNo), /* 문서번호 */
	payDate VARCHAR2(100), /* 결재변경일 */
	MEMNO VARCHAR2(50), /* 받는사원번호 */
	read VARCHAR2(10) DEFAULT 'N' /* 읽음여부 */
);

COMMENT ON TABLE paymentLine IS '결재선';

COMMENT ON COLUMN paymentLine.payNo IS '결재건번호';

COMMENT ON COLUMN paymentLine.docNo IS '문서번호';

COMMENT ON COLUMN paymentLine.payDate IS '결재변경일';

COMMENT ON COLUMN paymentLine.MEMNO IS '받는사원번호';

COMMENT ON COLUMN paymentLine.read IS '읽음여부';

CREATE UNIQUE INDEX PK_paymentLine
	ON paymentLine (
		payNo ASC
	);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT PK_paymentLine
		PRIMARY KEY (
			payNo
		);

/* 결재첨부파일 */
CREATE TABLE paymentFile (
	fileNo NUMBER NOT NULL, /* 파일번호 */
	fileName VARCHAR2(100), /* 파일이름 */
	originalFileName VARCHAR2(100), /* 원본이름 */
	fileSize LONG, /* 파일용량 */
	docNo NUMBER /* 문서번호 */
);

COMMENT ON TABLE paymentFile IS '결재첨부파일';

COMMENT ON COLUMN paymentFile.fileNo IS '파일번호';

COMMENT ON COLUMN paymentFile.fileName IS '파일이름';

COMMENT ON COLUMN paymentFile.originalFileName IS '원본이름';

COMMENT ON COLUMN paymentFile.fileSize IS '파일용량';

COMMENT ON COLUMN paymentFile.docNo IS '문서번호';

CREATE UNIQUE INDEX PK_paymentFile
	ON paymentFile (
		fileNo ASC
	);

ALTER TABLE paymentFile
	ADD
		CONSTRAINT PK_paymentFile
		PRIMARY KEY (
			fileNo
		);

/* 문서타입 */
CREATE TABLE docType (
	typeNo NUMBER NOT NULL, /* 문서타입번호 */
	typeName VARCHAR2(50) /* 타입명 */
);

COMMENT ON TABLE docType IS '문서타입';

COMMENT ON COLUMN docType.typeNo IS '문서타입번호';

COMMENT ON COLUMN docType.typeName IS '타입명';

CREATE UNIQUE INDEX PK_docType
	ON docType (
		typeNo ASC
	);

ALTER TABLE docType
	ADD
		CONSTRAINT PK_docType
		PRIMARY KEY (
			typeNo
		);
		
-----------------------시퀀스
--------------------결재문서
drop sequence doc_seq;
create sequence doc_seq
start with 11023
increment by 1
nocache;
--------------------문서양식
drop sequence docform_seq;
create sequence docform_seq
start with 23400
increment by 1
nocache;
--------------------결재선
drop sequence payline_seq;
create sequence payline_seq
start with 1
increment by 1
nocache;
--------------------업로드파일
drop sequence payfile_seq;
create sequence payfile_seq
start with 1
increment by 1
nocache;
--------------------코멘트
drop sequence com_seq;
create sequence com_seq
start with 1
increment by 1
nocache;
-----------------------문서타입
insert into doctype(typeNo,typeName)
values(1,'품의서');
insert into doctype(typeNo,typeName)
values(2,'기안서');
insert into doctype(typeNo,typeName)
values(3,'업무협조전');
insert into doctype(typeNo,typeName)
values(4,'보고서');
insert into doctype(typeNo,typeName)
values(5,'결근보고서');

select * from doctype;
------------------------뷰
create or replace view paymentView
as
select p.*,d.typeName,m.name, m.DEPTNAME
from (payment p join doctype d
on p.typeNo = d.typeNo)
join mypage_mem m
on p.memNo = m.memNo;

create or replace view chkdocView
as
select p.*,m.NAME,m.posName,m.poscode,m.deptName
from paymentline p join mypage_mem m
on p.MEMNO = m.MEMNO;

create or replace view docView
as
select p.*,m.NAME,m.posName,m.poscode,m.deptName,c.content, c.REGDATE, c.SIGNNAME
from (paymentline p join mypage_mem m
on p.MEMNO = m.MEMNO) join paycomment c
on p.MEMNO = c.MEMNO;

create or replace view paylistView
as
select p.*, l.MEMNO as gmemNo,l.PAYDATE, l.PAYNO,l.READ,d.TYPENAME,m.NAME
from ((payment p join paymentline l
on p.DOCNO = l.DOCNO)join doctype d
on p.TYPENO = d.TYPENO)join member m
on p.MEMNO = m.MEMNO;

create or replace view commentView
as
select p.*,m.NAME from paycomment p
join member m
on p.MEMNO = m.MEMNO;

select * from paymentfile;
select * from payment;
select * from paymentline;

select * from paylistview;
select * from docview;
select * from paymentview;

select * from position;
select * from department;
select * from member;

commit;