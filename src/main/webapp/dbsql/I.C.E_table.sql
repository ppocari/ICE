/* 법인카드사용내역(미등록, excel) */
CREATE TABLE cardUsageHistory (
	cardNum VARCHAR2(100) NOT NULL, /* 법인카드 번호 */
	usePlace VARCHAR2(100), /* 사용처 */
	useDate DATE DEFAULT sysdate, /* 날짜 */
	price NUMBER, /* 금액 */
	empNo VARCHAR2(50) /* 사원번호 */
);

ALTER TABLE cardUsageHistory
	ADD
		CONSTRAINT PK_cardUsageHistory
		PRIMARY KEY (
			cardNum
		);

/* 계정코드 등록 */
CREATE TABLE TABLE2 (
);

/* 법인카드 */
CREATE TABLE companyCard (
	cardNo VARCHAR2(100) NOT NULL, /* 법인카드 번호 */
	empNo VARCHAR2(50), /* 사원번호 */
	accCode VARCHAR(20), /* 계정코드 */
	price NUMBER, /* 금액 */
	usePlace VARCHAR2(100), /* 사용처 */
	useDate DATE DEFAULT sysdate /* 날짜 */
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

ALTER TABLE companyCardFile
	ADD
		CONSTRAINT PK_companyCardFile
		PRIMARY KEY (
			no
		);

/* 주소록 */
CREATE TABLE addressBook (
	no NUMBER NOT NULL, /* 주소록순서 */
	adbName VARCHAR2(100), /* 주소록이름 */
	company VARCHAR2(100), /* 회사명 */
	empNo VARCHAR2(50), /* 사원번호 */
	groupNo NUMBER, /* 그룹번호 */
	adbNo NUMBER, /* 주소록번호 */
	isFavorite VARCHAR2(10), /* 즐겨찾기 유무 */
	isDeleted VARCHAR2(10) /* 삭제(휴지통) */
);

ALTER TABLE addressBook
	ADD
		CONSTRAINT PK_addressBook
		PRIMARY KEY (
			no
		);

/* 주소록그룹 */
CREATE TABLE adbGroup (
	groupNo NUMBER NOT NULL, /* 그룹번호 */
	groupName VARCHAR2(100) /* 그룹이름 */
);

ALTER TABLE adbGroup
	ADD
		CONSTRAINT PK_adbGroup
		PRIMARY KEY (
			groupNo
		);

/* 회원마다가지고있는주소록 */
CREATE TABLE personalAdb (
	adbNo NUMBER NOT NULL, /* 주소록번호 */
	empNo VARCHAR2(50), /* 사원번호 */
	purpose VARCHAR2(10 /* 회사용/개인용 */
);

ALTER TABLE personalAdb
	ADD
		CONSTRAINT PK_personalAdb
		PRIMARY KEY (
			adbNo
		);

/* 받은쪽지함 */
CREATE TABLE TABLE8 (
	COL2 <지정 되지 않음> NOT NULL, /* 쪽지번호 */
	COL <지정 되지 않음>, /* 쪽지제목 */
	COL3 <지정 되지 않음>, /* 쪽지내용 */
	COL4 <지정 되지 않음>, /* 날짜 */
	COL5 <지정 되지 않음>, /* 보낸회원번호* */
	COL6 <지정 되지 않음> /* 받는회원번호* */
);

ALTER TABLE TABLE8
	ADD
		CONSTRAINT PK_TABLE8
		PRIMARY KEY (
			COL2
		);

/* 보낸쪽지함 */
CREATE TABLE TABLE9 (
	COL <지정 되지 않음> NOT NULL, /* 새 컬럼 */
	COL4 <지정 되지 않음>, /* 쪽지제목 */
	COL5 <지정 되지 않음>, /* 쪽지내용 */
	COL2 <지정 되지 않음>, /* 보낸회원번호* */
	COL3 <지정 되지 않음> /* 받는회원번호* */
);

ALTER TABLE TABLE9
	ADD
		CONSTRAINT PK_TABLE9
		PRIMARY KEY (
			COL
		);

/* 사내게시판 답변or 댓글 */
CREATE TABLE TABLE10 (
	COL <지정 되지 않음> NOT NULL, /* 답글* 댓글번호 */
	COL2 <지정 되지 않음>, /* 게시글번호* */
	COL3 <지정 되지 않음>, /* 작성자* */
	COL4 <지정 되지 않음>, /* 내용 */
	COL5 <지정 되지 않음> /* 작성일 */
);

ALTER TABLE TABLE10
	ADD
		CONSTRAINT PK_TABLE10
		PRIMARY KEY (
			COL
		);

/* 사내게시판추천 */
CREATE TABLE TABLE11 (
	COL2 <지정 되지 않음> NOT NULL, /* 추천번호 */
	COL <지정 되지 않음>, /* 사원번호* */
	COL3 <지정 되지 않음> /* 게시글번호* */
);

ALTER TABLE TABLE11
	ADD
		CONSTRAINT PK_TABLE11
		PRIMARY KEY (
			COL2
		);

/* 공지사항 */
CREATE TABLE TABLE12 (
	NOTI_NO <지정 되지 않음> NOT NULL, /* 공지사항게시글번호 */
	NOTI_TITLE VARCHAR NOT NULL, /* 글제목 */
	COL3 <지정 되지 않음> NOT NULL, /* 글쓴이* */
	NOTI_CONTENT CLOB NOT NULL, /* 글내용 */
	NOTI_REGDATE TIMESTAMP NOT NULL, /* 등록일 */
	NOTI_FILENAME VARCHAR, /* 업로드파일명 */
	NOTI_FILESIZE VARCHAR, /* 파일사이즈 */
	NOTI_ORFILENAME VARCHAR, /* 변경전 업로드 파일명 */
	NOTI_DOWNCOUNT <지정 되지 않음>, /* 다운수 */
	NOTI_READCOUNT <지정 되지 않음>, /* 조회수 */
	NOTI_CATEGORY VARCHAR NOT NULL /* 카테고리 */
);

ALTER TABLE TABLE12
	ADD
		CONSTRAINT NOTICE
		PRIMARY KEY (
			NOTI_NO
		);

/* 사내게시판 */
CREATE TABLE TABLE13 (
	COL2 <지정 되지 않음> NOT NULL, /* 게시글번호 */
	COL <지정 되지 않음>, /* 글제목 */
	COL3 <지정 되지 않음>, /* 사원번호*상위 */
	COL4 <지정 되지 않음>, /* 글내용 */
	COL5 <지정 되지 않음>, /* 등록일 */
	COL6 <지정 되지 않음>, /* 이미지이름 */
	COL7 <지정 되지 않음>, /* 조회수 */
	COL8 <지정 되지 않음>, /* 추천 */
	COL9 <지정 되지 않음> /* 메인여부 */
);

ALTER TABLE TABLE13
	ADD
		CONSTRAINT PK_TABLE13
		PRIMARY KEY (
			COL2
		);

/* 직급 */
CREATE TABLE position (
	pCode NUMBER NOT NULL, /* 직급코드 */
	pName VARCHAR2(100) /* 직급명 */
);

ALTER TABLE position
	ADD
		CONSTRAINT PK_position
		PRIMARY KEY (
			pCode
		);

/* 부서 */
CREATE TABLE department (
	deptNo NUMBER NOT NULL, /* 부서코드 */
	deptName VARCHAR2(100) /* 부서명 */
);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			deptNo
		);

/* 사원 */
CREATE TABLE employee (
	empNo VARCHAR2(50) NOT NULL, /* 사원번호 */
	name VARCHAR2(50), /* 사원명 */
	pwd VARCHAR2(50), /* 비밀번호 */
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
	deptNo NUMBER, /* 부서코드 */
	pCode NUMBER /* 직급코드 */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			empNo
		);

/* 코멘트 */
CREATE TABLE payComment (
	commentNo NUMBER NOT NULL, /* 코멘트번호 */
	empNo VARCHAR2(50), /* 사원번호 */
	content CLOB, /* 내용 */
	docNo NUMBER, /* 문서번호 */
	regdate DATE DEFAULT sysdate /* 작성일 */
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
	typeNo NUMBER, /* 문서타입번호 */
	content CLOB /* 내용 */
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
	empNo VARCHAR2(50), /* 사원번호 */
	formNo NUMBER, /* 양식번호 */
	title VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	hasFile VARCHAR2(10), /* 파일여부 */
	progress VARCHAR2(100), /* 진행상황 */
	writeDate VARCHAR2(100) DEFAULT sysdate, /* 기안일 */
	keep DATE /* 보존기간 */
);

ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment
		PRIMARY KEY (
			docNo
		);

/* 참고선 */
CREATE TABLE referenceLine (
	docNo NUMBER NOT NULL, /* 문서번호 */
	refNo NUMBER, /* 참조건번호 */
	empNo VARCHAR2(50) /* 사원번호 */
);

ALTER TABLE referenceLine
	ADD
		CONSTRAINT PK_referenceLine
		PRIMARY KEY (
			docNo
		);

/* 결재선 */
CREATE TABLE paymentLine (
	docNo NUMBER NOT NULL, /* 문서번호 */
	payNo NUMBER, /* 결재건번호 */
	payDate VARCHAR2(100) DEFAULT sysdate, /* 결재변경일 */
	empNo VARCHAR2(50) /* 사원번호 */
);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT PK_paymentLine
		PRIMARY KEY (
			docNo
		);

/* 결재첨부파일 */
CREATE TABLE paymentFile (
	fileNo NUMBER NOT NULL, /* 파일번호 */
	fileName VARCHAR2(100), /* 파일이름 */
	originalFileName VARCHAR2(100), /* 원본이름 */
	fileSize LONG, /* 파일용량 */
	docNo NUMBER /* 문서번호 */
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
	typeName VARCHAR2(50), /* 타입명 */
	pCode NUMBER /* 직급코드 */
);

ALTER TABLE docType
	ADD
		CONSTRAINT PK_docType
		PRIMARY KEY (
			typeNo
		);

/* 사내게시판 댓글 */
CREATE TABLE boardComment (
	BOR_NO NUMBER NOT NULL, /* 게시글번호 */
	BCOM_NUM NUMBER NOT NULL, /* 댓글번호 */
	BCOM_CONUM NUMBER, /* 댓글순서번호 */
	empNo VARCHAR2(50) NOT NULL, /* 사원번호* */
	BCOM_CONTENT CLOB NOT NULL, /* 내용 */
	BCOM_REGDATE DATE DEFAULT sysdate NOT NULL /* 작성일 */
);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			BCOM_NUM
		);

