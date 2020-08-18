/* 법인카드 */
CREATE TABLE companyCard (
	cardNo VARCHAR2(100) NOT NULL, /* 법인카드 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	accCode VARCHAR(20), /* 계정코드 */
	price NUMBER, /* 금액 */
	usePlace VARCHAR2(100), /* 사용처 */
	useDate DATE DEFAULT sysdate /* 날짜 */
);

COMMENT ON TABLE companyCard IS '법인카드';

COMMENT ON COLUMN companyCard.cardNo IS '법인카드 번호';

COMMENT ON COLUMN companyCard.MEMNO IS '사원번호';

COMMENT ON COLUMN companyCard.accCode IS '계정코드';

COMMENT ON COLUMN companyCard.price IS '금액';

COMMENT ON COLUMN companyCard.usePlace IS '사용처';

COMMENT ON COLUMN companyCard.useDate IS '날짜';

CREATE UNIQUE INDEX PK_companyCard
	ON companyCard (
		cardNo ASC
	);

ALTER TABLE companyCard
	ADD
		CONSTRAINT PK_companyCard
		PRIMARY KEY (
			cardNo
		);

/* 파일내역 */
CREATE TABLE companyCardFile (
	no NUMBER NOT NULL, /* 파일순서 */
	fileName VARCHAR2(100), /* 파일이름 */
	uploadDate DATE DEFAULT sysdate, /* 파일업로드 날짜 */
	isDelete VARCHAR2(10) /* 파일 삭제 여부 */
);

COMMENT ON TABLE companyCardFile IS '파일내역';

COMMENT ON COLUMN companyCardFile.no IS '파일순서';

COMMENT ON COLUMN companyCardFile.fileName IS '파일이름';

COMMENT ON COLUMN companyCardFile.uploadDate IS '파일업로드 날짜';

COMMENT ON COLUMN companyCardFile.isDelete IS '파일 삭제 여부';

CREATE UNIQUE INDEX PK_companyCardFile
	ON companyCardFile (
		no ASC
	);

ALTER TABLE companyCardFile
	ADD
		CONSTRAINT PK_companyCardFile
		PRIMARY KEY (
			no
		);

/* 직급 */
CREATE TABLE position (
	posCode NUMBER NOT NULL, /* 직급코드 */
	posName VARCHAR2(100) /* 직급명 */
);

COMMENT ON TABLE position IS '직급';

COMMENT ON COLUMN position.posCode IS '직급코드';

COMMENT ON COLUMN position.posName IS '직급명';

CREATE UNIQUE INDEX PK_position
	ON position (
		posCode ASC
	);

ALTER TABLE position
	ADD
		CONSTRAINT PK_position
		PRIMARY KEY (
			posCode
		);

/* 부서 */
CREATE TABLE department (
	deptCode NUMBER NOT NULL, /* 부서코드 */
	deptName VARCHAR2(100) /* 부서명 */
);

COMMENT ON TABLE department IS '부서';

COMMENT ON COLUMN department.deptCode IS '부서코드';

COMMENT ON COLUMN department.deptName IS '부서명';

CREATE UNIQUE INDEX PK_department
	ON department (
		deptCode ASC
	);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			deptCode
		);

/* 사원 */
CREATE TABLE MEMBER (
	MEMNO VARCHAR2(50) NOT NULL, /* 사원번호 */
	NAME VARCHAR2(50), /* 사원명 */
	PWD VARCHAR2(50), /* 비밀번호 */
	hp1 VARCHAR2(20), /* 전화번호1 */
	hp2 VARCHAR2(20), /* 전화번호2 */
	hp3 VARCHAR2(20), /* 전화번호3 */
	email1 VARCHAR2(50), /* 이메일1 */
	email2 VARCHAR2(50), /* 이메일2 */
	ssn1 VARCHAR2(50), /* 주민번호1 */
	ssn2 VARCHAR2(50), /* 주민번호2 */
	zipcode VARCHAR2(50), /* 우편번호 */
	addr VARCHAR2(100), /* 주소 */
	addrDetail VARCHAR2(100), /* 상세주소 */
	salary NUMBER, /* 연봉 */
	hiredate DATE, /* 입사일 */
	firedate DATE, /* 퇴사일 */
	gender VARCHAR2(10), /* 성별 */
	profileURL VARCHAR2(100), /* 사진 */
	originalFileName VARCHAR2(100), /* 오리지날파일이름 */
	fileSize LONG, /* 파일사이즈 */
	deptCode NUMBER, /* 부서코드 */
	posCode NUMBER /* 직급코드 */
);

