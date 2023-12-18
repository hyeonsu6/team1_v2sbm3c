/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(30)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(30)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';
COMMENT ON COLUMN MEMBER.GRADE is '등급';


/**********************************/
/* Table Name: 축제 카테고리 */
/**********************************/
CREATE TABLE FCATE(
		fcateno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(70)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE FCATE is '축제 카테고리';
COMMENT ON COLUMN FCATE.fcateno is '카테고리 번호';
COMMENT ON COLUMN FCATE.name is '카테고리 이름';
COMMENT ON COLUMN FCATE.cnt is '관련 자료수';
COMMENT ON COLUMN FCATE.rdate is '등록일';
COMMENT ON COLUMN FCATE.seqno is '출력 순서';
COMMENT ON COLUMN FCATE.visible is '출력 모드';


/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE QUESTION(
		QNANO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		FCATENO                       		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(50)		 NOT NULL,
		QUEST                         		VARCHAR2(300)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		fcateno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno)
);

COMMENT ON TABLE QUESTION is '질문';
COMMENT ON COLUMN QUESTION.QNANO is '질문번호';
COMMENT ON COLUMN QUESTION.MEMBERNO is '회원번호';
COMMENT ON COLUMN QUESTION.FCATENO is '축제 카테고리 번호';
COMMENT ON COLUMN QUESTION.TITLE is '제목';
COMMENT ON COLUMN QUESTION.QUEST is '질문내용';
COMMENT ON COLUMN QUESTION.RDATE is '질문날짜';
COMMENT ON COLUMN QUESTION.fcateno is '카테고리 번호';