/* 쪽지함 */
CREATE TABLE receivedNote (
	NOTE_NO NUMBER NOT NULL, /* 쪽지번호 */
	NO_TITLE VARCHAR2(100) NOT NULL, /* 쪽지제목 */
	NO_CONTENT CLOB NOT NULL, /* 쪽지내용 */
	NO_REGDATE DATE DEFAULT sysdate NOT NULL, /* 날짜 */
	NO_RECEIVER VARCHAR2(50) NOT NULL, /* 받는사원번호 */
	NO_SENDER VARCHAR2(50) NOT NULL /* 보낸사원번호 */
);

ALTER TABLE receivedNote
	ADD
		CONSTRAINT PK_receivedNote
		PRIMARY KEY (
			NOTE_NO
		);

/* 보낸쪽지함 */
CREATE TABLE sentNote (
	noteNo NUMBER NOT NULL, /* 발신쪽지번호 */
	title VARCHAR2(100), /* 쪽지제목 */
	content CLOB, /* 쪽지내용 */
	regdate DATE, /* 날짜 */
	empNo2 VARCHAR2(50), /* 받을사원번호 */
	empNo VARCHAR2(50) /* 보낸사원번호 */
);

ALTER TABLE sentNote
	ADD
		CONSTRAINT PK_sentNote
		PRIMARY KEY (
			noteNo
		);

