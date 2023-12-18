/**********************************/
/* Table Name: 이효진 */
/**********************************/
CREATE TABLE 이효진(

);

/**********************************/
/* Table Name: 축제카테고리 */
/**********************************/
CREATE TABLE category(
		fcateno NUMERIC(10) NOT NULL PRIMARY KEY
);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno NUMERIC(10) NOT NULL PRIMARY KEY
);

/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE QUESTION(
		qnano NUMERIC(10) NOT NULL PRIMARY KEY,
		memberno NUMERIC(10) NOT NULL,
		fcateno NUMERIC(10) NOT NULL,
		title VARCHAR(50) NOT NULL,
		quest VARCHAR(300) NOT NULL,
		rdate DATE NOT NULL,
  FOREIGN KEY (fcateno) REFERENCES category (fcateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno NUMERIC(10) NOT NULL PRIMARY KEY
);

/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE ANSWER(
		ansno NUMERIC(10) NOT NULL PRIMARY KEY,
		qnano NUMERIC(10) NOT NULL,
		ans VARCHAR(300),
		adminno NUMERIC(10),
		rdate DATE NOT NULL,
  FOREIGN KEY (qnano) REFERENCES QUESTION (qnano),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

/**********************************/
/* Table Name: 챗봇 */
/**********************************/
CREATE TABLE chatbot(
		chatbotno NUMERIC(10) NOT NULL PRIMARY KEY,
		memberno NUMERIC(10) NOT NULL,
		CHAT VARCHAR(500),
		RDATE DATE,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