/**********************************/
/* Table Name: 챗봇 */
/**********************************/
CREATE TABLE CHATBOT(
		CHATBOTNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CHAT                          		VARCHAR2(500)		 NULL ,
		RDATE                         		TIMESTAMP(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE CHATBOT is '챗봇';
COMMENT ON COLUMN CHATBOT.CHATBOTNO is '챗봇번호';
COMMENT ON COLUMN CHATBOT.MEMBERNO is '회원번호';
COMMENT ON COLUMN CHATBOT.CHAT is '채팅내용';
COMMENT ON COLUMN CHATBOT.RDATE is '채팅날짜';


/**********************************/
/* Table Name: 이효진 */
/**********************************/
CREATE TABLE 이효진(

);

COMMENT ON TABLE 이효진 is '이효진';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(5)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ID is '아이디';
COMMENT ON COLUMN ADMIN.PASSWD is '패스워드';
COMMENT ON COLUMN ADMIN.MNAME is '성명';
COMMENT ON COLUMN ADMIN.MDATE is '가입일';
COMMENT ON COLUMN ADMIN.GRADE is '등급';


/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE ANSWER(
		ANSNO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		QNANO                         		NUMBER(10)		 NOT NULL,
		ANS                           		VARCHAR2(300)		 NULL ,
		ADMINNO                       		NUMBER(5)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (QNANO) REFERENCES QUESTION (QNANO),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE ANSWER is '답변';
COMMENT ON COLUMN ANSWER.ANSNO is '답변번호';
COMMENT ON COLUMN ANSWER.QNANO is '질문번호';
COMMENT ON COLUMN ANSWER.ANS is '답변내용';
COMMENT ON COLUMN ANSWER.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ANSWER.RDATE is '답변날짜';


/**********************************/
/* Table Name: 변현수 */
/**********************************/
CREATE TABLE 변현수(

);

COMMENT ON TABLE 변현수 is '변현수';


/**********************************/
/* Table Name: 축제/행사 컨텐츠 */
/**********************************/
CREATE TABLE FESTIVAL(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		fcateno                       		NUMBER(10)		 NOT NULL,
		ADMINNO                       		NUMBER(5)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(50000)		 NOT NULL,
		recom                         		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		replycnt                      		NUMBER(10)		 NOT NULL,
		passwd                        		VARCHAR2(10)		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(50)		 NULL ,
		file1saved                    		VARCHAR2(50)		 NULL ,
		thumb1                        		VARCHAR2(50)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
  FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE FESTIVAL is '축제/행사 컨텐츠';
COMMENT ON COLUMN FESTIVAL.contentsno is '컨텐츠번호';
COMMENT ON COLUMN FESTIVAL.fcateno is '카테고리 번호';
COMMENT ON COLUMN FESTIVAL.ADMINNO is '관리자 번호';
COMMENT ON COLUMN FESTIVAL.title is '제목';
COMMENT ON COLUMN FESTIVAL.content is '내용';
COMMENT ON COLUMN FESTIVAL.recom is '추천수';
COMMENT ON COLUMN FESTIVAL.cnt is '조회수';
COMMENT ON COLUMN FESTIVAL.replycnt is '댓글수';
COMMENT ON COLUMN FESTIVAL.passwd is '패스워드';
COMMENT ON COLUMN FESTIVAL.word is '검색어';
COMMENT ON COLUMN FESTIVAL.rdate is '등록일';
COMMENT ON COLUMN FESTIVAL.file1 is '메인 이미지';
COMMENT ON COLUMN FESTIVAL.file1saved is '실제 저장된 파일명';
COMMENT ON COLUMN FESTIVAL.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN FESTIVAL.size1 is '메인 이미지 크기';
COMMENT ON COLUMN FESTIVAL.map is '지도';
COMMENT ON COLUMN FESTIVAL.youtube is 'Youtube 영상';


/**********************************/
/* Table Name: 축제/행사 추천 */
/**********************************/
CREATE TABLE FRECOMMEND(
		frecommendno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
		fcateno                       		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		SEQ                           		INTEGER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES FESTIVAL (contentsno),
  FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE FRECOMMEND is '축제/행사 추천';
COMMENT ON COLUMN FRECOMMEND.frecommendno is '추천번호';
COMMENT ON COLUMN FRECOMMEND.contentsno is '컨텐츠번호';
COMMENT ON COLUMN FRECOMMEND.fcateno is '카테고리 번호';
COMMENT ON COLUMN FRECOMMEND.MEMBERNO is '회원 번호';
COMMENT ON COLUMN FRECOMMEND.SEQ is '추천 우선순위';
COMMENT ON COLUMN FRECOMMEND.RDATE is '추천 날짜';


/**********************************/
/* Table Name: 축제/행사 리뷰 */
/**********************************/
CREATE TABLE FREVIEW(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		contentsno                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		pwd                           		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(200)		 NULL ,
		file1saved                    		VARCHAR2(400)		 NULL ,
		thumb1                        		VARCHAR2(200)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL ,
  FOREIGN KEY (contentsno) REFERENCES FESTIVAL (contentsno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE FREVIEW is '축제/행사 리뷰';
COMMENT ON COLUMN FREVIEW.reviewno is '리뷰번호';
COMMENT ON COLUMN FREVIEW.contentsno is '컨텐츠번호';
COMMENT ON COLUMN FREVIEW.MEMBERNO is '회원 번호';
COMMENT ON COLUMN FREVIEW.title is '제목';
COMMENT ON COLUMN FREVIEW.content is '내용';
COMMENT ON COLUMN FREVIEW.cnt is '조회수';
COMMENT ON COLUMN FREVIEW.pwd is '패스워드';
COMMENT ON COLUMN FREVIEW.rdate is '등록일';
COMMENT ON COLUMN FREVIEW.file1 is '메인 이미지';
COMMENT ON COLUMN FREVIEW.file1saved is '실제 저장된 파일명';
COMMENT ON COLUMN FREVIEW.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN FREVIEW.size1 is '메인 이미지 크기';
COMMENT ON COLUMN FREVIEW.map is '지도';


/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE REPLY(
		replyno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		reviewno                      		NUMBER(10)		 NULL ,
		content                       		VARCHAR2(50000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);

COMMENT ON TABLE REPLY is '댓글';
COMMENT ON COLUMN REPLY.replyno is '댓글번호';
COMMENT ON COLUMN REPLY.MEMBERNO is '회원 번호';
COMMENT ON COLUMN REPLY.reviewno is '리뷰번호';
COMMENT ON COLUMN REPLY.content is '내용';
COMMENT ON COLUMN REPLY.rdate is '등록일';


/**********************************/
/* Table Name: Table14 */
/**********************************/
CREATE TABLE TABLE_14(

);

COMMENT ON TABLE TABLE_14 is 'Table14';