/* 공지사항 */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* 공지사항게시글번호 */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* 글제목 */
	empNo VARCHAR2(50), /* 사원번호* */
	NOTI_CONTENT CLOB NOT NULL, /* 글내용 */
	NOTI_REGDATE DATE NOT NULL, /* 등록일 */
	NOTI_FILENAME VARCHAR2(100), /* 업로드파일명 */
	NOTI_FILESIZE LONG, /* 파일사이즈 */
	NOTI_ORFILENAME VARCHAR2(100), /* 변경전 업로드 파일명 */
	NOTI_DOWNCOUNT NUMBER, /* 다운수 */
	NOTI_READCOUNT NUMBER, /* 조회수 */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL /* 카테고리 */
);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			NOTI_NO
		);

/* 사내게시판추천 */
CREATE TABLE companyBoard_recommend (
	REC_NO NUMBER NOT NULL, /* 추천번호 */
	empNo VARCHAR2(50) NOT NULL, /* 사원번호 */
	BOR_NO NUMBER NOT NULL /* 게시글번호 */
);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT PK_companyBoard_recommend
		PRIMARY KEY (
			REC_NO
		);

/* 사내게시판 */
CREATE TABLE companyBoard (
	BOR_NO NUMBER NOT NULL, /* 게시글번호 */
	BOR_TITLE VARCHAR2(100) NOT NULL, /* 글제목 */
	empNo VARCHAR2(50) NOT NULL, /* 사원번호 */
	BOR_CONTENT CLOB NOT NULL, /* 글내용 */
	BOR_REGDATE DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	BOR_IMAGE VARCHAR2(100), /* 이미지이름 */
	BOR_READCOUNT NUMBER, /* 조회수 */
	BOR_RECOMMEND NUMBER, /* 추천 */
	BOR_MAIN VARCHAR2(10) /* 메인여부 */
);

