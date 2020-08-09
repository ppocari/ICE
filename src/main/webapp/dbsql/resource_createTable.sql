drop table resreserve cascade constraints;
drop table resmanage cascade constraints;
drop table location cascade constraints;

/* 자원예약 */
CREATE TABLE resReserve (
	rvNo NUMBER NOT NULL, /* 자원예약번호 */
	resNo NUMBER NOT NULL, /* 자원번호 */
	rvStart DATE NOT NULL, /* 자원예약 시작시간 */
	rvEnd DATE NOT NULL, /* 자원예약 끝시간 */
	rvReason VARCHAR2(1000), /* 자원예약 이유 */
	rvConfirm VARCHAR2(10), /* 자원승인여부 */
	rvRegdate DATE DEFAULT sysdate, /* 자원예약일 */
	memNo VARCHAR2(50) NOT NULL /* 사원번호 */
);

ALTER TABLE resReserve
	ADD
		CONSTRAINT PK_resReserve
		PRIMARY KEY (
			rvNo
		);

/* 자원관리 */
CREATE TABLE resManage (
	resNo NUMBER NOT NULL, /* 자원번호 */
	resName VARCHAR2(50) NOT NULL, /* 자원명 */
	resImage VARCHAR2(300), /* 이미지파일명 */
	resSize NUMBER, /* 파일사이즈 */
	resOriginalImage VARCHAR2(300), /* 변경전이미지파일명 */
	resLocation VARCHAR2(200), /* 장소 */
	resSubdesc VARCHAR2(2000), /* 자원부가설명 */
	resRegdate DATE DEFAULT sysdate, /* 자원등록일 */
	resState VARCHAR2(30) DEFAULT 'new', /* 자원상태 */
	resIsDel VARCHAR2(10) /* 자원삭제여부 */
);

ALTER TABLE resManage
	ADD
		CONSTRAINT PK_resManage
		PRIMARY KEY (
			resNo
		);


ALTER TABLE resReserve
	ADD
		CONSTRAINT FK_MEMBER_TO_resReserve
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE resReserve
	ADD
		CONSTRAINT FK_resManage_TO_resReserve
		FOREIGN KEY (
			resNo
		)
		REFERENCES resManage (
			resNo
		);
