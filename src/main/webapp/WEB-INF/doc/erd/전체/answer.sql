/**********************************/
/* Table Name: 답변 */
/**********************************/
DROP TABLE ANSWER;

CREATE TABLE ANSWER(
    ansno       NUMBER(10)      NOT NULL,
    questno     NUMBER(10)      NOT NULL,  -- FK
    ans         VARCHAR(300)    NOT NULL,
    adminno     NUMBER(5)       NOT NULL,  -- FK
    rdate       DATE            NOT NULL,
    FOREIGN KEY (questno) REFERENCES QUESTION (questno),
    FOREIGN KEY (adminno) REFERENCES ADMIN (adminno),
    PRIMARY KEY (ansno)
);

COMMENT ON TABLE ANSWER IS '답변';
COMMENT ON COLUMN ANSWER.ansno IS '답변 번호';
COMMENT ON COLUMN ANSWER.questno IS '질문 번호';
COMMENT ON COLUMN ANSWER.ans IS '답변 내용';
COMMENT ON COLUMN ANSWER.adminno IS '관리자 번호';
COMMENT ON COLUMN ANSWER.rdate IS '등록일';

DROP SEQUENCE ANSWER_SEQ;

CREATE SEQUENCE ANSWER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- INSERT, 데이터 삽입
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 1, '[등록]을 눌러 글을 입력할 수 있습니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 2, '수정하였습니다. 불편을 드려 죄송합니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 3, '네. 내용 상관없이 등록 가능합니다.', 1, SYSDATE);
INSERT INTO ANSWER(ansno, questno, ans, adminno, rdate) VALUES (ANSWER_SEQ.NEXTVAL, 4, '수정하였습니다. 불편을 드려 죄송합니다.', 1, SYSDATE);

COMMIT;

-- READ, 목록&조회   
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER ORDER BY ansno DESC;
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER WHERE adminno = 1 ORDER BY ansno DESC;
SELECT ansno, questno, ans, adminno, rdate FROM ANSWER WHERE adminno = 1 AND ans LIKE '%수정%' ORDER BY ansno DESC;

-- UPDATE, 수정
-- UPDATE ANSWER SET ans = '카드, 무통장입금 등' WHERE ansno = 1;
UPDATE ANSWER
SET ans = '[등록]을 눌러 글을 입력해주세요.'
WHERE ansno = 1;
   
COMMIT;   
        
-- DELETE, 삭제
DELETE FROM ANSWER WHERE ansno = 16;
COMMIT;

-- COUNT
SELECT COUNT(*) AS cnt FROM ANSWER WHERE ansno = 1;
SELECT COUNT(*) AS cnt FROM ANSWER WHERE ansno = 1 AND ans LIKE '%카드%';