ALTER TABLE companyBoard
	ADD
		CONSTRAINT PK_companyBoard
		PRIMARY KEY (
			BOR_NO
		);

/* 마이페이지 */
CREATE TABLE mypage (
	no NUMBER, /* 사번 */
	name VARCHAR2(100), /* 이름 */
	pwd NUMBER, /* 비밀번호 */
	rank VARCHAR2(100), /* 직급 */
	gender VARCHAR2(100), /* 성별 */
	add_date TIMESTAMP, /* 입사일 */
	address VARCHAR2(100), /* 주소 */
	addressdetail VARCHAR2(100), /* 상세주소 */
	zipcode NUMBER, /* 우편번호 */
	duty VARCHAR2(100), /* 직무 */
	hp1 VARCHAR2(100), /* 핸드폰1 */
	hp2 VARCHAR2(100), /* 핸드폰2 */
	hp3 VARCHAR2(100), /* 핸드폰3 */
	filename VARCHAR2(100), /* 사진 */
	fileorigin VARCHAR2(100), /* 오리지날파일이름 */
	filesize LONG /* 파일사이즈 */
);

/* 쪽지 */
CREATE TABLE note (
	no NUMBER NOT NULL, /* 사번 */
	title VARCHAR2(100), /* 제목 */
	content CLOB, /* 내용 */
	regdate TIMESTAMP DEFAULT sysdate /* 날짜 */
);

ALTER TABLE note
	ADD
		CONSTRAINT PK_note
		PRIMARY KEY (
			no
		);

/* 권한 */
CREATE TABLE TABLE14 (
	COL <지정 되지 않음> NOT NULL, /* 권한코드 */
	security VARCHAR2(50) /* 권한 */
);

ALTER TABLE TABLE14
	ADD
		CONSTRAINT PK_TABLE14
		PRIMARY KEY (
			COL
		);

/* 스케줄 */
CREATE TABLE schedule (
	title VARCHAR2(100) DEFAULT sysdate, /* 제목 */
	content CLOB, /* 내용 */
	scheduleStart VARCHAR2(100), /* 시작날짜 */
	scheduleEnd VARCHAR2(100), /* 종료날짜 */
	scheduleNo NUMBER, /* 스케줄번호 */
	empNo VARCHAR2(50) NOT NULL /* 사원번호 */
);

/* 근태관리 */
CREATE TABLE workRecord (
	startTime TIMESTAMP DEFAULT sysdate, /* 출근시간 */
	endTime TIMESTAMP DEFAULT sysdate, /* 퇴근시간 */
	empNo VARCHAR2(50) /* 사원번호 */
);

