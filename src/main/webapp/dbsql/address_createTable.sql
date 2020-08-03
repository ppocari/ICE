
/* �ּ� 
DROP TABLE address 
	CASCADE CONSTRAINTS;*/

/* �ּҷ� 
DROP TABLE addressBook 
	CASCADE CONSTRAINTS;
*/
/* �ּҷϱ׷� 
DROP TABLE addressGroup 
	CASCADE CONSTRAINTS;
*/


/* �ּ� */
CREATE TABLE address (
	adNo NUMBER NOT NULL, /* �ּҷϹ�ȣ */
	adbNo NUMBER NOT NULL, /* �ּҷϸ��ȣ */
	name VARCHAR2(50) NOT NULL, /* ����� */
	hp1 VARCHAR2(20), /* ��ȭ��ȣ1 */
	hp2 VARCHAR2(20), /* ��ȭ��ȣ2 */
	hp3 VARCHAR2(20), /* ��ȭ��ȣ3 */
	email1 VARCHAR2(50), /* �̸���1 */
	email2 VARCHAR2(50), /* �̸���2 */
	adgNo NUMBER, /* �׷��ȣ */
	company VARCHAR2(100), /* ȸ���/�ŷ�ó�� */
	deptName VARCHAR2(100), /* �μ� */
	posName VARCHAR2(100), /* ���� */
	isFavorite VARCHAR2(10), /* ���ã�� ���� */
	isDeleted DATE /* ����(������) */
);

ALTER TABLE address
	ADD
		CONSTRAINT PK_address
		PRIMARY KEY (
			adNo
		);

/* �ּҷ� */
CREATE TABLE addressBook (
	adbNo NUMBER NOT NULL, /* �ּҷϸ��ȣ */
	adbName VARCHAR2(100) NOT NULL, /* �ּҷϸ� */
	orderNo NUMBER NOT NULL, /* �ּҷϼ��� */
	memNo VARCHAR2(50) /* �����ȣ */
);

ALTER TABLE addressBook
	ADD
		CONSTRAINT PK_addressBook
		PRIMARY KEY (
			adbNo
		);

/* �ּҷϱ׷� */
CREATE TABLE addressGroup (
	adgNo NUMBER NOT NULL, /* �׷��ȣ */
	addressGroupName VARCHAR2(30), /* �׷�� */
	memNo VARCHAR2(50) /* �����ȣ */
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