COMMENT ON TABLE MEMBER IS '사원';

COMMENT ON COLUMN MEMBER.MEMNO IS '사원번호';

COMMENT ON COLUMN MEMBER.NAME IS '사원명';

COMMENT ON COLUMN MEMBER.PWD IS '비밀번호';

COMMENT ON COLUMN MEMBER.hp1 IS '전화번호1';

COMMENT ON COLUMN MEMBER.hp2 IS '전화번호2';

COMMENT ON COLUMN MEMBER.hp3 IS '전화번호3';

COMMENT ON COLUMN MEMBER.email1 IS '이메일1';

COMMENT ON COLUMN MEMBER.email2 IS '이메일2';

COMMENT ON COLUMN MEMBER.ssn1 IS '주민번호1';

COMMENT ON COLUMN MEMBER.ssn2 IS '주민번호2';

COMMENT ON COLUMN MEMBER.zipcode IS '우편번호';

COMMENT ON COLUMN MEMBER.addr IS '주소';

COMMENT ON COLUMN MEMBER.addrDetail IS '상세주소';

COMMENT ON COLUMN MEMBER.salary IS '연봉';

COMMENT ON COLUMN MEMBER.hiredate IS '입사일';

COMMENT ON COLUMN MEMBER.firedate IS '퇴사일';

COMMENT ON COLUMN MEMBER.gender IS '성별';

COMMENT ON COLUMN MEMBER.profileURL IS '사진';

COMMENT ON COLUMN MEMBER.originalFileName IS '오리지날파일이름';

COMMENT ON COLUMN MEMBER.fileSize IS '파일사이즈';

COMMENT ON COLUMN MEMBER.deptCode IS '부서코드';

COMMENT ON COLUMN MEMBER.posCode IS '직급코드';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		MEMNO ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			MEMNO
		);

/* 코멘트 */
CREATE TABLE payComment (
	commentNo NUMBER NOT NULL, /* 코멘트번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	content CLOB, /* 내용 */
	docNo NUMBER, /* 문서번호 */
	regdate DATE DEFAULT sysdate /* 작성일 */
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
	docNo NUMBER NOT NULL, /* 문서번호 */
	payDate VARCHAR2(100) DEFAULT sysdate, /* 결재변경일 */
	MEMNO VARCHAR2(50), /* 받는사원번호 */
	read VARCHAR2(10) /* 읽음여부 */
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

/* 사내게시판 댓글 */
CREATE TABLE boardComment (
	comNo NUMBER NOT NULL, /* 댓글번호 */
	boardNo NUMBER, /* 게시글번호 */
	MEMNO VARCHAR2(50), /* 사원번호* */
	content CLOB, /* 내용 */
	regdate DATE DEFAULT sysdate /* 작성일 */
);

COMMENT ON TABLE boardComment IS '사내게시판 댓글';

COMMENT ON COLUMN boardComment.comNo IS '댓글번호';

COMMENT ON COLUMN boardComment.boardNo IS '게시글번호';

COMMENT ON COLUMN boardComment.MEMNO IS '사원번호*';

COMMENT ON COLUMN boardComment.content IS '내용';

COMMENT ON COLUMN boardComment.regdate IS '작성일';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		comNo ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			comNo
		);

/* 받는사람 */
CREATE TABLE message_rec (
	noteNo NUMBER NOT NULL, /* 쪽지관리번호 */
	READ_FLAG VARCHAR2(50) NOT NULL, /* 읽기여부 */
	MEMNO VARCHAR2(50) NOT NULL, /* 보낸사원번호 */
	DEL_FLAG VARCHAR2(10), /* 삭제여부 */
	MSG_NO NUMBER NOT NULL /* 쪽지번호 */
);