/* 공지사항 댓글 */
CREATE TABLE noticeComment (
	NOTI_NO NUMBER, /* 게시글번호 */
	NOTICO_NUM NUMBER NOT NULL, /* 댓글번호 */
	NOTICO_CONUM NUMBER, /* 댓글순서번호 */
	empNo VARCHAR2(50), /* 사원번호 */
	NOTICO_CONTENT CLOB, /* 내용 */
	NOTICO_REGDATE DATE DEFAULT sysdate /* 작성일 */
);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT PK_noticeComment
		PRIMARY KEY (
			NOTICO_NUM
		);

/* 계정코드 */
CREATE TABLE accountCode (
	accCode VARCHAR(20) NOT NULL, /* 코드 */
	accGroup VARCHAR2(50), /* 분류 */
	accTitle VARCHAR2(50), /* 계정과목 */
	accContent CLOB /* 내용 */
);

ALTER TABLE accountCode
	ADD
		CONSTRAINT PK_accountCode
		PRIMARY KEY (
			accCode
		);

/* 자원예약현황 */
CREATE TABLE resourceReservation (
	reservationNo NUMBER NOT NULL, /* 예약고유번호 */
	resourceNo NUMBER NOT NULL, /* 자원번호 */
	empNo VARCHAR2(50) NOT NULL, /* 예약자(사원번호) */
	reservationDate DATE NOT NULL, /* 예약날짜 */
	startHour DATE, /* 예약시작시간 */
	endHour DATE, /* 예약끝시간 */
	takeOverDate DATE DEFAULT SYSDATE, /* 접수날짜 */
	empNo2 VARCHAR2(50), /* 승인자(사원번호) */
	approveDate DATE DEFAULT SYSDATE /* 승인날짜 */
);

ALTER TABLE resourceReservation
	ADD
		CONSTRAINT PK_resourceReservation
		PRIMARY KEY (
			reservationNo
		);

/* 자원관리 */
CREATE TABLE resourceManagement (
	resourceNo NUMBER NOT NULL, /* 자원번호 */
	resourceName VARCHAR2(100) NOT NULL, /* 자원명 */
	resourcePlace VARCHAR2(50), /* 자원위치 */
	resourceDescription VARCHAR2(1000), /* 자원부가설명 */
	resourceStatus VARCHAR2(50) /* 자원상태 */
);

ALTER TABLE resourceManagement
	ADD
		CONSTRAINT PK_resourceManagement
		PRIMARY KEY (
			resourceNo
		);

/* 자원이용자 */
CREATE TABLE resourceUser (
	reservationNo NUMBER NOT NULL, /* 예약고유번호 */
	empNo VARCHAR2(50) NOT NULL /* 이용자(사원번호) */
);

/* 자원예약승인 */
CREATE TABLE resourceReservationApprove (
	reservationNo NUMBER NOT NULL, /* 예약고유번호 */
	empNo VARCHAR2(50) NOT NULL /* 승인자(사원번호) */
);

ALTER TABLE resourceReservationApprove
	ADD
		CONSTRAINT PK_resourceReservationApprove
		PRIMARY KEY (
			reservationNo
		);

/* 자원관리2 */
CREATE TABLE ResourceManagement2 (
	resourceNo <지정 되지 않음> NOT NULL, /* 자원번호 */
	resourceName <지정 되지 않음> NOT NULL, /* 자원명 */
	resourcePlace <지정 되지 않음>, /* 자원위치 */
	resourceDescription <지정 되지 않음>, /* 자원부가설명 */
	resourceStatus <지정 되지 않음> /* 자원상태 */
);

ALTER TABLE ResourceManagement2
	ADD
		CONSTRAINT PK_ResourceManagement2
		PRIMARY KEY (
			resourceNo
		);

ALTER TABLE cardUsageHistory
	ADD
		CONSTRAINT FK_employee_TO_cardUsageHistory
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_employee_TO_companyCard
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
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

ALTER TABLE addressBook
	ADD
		CONSTRAINT FK_adbGroup_TO_addressBook
		FOREIGN KEY (
			groupNo
		)
		REFERENCES adbGroup (
			groupNo
		);

ALTER TABLE addressBook
	ADD
		CONSTRAINT FK_personalAdb_TO_addressBook
		FOREIGN KEY (
			adbNo
		)
		REFERENCES personalAdb (
			adbNo
		);

