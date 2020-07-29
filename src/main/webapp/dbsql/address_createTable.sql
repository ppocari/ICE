/* 주소  */
DROP TABLE address 
	CASCADE CONSTRAINTS;

/* 주소록 */
DROP TABLE addressBook 
	CASCADE CONSTRAINTS;

/* 주소록그룹 */
DROP TABLE addressGroup 
	CASCADE CONSTRAINTS;


/* 주소 */
CREATE TABLE address (
	adNo NUMBER NOT NULL, /* 주소록번호 */
	adbNo NUMBER NOT NULL, /* 주소록명번호 */
	name VARCHAR2(50) NOT NULL, /* 사원명 */
	hp1 VARCHAR2(20), /* 전화번호1 */
	hp2 VARCHAR2(20), /* 전화번호2 */
	hp3 VARCHAR2(20), /* 전화번호3 */
	email1 VARCHAR2(50), /* 이메일1 */
	email2 VARCHAR2(50), /* 이메일2 */
	adgNo NUMBER, /* 그룹번호 */
	company VARCHAR2(100), /* 회사명/거래처명 */
	deptName VARCHAR2(100), /* 부서 */
	posName VARCHAR2(100), /* 직급 */
	isFavorite VARCHAR2(10), /* 즐겨찾기 유무 */
	isDeleted VARCHAR2(10) /* 삭제(휴지통) */
);

ALTER TABLE address
	ADD
		CONSTRAINT PK_address
		PRIMARY KEY (
			adNo
		);

/* 주소록 */
CREATE TABLE addressBook (
	adbNo NUMBER NOT NULL, /* 주소록명번호 */
	adbName VARCHAR2(100) NOT NULL, /* 주소록명 */
	orderNo NUMBER NOT NULL, /* 주소록순서 */
	memNo VARCHAR2(50) /* 사원번호 */
);

ALTER TABLE addressBook
	ADD
		CONSTRAINT PK_addressBook
		PRIMARY KEY (
			adbNo
		);

/* 주소록그룹 */
CREATE TABLE addressGroup (
	adgNo NUMBER NOT NULL, /* 그룹번호 */
	addressGroupName VARCHAR2(30), /* 그룹명 */
	memNo VARCHAR2(50) /* 사원번호 */
);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT PK_addressGroup
		PRIMARY KEY (
			adgNo
		);


ALTER TABLE address
	ADD
		CONSTRAINT FK_addressBook_TO_address
		FOREIGN KEY (
			adbNo
		)
		REFERENCES addressBook (
			adbNo
		);

ALTER TABLE address
	ADD
		CONSTRAINT FK_addressGroup_TO_address
		FOREIGN KEY (
			adgNo
		)
		REFERENCES addressGroup (
			adgNo
		);

ALTER TABLE addressBook
	ADD
		CONSTRAINT FK_member_TO_addressBook
		FOREIGN KEY (
			memNo
		)
		REFERENCES member (
			memNo
		);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT FK_member_TO_addressGroup
		FOREIGN KEY (
			memNo
		)
		REFERENCES member (
			memNo
		);