COMMENT ON TABLE message_rec IS '받는사람';

COMMENT ON COLUMN message_rec.noteNo IS '쪽지관리번호';

COMMENT ON COLUMN message_rec.READ_FLAG IS '읽기여부';

COMMENT ON COLUMN message_rec.MEMNO IS '보낸사원번호';

COMMENT ON COLUMN message_rec.DEL_FLAG IS '삭제여부';

COMMENT ON COLUMN message_rec.MSG_NO IS '쪽지번호';

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

/* 공지사항 */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* 공지사항게시글번호 */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* 글제목 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	NOTI_CONTENT CLOB NOT NULL, /* 글내용 */
	NOTI_REGDATE DATE NOT NULL, /* 등록일 */
	NOTI_FILENAME VARCHAR2(100), /* 업로드파일명 */
	NOTI_FILESIZE LONG, /* 파일사이즈 */
	NOTI_ORFILENAME VARCHAR2(100), /* 변경전 업로드 파일명 */
	NOTI_DOWNCOUNT NUMBER, /* 다운수 */
	NOTI_READCOUNT NUMBER, /* 조회수 */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL /* 카테고리 */
);

COMMENT ON TABLE notice IS '공지사항';

COMMENT ON COLUMN notice.NOTI_NO IS '공지사항게시글번호';

COMMENT ON COLUMN notice.NOTI_TITLE IS '글제목';

COMMENT ON COLUMN notice.MEMNO IS '사원번호';

COMMENT ON COLUMN notice.NOTI_CONTENT IS '글내용';

COMMENT ON COLUMN notice.NOTI_REGDATE IS '등록일';

COMMENT ON COLUMN notice.NOTI_FILENAME IS '업로드파일명';

COMMENT ON COLUMN notice.NOTI_FILESIZE IS '파일사이즈';

COMMENT ON COLUMN notice.NOTI_ORFILENAME IS '변경전 업로드 파일명';

COMMENT ON COLUMN notice.NOTI_DOWNCOUNT IS '다운수';

COMMENT ON COLUMN notice.NOTI_READCOUNT IS '조회수';

COMMENT ON COLUMN notice.NOTI_CATEGORY IS '카테고리';

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

/* 사내게시판 */
CREATE TABLE board (
	boardNo NUMBER NOT NULL, /* 게시글번호 */
	title VARCHAR2(100), /* 글제목 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	content CLOB, /* 글내용 */
	regdate DATE DEFAULT sysdate, /* 등록일 */
	imageURL VARCHAR2(100), /* 이미지이름 */
	visited NUMBER, /* 조회수 */
	recommend NUMBER, /* 추천 */
	isMain VARCHAR2(10) /* 메인여부 */
);

COMMENT ON TABLE board IS '사내게시판';

COMMENT ON COLUMN board.boardNo IS '게시글번호';

COMMENT ON COLUMN board.title IS '글제목';

COMMENT ON COLUMN board.MEMNO IS '사원번호';

COMMENT ON COLUMN board.content IS '글내용';

COMMENT ON COLUMN board.regdate IS '등록일';

COMMENT ON COLUMN board.imageURL IS '이미지이름';

COMMENT ON COLUMN board.visited IS '조회수';

COMMENT ON COLUMN board.recommend IS '추천';

COMMENT ON COLUMN board.isMain IS '메인여부';

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

/* 스케줄 */
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* 스케줄 번호 */
	MEMNO VARCHAR2(50) NOT NULL, /* 사원번호 */
	TITLE VARCHAR2(100) NOT NULL, /* 스케줄 제목 */
	START VARCHAR2(100) NOT NULL, /* 스케줄 시작 날짜 */
	END VARCHAR2(100) NOT NULL, /* 스케줄 끝날짜 */
	PLACE VARCHAR2(100), /* 스케줄 장소 */
	CONTENT VARCHAR2(100) /* 스케줄 내용 */
);