ALTER TABLE addressBook
	ADD
		CONSTRAINT FK_employee_TO_addressBook
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE personalAdb
	ADD
		CONSTRAINT FK_employee_TO_personalAdb
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_position_TO_employee
		FOREIGN KEY (
			pCode
		)
		REFERENCES position (
			pCode
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_department_TO_employee
		FOREIGN KEY (
			deptNo
		)
		REFERENCES department (
			deptNo
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
		CONSTRAINT FK_employee_TO_payComment
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE docForm
	ADD
		CONSTRAINT FK_docType_TO_docForm
		FOREIGN KEY (
			typeNo
		)
		REFERENCES docType (
			typeNo
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
		CONSTRAINT FK_employee_TO_payment
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE referenceLine
	ADD
		CONSTRAINT FK_payment_TO_referenceLine
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE referenceLine
	ADD
		CONSTRAINT FK_employee_TO_referenceLine
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT FK_employee_TO_paymentLine
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
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

ALTER TABLE docType
	ADD
		CONSTRAINT FK_position_TO_docType
		FOREIGN KEY (
			pCode
		)
		REFERENCES position (
			pCode
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_employee_TO_boardComment
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_companyBoard_TO_boardComment
		FOREIGN KEY (
			BOR_NO
		)
		REFERENCES companyBoard (
			BOR_NO
		);

ALTER TABLE receivedNote
	ADD
		CONSTRAINT FK_employee_TO_receivedNote
		FOREIGN KEY (
			NO_RECEIVER
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE receivedNote
	ADD
		CONSTRAINT FK_employee_TO_receivedNote2
		FOREIGN KEY (
			NO_SENDER
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE sentNote
	ADD
		CONSTRAINT FK_employee_TO_sentNote
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE sentNote
	ADD
		CONSTRAINT FK_employee_TO_sentNote2
		FOREIGN KEY (
			empNo2
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_employee_TO_notice
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_employee_TO_companyBoard_recommend
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_companyBoard_TO_companyBoard_recommend
		FOREIGN KEY (
			BOR_NO
		)
		REFERENCES companyBoard (
			BOR_NO
		);

ALTER TABLE companyBoard
	ADD
		CONSTRAINT FK_employee_TO_companyBoard
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE mypage
	ADD
		CONSTRAINT FK_note_TO_mypage
		FOREIGN KEY (
			no
		)
		REFERENCES note (
			no
		);

ALTER TABLE schedule
	ADD
		CONSTRAINT FK_employee_TO_schedule
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE workRecord
	ADD
		CONSTRAINT FK_employee_TO_workRecord
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_notice_TO_noticeComment
		FOREIGN KEY (
			NOTI_NO
		)
		REFERENCES notice (
			NOTI_NO
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_employee_TO_noticeComment
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE resourceReservation
	ADD
		CONSTRAINT FK_resourceManagement_TO_resourceReservation
		FOREIGN KEY (
			resourceNo
		)
		REFERENCES resourceManagement (
			resourceNo
		);

ALTER TABLE resourceReservation
	ADD
		CONSTRAINT FK_employee_TO_resourceReservation
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE resourceReservation
	ADD
		CONSTRAINT FK_employee_TO_resourceReservation2
		FOREIGN KEY (
			empNo2
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE resourceUser
	ADD
		CONSTRAINT FK_rsrcRsrvtn_TO_rsrcsr
		FOREIGN KEY (
			reservationNo
		)
		REFERENCES resourceReservation (
			reservationNo
		);

ALTER TABLE resourceUser
	ADD
		CONSTRAINT FK_employee_TO_resourceUser
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);

ALTER TABLE resourceReservationApprove
	ADD
		CONSTRAINT FK_rsrcRsrvtn
		FOREIGN KEY (
			reservationNo
		)
		REFERENCES resourceReservation (
			reservationNo
		);

ALTER TABLE resourceReservationApprove
	ADD
		CONSTRAINT FK_employee_TO_resourceReservationApprove
		FOREIGN KEY (
			empNo
		)
		REFERENCES employee (
			empNo
		);