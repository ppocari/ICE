/* 직급 */
/*DROP TABLE position 
	CASCADE CONSTRAINTS;*/

/* 부서 */
/*DROP TABLE department 
	CASCADE CONSTRAINTS;*/

/* 직급 */
CREATE TABLE position (
	posCode VARCHAR2(10) NOT NULL, /* 직급코드 */
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
		
insert into position
values('910', '사원1');

insert into position
values('911', '사원2');

insert into position
values('912', '사원3');

insert into position
values('919', '경리');

insert into position
values('930', '과장');

insert into position
values('940', '차장');

insert into position
values('950', '부장');

insert into position
values('960', '이사');	

insert into position
values('999', '관리자');

/* 부서 */
CREATE TABLE department (
	deptCode VARCHAR2(10) NOT NULL, /* 부서코드 */
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
	
insert into department
values('111', '영업1팀');

insert into department
values('121', '기획팀');

insert into department
values('131', '법무팀');

insert into department
values('141', '마케팅');

insert into department
values('999', '전산팀');	



		
	