COMMENT ON TABLE schedule IS '스케줄';

COMMENT ON COLUMN schedule.SCHNO IS '스케줄 번호';

COMMENT ON COLUMN schedule.MEMNO IS '사원번호';

COMMENT ON COLUMN schedule.TITLE IS '스케줄 제목';

COMMENT ON COLUMN schedule.START IS '스케줄 시작 날짜';

COMMENT ON COLUMN schedule.END IS '스케줄 끝날짜';

COMMENT ON COLUMN schedule.PLACE IS '스케줄 장소';

COMMENT ON COLUMN schedule.CONTENT IS '스케줄 내용';

CREATE UNIQUE INDEX PK_schedule
	ON schedule (
		SCHNO ASC
	);

ALTER TABLE schedule
	ADD
		CONSTRAINT PK_schedule
		PRIMARY KEY (
			SCHNO
		);

/* 근태관리 */
CREATE TABLE workRecord (
	CMT_NO NUMBER NOT NULL, /* 근태관리 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	CMP_IN DATE DEFAULT sysdate, /* 출근시간 */
	CMP_OUT DATE DEFAULT sysdate, /* 퇴근시간 */
	CMP_STATUS VARCHAR2(50), /* 근태상태 */
	CMP_REGDATE DATE /* 날짜 */
);

COMMENT ON TABLE workRecord IS '근태관리';

COMMENT ON COLUMN workRecord.CMT_NO IS '근태관리 번호';

COMMENT ON COLUMN workRecord.MEMNO IS '사원번호';

COMMENT ON COLUMN workRecord.CMP_IN IS '출근시간';

COMMENT ON COLUMN workRecord.CMP_OUT IS '퇴근시간';

COMMENT ON COLUMN workRecord.CMP_STATUS IS '근태상태';

COMMENT ON COLUMN workRecord.CMP_REGDATE IS '날짜';

CREATE UNIQUE INDEX PK_workRecord
	ON workRecord (
		CMT_NO ASC
	);

ALTER TABLE workRecord
	ADD
		CONSTRAINT PK_workRecord
		PRIMARY KEY (
			CMT_NO
		);

/* 계정코드 */
CREATE TABLE accountCode (
	accCode VARCHAR(20) NOT NULL, /* 코드 */
	accGroup VARCHAR2(50), /* 분류 */
	accTitle VARCHAR2(50), /* 계정과목 */
	accContent CLOB /* 내용 */
);

COMMENT ON TABLE accountCode IS '계정코드';

COMMENT ON COLUMN accountCode.accCode IS '코드';

COMMENT ON COLUMN accountCode.accGroup IS '분류';

COMMENT ON COLUMN accountCode.accTitle IS '계정과목';

COMMENT ON COLUMN accountCode.accContent IS '내용';

CREATE UNIQUE INDEX PK_accountCode
	ON accountCode (
		accCode ASC
	);

ALTER TABLE accountCode
	ADD
		CONSTRAINT PK_accountCode
		PRIMARY KEY (
			accCode
		);

/* 쪽지함 */
CREATE TABLE MESSAGE (
	MSG_NO NUMBER NOT NULL, /* 쪽지번호 */
	MSG_TITLE VARCHAR2(200), /* 쪽지제목 */
	MSG_CONTENT CLOB, /* 쪽지내용 */
	MSG_REGDATE DATE, /* 날짜 */
	SEND_DELFLAG VARCHAR2(10), /* 보낸회원 삭제여부 */
	MEMNO VARCHAR2(50) /* 사원번호 */
);

COMMENT ON TABLE MESSAGE IS '쪽지함';

COMMENT ON COLUMN MESSAGE.MSG_NO IS '쪽지번호';

COMMENT ON COLUMN MESSAGE.MSG_TITLE IS '쪽지제목';

COMMENT ON COLUMN MESSAGE.MSG_CONTENT IS '쪽지내용';

COMMENT ON COLUMN MESSAGE.MSG_REGDATE IS '날짜';

COMMENT ON COLUMN MESSAGE.SEND_DELFLAG IS '보낸회원 삭제여부';

