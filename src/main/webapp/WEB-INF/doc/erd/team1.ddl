/**********************************/
/* Table Name: 페스티벌카테고리 */
/**********************************/
CREATE TABLE FCATE(
		fcateno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(70)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE FCATE is '페스티벌카테고리';
COMMENT ON COLUMN FCATE.fcateno is '카테고리 번호';
COMMENT ON COLUMN FCATE.name is '카테고리 이름';
COMMENT ON COLUMN FCATE.cnt is '관련 자료수';
COMMENT ON COLUMN FCATE.rdate is '등록일';
COMMENT ON COLUMN FCATE.seqno is '출력 순서';
COMMENT ON COLUMN FCATE.visible is '출력 모드';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		memberno                      		NUMBER(10)		 NOT NULL,
		id                            		VARCHAR2(30)		 NOT NULL,
		passwd                        		VARCHAR2(60)		 NOT NULL,
		mname                         		VARCHAR2(30)		 NOT NULL,
		tel                           		VARCHAR2(14)		 NOT NULL,
		zipcode                       		VARCHAR2(5)		 NULL ,
		address1                      		VARCHAR2(80)		 NULL ,
		address2                      		VARCHAR2(50)		 NULL ,
		mdate                         		DATE		 NOT NULL,
		grade                         		NUMBER(2)		 NOT NULL
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.memberno is '회원 번호';
COMMENT ON COLUMN MEMBER.id is '아이디';
COMMENT ON COLUMN MEMBER.passwd is '패스워드';
COMMENT ON COLUMN MEMBER.mname is '회원이름';
COMMENT ON COLUMN MEMBER.tel is '전화번호';
COMMENT ON COLUMN MEMBER.zipcode is '우편번호';
COMMENT ON COLUMN MEMBER.address1 is '주소1';
COMMENT ON COLUMN MEMBER.address2 is '주소2';
COMMENT ON COLUMN MEMBER.mdate is '가입일';
COMMENT ON COLUMN MEMBER.grade is '등급';


/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE QUESTION(
		qnano                         		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		fcateno                       		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(50)		 NOT NULL,
		quest                         		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE QUESTION is '질문';
COMMENT ON COLUMN QUESTION.qnano is '질문번호';
COMMENT ON COLUMN QUESTION.memberno is '회원번호';
COMMENT ON COLUMN QUESTION.fcateno is '카테고리 번호';
COMMENT ON COLUMN QUESTION.title is '제목';
COMMENT ON COLUMN QUESTION.quest is '질문내용';
COMMENT ON COLUMN QUESTION.rdate is '질문날짜';


/**********************************/
/* Table Name: 챗봇 */
/**********************************/
CREATE TABLE CHATBOT(
		chattingno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		msg                           		VARCHAR2(500)		 NULL ,
		rdate                         		TIMESTAMP(10)		 NULL 
);

COMMENT ON TABLE CHATBOT is '챗봇';
COMMENT ON COLUMN CHATBOT.chattingno is '채팅 번호';
COMMENT ON COLUMN CHATBOT.memberno is '회원 번호';
COMMENT ON COLUMN CHATBOT.msg is '채팅 메시지';
COMMENT ON COLUMN CHATBOT.rdate is '채팅 날짜';


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
		adminno                       		NUMBER(5)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		mname                         		VARCHAR2(20)		 NOT NULL,
		mdate                         		DATE		 NOT NULL,
		grade                         		NUMBER(2)		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.adminno is '관리자 번호';
COMMENT ON COLUMN ADMIN.id is '아이디';
COMMENT ON COLUMN ADMIN.passwd is '패스워드';
COMMENT ON COLUMN ADMIN.mname is '성명';
COMMENT ON COLUMN ADMIN.mdate is '가입일';
COMMENT ON COLUMN ADMIN.grade is '등급';


/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE ANSWER(
		ansno                         		NUMBER(10)		 NOT NULL,
		qnano                         		NUMBER(10)		 NOT NULL,
		ans                           		VARCHAR2(300)		 NULL ,
		adminno                       		NUMBER(5)		 NULL ,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE ANSWER is '답변';
COMMENT ON COLUMN ANSWER.ansno is '답변번호';
COMMENT ON COLUMN ANSWER.qnano is '질문번호';
COMMENT ON COLUMN ANSWER.ans is '답변내용';
COMMENT ON COLUMN ANSWER.adminno is '관리자 번호';
COMMENT ON COLUMN ANSWER.rdate is '답변날짜';


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
		contentsno                    		NUMBER(10)		 NOT NULL,
		fcateno                       		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(5)		 NOT NULL,
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
		youtube                       		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE FESTIVAL is '축제/행사 컨텐츠';
COMMENT ON COLUMN FESTIVAL.contentsno is '컨텐츠번호';
COMMENT ON COLUMN FESTIVAL.fcateno is '카테고리 번호';
COMMENT ON COLUMN FESTIVAL.adminno is '관리자 번호';
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
/* Table Name: 축제/행사 카테고리 추천 */
/**********************************/
CREATE TABLE FRECOMMEND(
		recommendno                   		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		fcateno                       		NUMBER(10)		 NULL ,
		seq                           		INTEGER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FRECOMMEND is '축제/행사 카테고리 추천';
COMMENT ON COLUMN FRECOMMEND.recommendno is '추천번호';
COMMENT ON COLUMN FRECOMMEND.memberno is '회원 번호';
COMMENT ON COLUMN FRECOMMEND.fcateno is '카테고리 번호';
COMMENT ON COLUMN FRECOMMEND.seq is '추천 우선순위';
COMMENT ON COLUMN FRECOMMEND.rdate is '추천 날짜';


/**********************************/
/* Table Name: 축제/행사 리뷰 */
/**********************************/
CREATE TABLE FREVIEW(
		reviewno                      		NUMBER(10)		 NOT NULL,
		contentsno                    		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		pwd                           		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		file1                         		VARCHAR2(200)		 NULL ,
		file1saved                    		VARCHAR2(400)		 NULL ,
		thumb1                        		VARCHAR2(200)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE FREVIEW is '축제/행사 리뷰';
COMMENT ON COLUMN FREVIEW.reviewno is '리뷰 번호';
COMMENT ON COLUMN FREVIEW.contentsno is '콘텐츠 번호';
COMMENT ON COLUMN FREVIEW.memberno is '회원 번호';
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
/* Table Name: Table14 */
/**********************************/
CREATE TABLE TABLE_14(

);

COMMENT ON TABLE TABLE_14 is 'Table14';


/**********************************/
/* Table Name: 관리자 로그인 내역 */
/**********************************/
CREATE TABLE ALOGIN(
		aloginno                      		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(5)		 NOT NULL,
		 ip                           		VARCHAR2(15)		 NOT NULL,
		logindate                     		DATE		 NOT NULL
);

COMMENT ON TABLE ALOGIN is '관리자 로그인 내역';
COMMENT ON COLUMN ALOGIN.aloginno is '로그인 번호';
COMMENT ON COLUMN ALOGIN.adminno is '관리자 번호';
COMMENT ON COLUMN ALOGIN. ip is '접속 IP';
COMMENT ON COLUMN ALOGIN.logindate is '로그인 날짜';


/**********************************/
/* Table Name: 회원 로그인 내역 */
/**********************************/
CREATE TABLE MLOGIN(
		mloginno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		ip                            		VARCHAR2(15)		 NOT NULL,
		logindate                     		DATE		 NOT NULL
);

COMMENT ON TABLE MLOGIN is '회원 로그인 내역';
COMMENT ON COLUMN MLOGIN.mloginno is '로그인 번호';
COMMENT ON COLUMN MLOGIN.memberno is '회원 번호';
COMMENT ON COLUMN MLOGIN.ip is '접속 IP';
COMMENT ON COLUMN MLOGIN.logindate  is '로그인 날짜';


/**********************************/
/* Table Name: 리뷰댓글 */
/**********************************/
CREATE TABLE FREVIEW_REPLY(
		replyno                       		NUMBER(10)		 NOT NULL,
		reviewno                      		NUMBER(10)		 NULL ,
		id                            		VARCHAR2(30)		 NOT NULL,
		reply                         		VARCHAR2(150)		 NOT NULL,
		passwd                        		DATE		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FREVIEW_REPLY is '리뷰댓글';
COMMENT ON COLUMN FREVIEW_REPLY.replyno is '댓글번호';
COMMENT ON COLUMN FREVIEW_REPLY.reviewno is '리뷰번호';
COMMENT ON COLUMN FREVIEW_REPLY.id is '아이디';
COMMENT ON COLUMN FREVIEW_REPLY.reply is '댓글내용';
COMMENT ON COLUMN FREVIEW_REPLY.passwd is '패스워드';
COMMENT ON COLUMN FREVIEW_REPLY.rdate is '등록일';


/**********************************/
/* Table Name: 페스티벌 콘텐츠 추천 */
/**********************************/
CREATE TABLE FESTIVAL_LIKES(
		likesno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		contentsno                    		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FESTIVAL_LIKES is '페스티벌 콘텐츠 추천';
COMMENT ON COLUMN FESTIVAL_LIKES.likesno is '좋아요 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.memberno is '회원 번호';
COMMENT ON COLUMN FESTIVAL_LIKES.contentsno is '컨텐츠번호';
COMMENT ON COLUMN FESTIVAL_LIKES.rdate is '등록일';


/**********************************/
/* Table Name: 캘린더 */
/**********************************/
CREATE TABLE CALENDAR(
		calno                         		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(200)		 NOT NULL,
		memo                          		CLOB(0)		 NOT NULL,
		calstart                      		VARCHAR2(10)		 NOT NULL,
		calend                        		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE CALENDAR is '캘린더';
COMMENT ON COLUMN CALENDAR.calno is '일정번호';
COMMENT ON COLUMN CALENDAR.title is '일정제목';
COMMENT ON COLUMN CALENDAR.memo is '상세내용';
COMMENT ON COLUMN CALENDAR.calstart is '시작일';
COMMENT ON COLUMN CALENDAR.calend is '종료일';



ALTER TABLE FCATE ADD CONSTRAINT IDX_FCATE_PK PRIMARY KEY (fcateno);

ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (memberno);

ALTER TABLE QUESTION ADD CONSTRAINT IDX_QUESTION_PK PRIMARY KEY (qnano);
ALTER TABLE QUESTION ADD CONSTRAINT IDX_QUESTION_FK0 FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno);
ALTER TABLE QUESTION ADD CONSTRAINT IDX_QUESTION_FK1 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);

ALTER TABLE CHATBOT ADD CONSTRAINT IDX_CHATBOT_PK PRIMARY KEY (chattingno);
ALTER TABLE CHATBOT ADD CONSTRAINT IDX_CHATBOT_FK0 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);

ALTER TABLE ADMIN ADD CONSTRAINT IDX_ADMIN_PK PRIMARY KEY (adminno);

ALTER TABLE ANSWER ADD CONSTRAINT IDX_ANSWER_PK PRIMARY KEY (ansno);
ALTER TABLE ANSWER ADD CONSTRAINT IDX_ANSWER_FK0 FOREIGN KEY (qnano) REFERENCES QUESTION (qnano);
ALTER TABLE ANSWER ADD CONSTRAINT IDX_ANSWER_FK1 FOREIGN KEY (adminno) REFERENCES ADMIN (adminno);

ALTER TABLE FESTIVAL ADD CONSTRAINT IDX_FESTIVAL_PK PRIMARY KEY (contentsno);
ALTER TABLE FESTIVAL ADD CONSTRAINT IDX_FESTIVAL_FK0 FOREIGN KEY (adminno) REFERENCES ADMIN (adminno);
ALTER TABLE FESTIVAL ADD CONSTRAINT IDX_FESTIVAL_FK1 FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno);

ALTER TABLE FRECOMMEND ADD CONSTRAINT IDX_FRECOMMEND_PK PRIMARY KEY (recommendno);
ALTER TABLE FRECOMMEND ADD CONSTRAINT IDX_FRECOMMEND_FK0 FOREIGN KEY (fcateno) REFERENCES FCATE (fcateno);
ALTER TABLE FRECOMMEND ADD CONSTRAINT IDX_FRECOMMEND_FK1 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);

ALTER TABLE FREVIEW ADD CONSTRAINT IDX_FREVIEW_PK PRIMARY KEY (reviewno);
ALTER TABLE FREVIEW ADD CONSTRAINT IDX_FREVIEW_FK0 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);
ALTER TABLE FREVIEW ADD CONSTRAINT IDX_FREVIEW_FK1 FOREIGN KEY (contentsno) REFERENCES FESTIVAL (contentsno);

ALTER TABLE ALOGIN ADD CONSTRAINT IDX_ALOGIN_PK PRIMARY KEY (aloginno);
ALTER TABLE ALOGIN ADD CONSTRAINT IDX_ALOGIN_FK0 FOREIGN KEY (adminno) REFERENCES ADMIN (adminno);

ALTER TABLE MLOGIN ADD CONSTRAINT IDX_MLOGIN_PK PRIMARY KEY (mloginno);
ALTER TABLE MLOGIN ADD CONSTRAINT IDX_MLOGIN_FK0 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);

ALTER TABLE FREVIEW_REPLY ADD CONSTRAINT IDX_FREVIEW_REPLY_PK PRIMARY KEY (replyno);
ALTER TABLE FREVIEW_REPLY ADD CONSTRAINT IDX_FREVIEW_REPLY_FK0 FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno);
ALTER TABLE FREVIEW_REPLY ADD CONSTRAINT IDX_FREVIEW_REPLY_FK1 FOREIGN KEY (id) REFERENCES MEMBER (memberno);

ALTER TABLE FESTIVAL_LIKES ADD CONSTRAINT IDX_FESTIVAL_LIKES_PK PRIMARY KEY (likesno);
ALTER TABLE FESTIVAL_LIKES ADD CONSTRAINT IDX_FESTIVAL_LIKES_FK0 FOREIGN KEY (contentsno) REFERENCES FESTIVAL (contentsno);
ALTER TABLE FESTIVAL_LIKES ADD CONSTRAINT IDX_FESTIVAL_LIKES_FK1 FOREIGN KEY (memberno) REFERENCES MEMBER (memberno);

ALTER TABLE CALENDAR ADD CONSTRAINT IDX_CALENDAR_PK PRIMARY KEY (calno);

