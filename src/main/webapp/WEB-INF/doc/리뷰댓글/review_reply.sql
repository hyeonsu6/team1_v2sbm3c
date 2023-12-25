/**********************************/
/* Table Name: 리뷰댓글 */
/**********************************/
DROP TABLE FREVIEW_REPLY;

CREATE TABLE FREVIEW_REPLY(
		REPLYNO     NUMERIC(10)     NOT NULL PRIMARY KEY,
		reviewno    NUMBER(10)      NOT NULL,
		id          VARCHAR(30)     NOT NULL,
		REPLY       VARCHAR(150)    NOT NULL,
		PASSWD      VARCHAR(10)     NOT NULL,
		RDATE       DATE            NOT NULL,
  FOREIGN KEY (id) REFERENCES MEMBER (id),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);

COMMENT ON TABLE FREVIEW_REPLY is '리뷰 댓글';
COMMENT ON COLUMN FREVIEW_REPLY.REPLYNO is '댓글번호';
COMMENT ON COLUMN FREVIEW_REPLY.reviewno is '리뷰번호';
COMMENT ON COLUMN FREVIEW_REPLY.id is '회원 아이디';
COMMENT ON COLUMN FREVIEW_REPLY.REPLY is '댓글내용';
COMMENT ON COLUMN FREVIEW_REPLY.PASSWD is '패스워드';
COMMENT ON COLUMN FREVIEW_REPLY.RDATE is '등록일';

DROP SEQUENCE FREVIEW_REPLY_SEQ;

CREATE SEQUENCE FREVIEW_REPLY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
 

COMMIT; 

/*******************************************************************************/

-- CREATE
INSERT INTO FREVIEW_REPLY(REPLYNO, reviewno, id, REPLY, PASSWD, RDATE)
VALUES (FREVIEW_REPLY_SEQ.nextval, 6, 'user1@gmail.com', '리뷰보고 다녀왔는데 너무 재밌었어요~!', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(REPLYNO, reviewno, id, REPLY, PASSWD, RDATE)
VALUES (FREVIEW_REPLY_SEQ.nextval, 6, 'user1@gmail.com', '추천해요~!! 완전 재밌어요~', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(REPLYNO, reviewno, id, REPLY, PASSWD, RDATE)
VALUES (FREVIEW_REPLY_SEQ.nextval, 6, 'user1@gmail.com', '사람 엄청 많아요! 조심하세요~', '1234', sysdate);


-- READ
SELECT REPLYNO, reviewno, id, REPLY, PASSWD, RDATE FROM FREVIEW_REPLY ORDER BY REPLYNO ASC;
SELECT REPLYNO, reviewno, id, REPLY, PASSWD, RDATE FROM FREVIEW_REPLY WHERE reviewno = 6 ORDER BY REPLYNO ASC;


-- UPDATE
UPDATE FREVIEW_REPLY SET REPLY = '리뷰보고 다녀왔는데 너무 재밌었어요~~~!' WHERE REPLYNO = 1;


-- DELETE
DELETE FROM FREVIEW_REPLY WHERE REPLYNO = 8 AND PASSWD = '1234';


/*******************************************************************************/
COMMIT; 


