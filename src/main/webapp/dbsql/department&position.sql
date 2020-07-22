/* 직급 */
/*DROP TABLE position 
	CASCADE CONSTRAINTS;*/

/* 부서 */
/*DROP TABLE department 
	CASCADE CONSTRAINTS;*/

/* 직급 */
CREATE TABLE position (
	posCode NUMBER NOT NULL, /* 직급코드 */
	posName VARCHAR2(100) /* 직급명 */
);

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