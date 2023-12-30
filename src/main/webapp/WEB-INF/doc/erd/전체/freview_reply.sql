/**********************************/
/* Table Name: 리뷰댓글             */
/**********************************/
DROP TABLE FREVIEW_REPLY;

CREATE TABLE FREVIEW_REPLY(
		replyno     NUMERIC(10)     NOT NULL PRIMARY KEY,
		reviewno    NUMBER(10)      NOT NULL,
		id          VARCHAR(30)     NOT NULL,
		reply       VARCHAR(150)    NOT NULL,
		passwd      VARCHAR(10)     NOT NULL,
		rdate       DATE            NOT NULL,
  FOREIGN KEY (id) REFERENCES MEMBER (id),
  FOREIGN KEY (reviewno) REFERENCES FREVIEW (reviewno)
);

COMMENT ON TABLE FREVIEW_REPLY is '리뷰 댓글';
COMMENT ON COLUMN FREVIEW_REPLY.replyno is '댓글번호';
COMMENT ON COLUMN FREVIEW_REPLY.reviewno is '리뷰번호';
COMMENT ON COLUMN FREVIEW_REPLY.id is '회원 아이디';
COMMENT ON COLUMN FREVIEW_REPLY.reply is '댓글내용';
COMMENT ON COLUMN FREVIEW_REPLY.passwd is '패스워드';
COMMENT ON COLUMN FREVIEW_REPLY.rdate is '등록일';

DROP SEQUENCE FREVIEW_REPLY_SEQ;

CREATE SEQUENCE FREVIEW_REPLY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
 

COMMIT; 

/*******************************************************************************/

-- INSERT, 데이터 삽입
INSERT INTO FREVIEW_REPLY(replyno, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '리뷰보고 다녀왔는데 너무 재밌었어요~!', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(replyno, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '추천해요~!! 완전 재밌어요~', '1234', sysdate);
INSERT INTO FREVIEW_REPLY(NEXTVAL, reviewno, id, reply, passwd, rdate)
VALUES (FREVIEW_REPLY_SEQ.NEXTVAL, 6, 'user1@gmail.com', '사람 엄청 많아요! 조심하세요~', '1234', sysdate);

COMMIT; 


-- READ, 목록&조회   
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY ORDER BY replyno ASC;
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY WHERE reviewno = 6 ORDER BY replyno ASC;
SELECT replyno, reviewno, id, reply, passwd, rdate FROM FREVIEW_REPLY WHERE id = 'user2@gmail.com' ORDER BY replyno ASC;


-- UPDATE, 수정
UPDATE FREVIEW_REPLY SET reply = '리뷰보고 다녀왔는데 너무 재밌었어요~~~!' WHERE replyno = 1;

COMMIT; 

-- DELETE, 삭제
DELETE FROM FREVIEW_REPLY WHERE replyno = 8 AND passwd = '1234';

COMMIT; 


