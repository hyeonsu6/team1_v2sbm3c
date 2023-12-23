/**********************************/
/* Table Name: 축제/행사 리뷰 */
/**********************************/
CREATE TABLE FREVIEW(
		reviewno NUMBER(10) NOT NULL PRIMARY KEY,
		contentsno NUMBER(10),
		MEMBERNO NUMBER(10),
		title VARCHAR2(100) NOT NULL,
		content VARCHAR2 NOT NULL,
		cnt NUMBER(10) NOT NULL,
		pwd VARCHAR2(10) NOT NULL,
		rdate DATE NOT NULL,
		file1 VARCHAR2(200),
		file1saved VARCHAR2(400),
		thumb1 VARCHAR2(200),
		size1 NUMBER(10),
		map VARCHAR2(1000)
);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO NUMBER(10) NOT NULL PRIMARY KEY,
		ID VARCHAR2(30) NOT NULL,
		PASSWD VARCHAR2(60) NOT NULL,
		MNAME VARCHAR2(30) NOT NULL,
		TEL VARCHAR2(14) NOT NULL,
		ZIPCODE VARCHAR2(5),
		ADDRESS1 VARCHAR2(80),
		ADDRESS2 VARCHAR2(50),
		MDATE DATE NOT NULL,
		GRADE NUMBER(2) NOT NULL
);

/**********************************/
/* Table Name: 리뷰댓글 */
/**********************************/
CREATE TABLE FREVIEW_REPLY(
		REPLYNO NUMERIC(10) NOT NULL PRIMARY KEY,
		reviewno NUMBER(10),
		ID VARCHAR(30) NOT NULL,
		REPLY VARCHAR(150) NOT NULL,
		PASSWD VARCHAR(10) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno),
  FOREIGN KEY (ID) REFERENCES MEMBER (ID)
);

