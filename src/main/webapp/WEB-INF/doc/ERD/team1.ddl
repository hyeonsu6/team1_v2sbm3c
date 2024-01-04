/**********************************/
/* Table Name: �佺Ƽ��ī�װ� */
/**********************************/
CREATE TABLE FCATE(
		fcateno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(70)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		visible                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE FCATE is '�佺Ƽ��ī�װ�';
COMMENT ON COLUMN FCATE.fcateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN FCATE.name is 'ī�װ� �̸�';
COMMENT ON COLUMN FCATE.cnt is '���� �ڷ��';
COMMENT ON COLUMN FCATE.rdate is '�����';
COMMENT ON COLUMN FCATE.seqno is '��� ����';
COMMENT ON COLUMN FCATE.visible is '��� ���';


/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE MEMBER is 'ȸ��';
COMMENT ON COLUMN MEMBER.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.id is '���̵�';
COMMENT ON COLUMN MEMBER.passwd is '�н�����';
COMMENT ON COLUMN MEMBER.mname is 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.tel is '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.zipcode is '�����ȣ';
COMMENT ON COLUMN MEMBER.address1 is '�ּ�1';
COMMENT ON COLUMN MEMBER.address2 is '�ּ�2';
COMMENT ON COLUMN MEMBER.mdate is '������';
COMMENT ON COLUMN MEMBER.grade is '���';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE QUESTION(
		qnano                         		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		fcateno                       		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(50)		 NOT NULL,
		quest                         		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE QUESTION is '����';
COMMENT ON COLUMN QUESTION.qnano is '������ȣ';
COMMENT ON COLUMN QUESTION.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN QUESTION.fcateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN QUESTION.title is '����';
COMMENT ON COLUMN QUESTION.quest is '��������';
COMMENT ON COLUMN QUESTION.rdate is '������¥';


/**********************************/
/* Table Name: ê�� */
/**********************************/
CREATE TABLE CHATBOT(
		chattingno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		msg                           		VARCHAR2(500)		 NULL ,
		rdate                         		TIMESTAMP(10)		 NULL 
);

COMMENT ON TABLE CHATBOT is 'ê��';
COMMENT ON COLUMN CHATBOT.chattingno is 'ä�� ��ȣ';
COMMENT ON COLUMN CHATBOT.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN CHATBOT.msg is 'ä�� �޽���';
COMMENT ON COLUMN CHATBOT.rdate is 'ä�� ��¥';


/**********************************/
/* Table Name: ��ȿ�� */
/**********************************/
CREATE TABLE ��ȿ��(

);

COMMENT ON TABLE ��ȿ�� is '��ȿ��';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE ADMIN(
		adminno                       		NUMBER(5)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		mname                         		VARCHAR2(20)		 NOT NULL,
		mdate                         		DATE		 NOT NULL,
		grade                         		NUMBER(2)		 NOT NULL
);

COMMENT ON TABLE ADMIN is '������';
COMMENT ON COLUMN ADMIN.adminno is '������ ��ȣ';
COMMENT ON COLUMN ADMIN.id is '���̵�';
COMMENT ON COLUMN ADMIN.passwd is '�н�����';
COMMENT ON COLUMN ADMIN.mname is '����';
COMMENT ON COLUMN ADMIN.mdate is '������';
COMMENT ON COLUMN ADMIN.grade is '���';


/**********************************/
/* Table Name: �亯 */
/**********************************/
CREATE TABLE ANSWER(
		ansno                         		NUMBER(10)		 NOT NULL,
		qnano                         		NUMBER(10)		 NOT NULL,
		ans                           		VARCHAR2(300)		 NULL ,
		adminno                       		NUMBER(5)		 NULL ,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE ANSWER is '�亯';
COMMENT ON COLUMN ANSWER.ansno is '�亯��ȣ';
COMMENT ON COLUMN ANSWER.qnano is '������ȣ';
COMMENT ON COLUMN ANSWER.ans is '�亯����';
COMMENT ON COLUMN ANSWER.adminno is '������ ��ȣ';
COMMENT ON COLUMN ANSWER.rdate is '�亯��¥';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE ������(

);

COMMENT ON TABLE ������ is '������';


/**********************************/
/* Table Name: ����/��� ������ */
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

COMMENT ON TABLE FESTIVAL is '����/��� ������';
COMMENT ON COLUMN FESTIVAL.contentsno is '��������ȣ';
COMMENT ON COLUMN FESTIVAL.fcateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN FESTIVAL.adminno is '������ ��ȣ';
COMMENT ON COLUMN FESTIVAL.title is '����';
COMMENT ON COLUMN FESTIVAL.content is '����';
COMMENT ON COLUMN FESTIVAL.recom is '��õ��';
COMMENT ON COLUMN FESTIVAL.cnt is '��ȸ��';
COMMENT ON COLUMN FESTIVAL.replycnt is '��ۼ�';
COMMENT ON COLUMN FESTIVAL.passwd is '�н�����';
COMMENT ON COLUMN FESTIVAL.word is '�˻���';
COMMENT ON COLUMN FESTIVAL.rdate is '�����';
COMMENT ON COLUMN FESTIVAL.file1 is '���� �̹���';
COMMENT ON COLUMN FESTIVAL.file1saved is '���� ����� ���ϸ�';
COMMENT ON COLUMN FESTIVAL.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN FESTIVAL.size1 is '���� �̹��� ũ��';
COMMENT ON COLUMN FESTIVAL.map is '����';
COMMENT ON COLUMN FESTIVAL.youtube is 'Youtube ����';


/**********************************/
/* Table Name: ����/��� ī�װ� ��õ */
/**********************************/
CREATE TABLE FRECOMMEND(
		recommendno                   		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		fcateno                       		NUMBER(10)		 NULL ,
		seq                           		INTEGER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FRECOMMEND is '����/��� ī�װ� ��õ';
COMMENT ON COLUMN FRECOMMEND.recommendno is '��õ��ȣ';
COMMENT ON COLUMN FRECOMMEND.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN FRECOMMEND.fcateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN FRECOMMEND.seq is '��õ �켱����';
COMMENT ON COLUMN FRECOMMEND.rdate is '��õ ��¥';


/**********************************/
/* Table Name: ����/��� ���� */
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

COMMENT ON TABLE FREVIEW is '����/��� ����';
COMMENT ON COLUMN FREVIEW.reviewno is '���� ��ȣ';
COMMENT ON COLUMN FREVIEW.contentsno is '������ ��ȣ';
COMMENT ON COLUMN FREVIEW.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN FREVIEW.title is '����';
COMMENT ON COLUMN FREVIEW.content is '����';
COMMENT ON COLUMN FREVIEW.cnt is '��ȸ��';
COMMENT ON COLUMN FREVIEW.pwd is '�н�����';
COMMENT ON COLUMN FREVIEW.rdate is '�����';
COMMENT ON COLUMN FREVIEW.file1 is '���� �̹���';
COMMENT ON COLUMN FREVIEW.file1saved is '���� ����� ���ϸ�';
COMMENT ON COLUMN FREVIEW.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN FREVIEW.size1 is '���� �̹��� ũ��';
COMMENT ON COLUMN FREVIEW.map is '����';


/**********************************/
/* Table Name: Table14 */
/**********************************/
CREATE TABLE TABLE_14(

);

COMMENT ON TABLE TABLE_14 is 'Table14';


/**********************************/
/* Table Name: ������ �α��� ���� */
/**********************************/
CREATE TABLE ALOGIN(
		aloginno                      		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(5)		 NOT NULL,
		 ip                           		VARCHAR2(15)		 NOT NULL,
		logindate                     		DATE		 NOT NULL
);

COMMENT ON TABLE ALOGIN is '������ �α��� ����';
COMMENT ON COLUMN ALOGIN.aloginno is '�α��� ��ȣ';
COMMENT ON COLUMN ALOGIN.adminno is '������ ��ȣ';
COMMENT ON COLUMN ALOGIN. ip is '���� IP';
COMMENT ON COLUMN ALOGIN.logindate is '�α��� ��¥';


/**********************************/
/* Table Name: ȸ�� �α��� ���� */
/**********************************/
CREATE TABLE MLOGIN(
		mloginno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		ip                            		VARCHAR2(15)		 NOT NULL,
		logindate                     		DATE		 NOT NULL
);

COMMENT ON TABLE MLOGIN is 'ȸ�� �α��� ����';
COMMENT ON COLUMN MLOGIN.mloginno is '�α��� ��ȣ';
COMMENT ON COLUMN MLOGIN.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MLOGIN.ip is '���� IP';
COMMENT ON COLUMN MLOGIN.logindate  is '�α��� ��¥';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE FREVIEW_REPLY(
		replyno                       		NUMBER(10)		 NOT NULL,
		reviewno                      		NUMBER(10)		 NULL ,
		id                            		VARCHAR2(30)		 NOT NULL,
		reply                         		VARCHAR2(150)		 NOT NULL,
		passwd                        		DATE		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FREVIEW_REPLY is '������';
COMMENT ON COLUMN FREVIEW_REPLY.replyno is '��۹�ȣ';
COMMENT ON COLUMN FREVIEW_REPLY.reviewno is '�����ȣ';
COMMENT ON COLUMN FREVIEW_REPLY.id is '���̵�';
COMMENT ON COLUMN FREVIEW_REPLY.reply is '��۳���';
COMMENT ON COLUMN FREVIEW_REPLY.passwd is '�н�����';
COMMENT ON COLUMN FREVIEW_REPLY.rdate is '�����';


/**********************************/
/* Table Name: �佺Ƽ�� ������ ��õ */
/**********************************/
CREATE TABLE FESTIVAL_LIKES(
		likesno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		contentsno                    		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE FESTIVAL_LIKES is '�佺Ƽ�� ������ ��õ';
COMMENT ON COLUMN FESTIVAL_LIKES.likesno is '���ƿ� ��ȣ';
COMMENT ON COLUMN FESTIVAL_LIKES.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN FESTIVAL_LIKES.contentsno is '��������ȣ';
COMMENT ON COLUMN FESTIVAL_LIKES.rdate is '�����';


/**********************************/
/* Table Name: Ķ���� */
/**********************************/
CREATE TABLE CALENDAR(
		calno                         		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(200)		 NOT NULL,
		memo                          		CLOB(0)		 NOT NULL,
		calstart                      		VARCHAR2(10)		 NOT NULL,
		calend                        		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE CALENDAR is 'Ķ����';
COMMENT ON COLUMN CALENDAR.calno is '������ȣ';
COMMENT ON COLUMN CALENDAR.title is '��������';
COMMENT ON COLUMN CALENDAR.memo is '�󼼳���';
COMMENT ON COLUMN CALENDAR.calstart is '������';
COMMENT ON COLUMN CALENDAR.calend is '������';



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