COMMENT ON COLUMN MESSAGE.MEMNO IS '사원번호';

CREATE UNIQUE INDEX PK_MESSAGE
	ON MESSAGE (
		MSG_NO ASC
	);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT PK_MESSAGE
		PRIMARY KEY (
			MSG_NO
		);

/* 자원예약테이블 */
CREATE TABLE reservation (
	RV_NO NUMBER NOT NULL, /* 자원예약번호 */
	RES_NO NUMBER NOT NULL, /* 자원번호 */
	RV_START DATE NOT NULL, /* 자원예약시작시간 */
	RV_END DATE NOT NULL, /* 자원예약 종료시간 */
	RV_CONTENT VARCHAR2(1000) NOT NULL, /* 자원예약내용 */
	RV_CONFRM VARCHAR2(100) NOT NULL, /* 자원승인여부 */
	RV_REGDATE DATE, /* 자원예약일 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	deptCode NUMBER /* 부서코드 */
);

COMMENT ON TABLE reservation IS '자원예약테이블';

COMMENT ON COLUMN reservation.RV_NO IS '자원예약번호';

COMMENT ON COLUMN reservation.RES_NO IS '자원번호';

COMMENT ON COLUMN reservation.RV_START IS '자원예약시작시간';

COMMENT ON COLUMN reservation.RV_END IS '자원예약 종료시간';

COMMENT ON COLUMN reservation.RV_CONTENT IS '자원예약내용';

COMMENT ON COLUMN reservation.RV_CONFRM IS '자원승인여부';

COMMENT ON COLUMN reservation.RV_REGDATE IS '자원예약일';

COMMENT ON COLUMN reservation.MEMNO IS '사원번호';

COMMENT ON COLUMN reservation.deptCode IS '부서코드';

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		RV_NO ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			RV_NO
		);

/* 자원관리테이블 */
CREATE TABLE RESOURCE (
	RES_NO NUMBER NOT NULL, /* 자원번호 */
	RES_NAME VARCHAR2(50) NOT NULL, /* 자원명 */
	RES_DEC VARCHAR2(100), /* 자원설명 */
	RES_REGDATE DATE /* 자원등록일 */
);

COMMENT ON TABLE RESOURCE IS '자원관리테이블';

COMMENT ON COLUMN RESOURCE.RES_NO IS '자원번호';

COMMENT ON COLUMN RESOURCE.RES_NAME IS '자원명';

COMMENT ON COLUMN RESOURCE.RES_DEC IS '자원설명';

COMMENT ON COLUMN RESOURCE.RES_REGDATE IS '자원등록일';

CREATE UNIQUE INDEX PK_RESOURCE
	ON RESOURCE (
		RES_NO ASC
	);

ALTER TABLE RESOURCE
	ADD
		CONSTRAINT PK_RESOURCE
		PRIMARY KEY (
			RES_NO
		);

/* 주소록그룹 */
CREATE TABLE addressGroup (
	adgNo NUMBER NOT NULL, /* 그룹번호 */
	groupName VARCHAR2(30) NOT NULL, /* 그룹명 */
	memNo VARCHAR2(50) NOT NULL /* 사원번호 */
);

COMMENT ON TABLE addressGroup IS '주소록그룹';

COMMENT ON COLUMN addressGroup.adgNo IS '그룹번호';

COMMENT ON COLUMN addressGroup.groupName IS '그룹명';

COMMENT ON COLUMN addressGroup.memNo IS '사원번호';

CREATE UNIQUE INDEX PK_addressGroup
	ON addressGroup (
		adgNo ASC
	);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT PK_addressGroup
		PRIMARY KEY (
			adgNo
		);

/* 주소 */
CREATE TABLE address (
	adNo NUMBER NOT NULL, /* 주소록번호 */
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

COMMENT ON TABLE address IS '주소';

COMMENT ON COLUMN address.adNo IS '주소록번호';

COMMENT ON COLUMN address.name IS '사원명';

COMMENT ON COLUMN address.hp1 IS '전화번호1';

COMMENT ON COLUMN address.hp2 IS '전화번호2';

COMMENT ON COLUMN address.hp3 IS '전화번호3';

COMMENT ON COLUMN address.email1 IS '이메일1';

COMMENT ON COLUMN address.email2 IS '이메일2';

COMMENT ON COLUMN address.adgNo IS '그룹번호';

COMMENT ON COLUMN address.company IS '회사명/거래처명';

COMMENT ON COLUMN address.deptName IS '부서';

COMMENT ON COLUMN address.posName IS '직급';

COMMENT ON COLUMN address.isFavorite IS '즐겨찾기 유무';

COMMENT ON COLUMN address.isDeleted IS '삭제(휴지통)';

CREATE UNIQUE INDEX PK_address
	ON address (
		adNo ASC
	);

ALTER TABLE address
	ADD
		CONSTRAINT PK_address
		PRIMARY KEY (
			adNo
		);

/* 식권 */
CREATE TABLE  ticket (
	TICNO NUMBER NOT NULL, /* 식권구매관리 번호 */
	MEMNO VARCHAR2(50), /* 사원번호 */
	TICQUANTITY NUMBER, /* 구매매수 */
	TICPRICE NUMBER, /* 가격 */
	TICREGDATE DATE DEFAULT SYSDATE /* 구매일 */
);

COMMENT ON TABLE  ticket IS '식권';

COMMENT ON COLUMN  ticket.TICNO IS '식권구매관리 번호';

COMMENT ON COLUMN  ticket.MEMNO IS '사원번호';

COMMENT ON COLUMN  ticket.TICQUANTITY IS '구매매수';

COMMENT ON COLUMN  ticket.TICPRICE IS '가격';

COMMENT ON COLUMN  ticket.TICREGDATE IS '구매일';

CREATE UNIQUE INDEX PK_ ticket
	ON  ticket (
		TICNO ASC
	);

ALTER TABLE  ticket
	ADD
		CONSTRAINT PK_ ticket
		PRIMARY KEY (
			TICNO
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_MEMBER_TO_companyCard
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_accountCode_TO_companyCard
		FOREIGN KEY (
			accCode
		)
		REFERENCES accountCode (
			accCode
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_position_TO_MEMBER
		FOREIGN KEY (
			posCode
		)
		REFERENCES position (
			posCode
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_department_TO_MEMBER
		FOREIGN KEY (
			deptCode
		)
		REFERENCES department (
			deptCode
		);

ALTER TABLE payComment
	ADD
		CONSTRAINT FK_payment_TO_payComment
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE payComment
	ADD
		CONSTRAINT FK_MEMBER_TO_payComment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_docForm_TO_payment
		FOREIGN KEY (
			formNo
		)
		REFERENCES docForm (
			formNo
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_MEMBER_TO_payment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_docType_TO_payment
		FOREIGN KEY (
			typeNo
		)
		REFERENCES docType (
			typeNo
		);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT FK_MEMBER_TO_paymentLine
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT FK_payment_TO_paymentLine
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE paymentFile
	ADD
		CONSTRAINT FK_payment_TO_paymentFile
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
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

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MEMBER_TO_message_rec2
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MESSAGE_TO_message_rec
		FOREIGN KEY (
			MSG_NO
		)
		REFERENCES MESSAGE (
			MSG_NO
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

ALTER TABLE schedule
	ADD
		CONSTRAINT FK_MEMBER_TO_schedule
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE workRecord
	ADD
		CONSTRAINT FK_MEMBER_TO_workRecord
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_MEMBER_TO_MESSAGE
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_MEMBER_TO_reservation
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_department_TO_reservation
		FOREIGN KEY (
			deptCode
		)
		REFERENCES department (
			deptCode
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_RESOURCE_TO_reservation
		FOREIGN KEY (
			RES_NO
		)
		REFERENCES RESOURCE (
			RES_NO
		);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT FK_MEMBER_TO_addressGroup
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
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

ALTER TABLE  ticket
	ADD
		CONSTRAINT FK_MEMBER_TO_ ticket
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);