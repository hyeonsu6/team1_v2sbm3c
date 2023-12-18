/* Table name: Question */
DROP TABLE QUESTION;

CREATE TABLE QUESTION(
    QUESTNO     NUMBER(10)      NOT NULL,
    MEMBERNO    NUMBER(10)      NOT NULL,   -- FK
    FCATENO     NUMBER(10)      NOT NULL,   -- FK
    TITLE       VARCHAR(50)     NOT NULL,
    QUEST       VARCHAR(300)    NOT NULL,
    RDATE       DATE            NOT NULL,
    FOREIGN KEY (FCATENO) REFERENCES FCATE (FCATENO),
    FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
    PRIMARY KEY (QUESTNO)
);

COMMENT ON TABLE QUESTION is '질문';
COMMENT ON COLUMN QUESTION.QUESTNO is '질문 번호';
COMMENT ON COLUMN QUESTION.MEMBERNO is '회원 번호';
COMMENT ON COLUMN QUESTION.FCATENO is '축제 카테고리 번호';
COMMENT ON COLUMN QUESTION.TITLE is '제목';
COMMENT ON COLUMN QUESTION.QUEST is '질문내용';
COMMENT ON COLUMN QUESTION.RDATE is '등록일';

DROP SEQUENCE QUESTION_SEQ;

CREATE SEQUENCE QUESTION_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지


commit;


-- INSERT
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 1, '제목', '내용', sysdate);

INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 1, '질문 테스트', '질문 내용 테스트', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 2, 'OO지역 페스티벌', '내용이 다릅니다. 수정해주세요.', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 3, 'OO 봄 페스티벌', '비슷한 내용의 글을 추가해도 되나요?', sysdate);
INSERT INTO question(questno, memberno, fcateno, title, quest, rdate) VALUES (question_seq.nextval, 1, 4, '문화관광', '사진 수정해주세요~', sysdate);

-- SELECT
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY questno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY fcateno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question ORDER BY memberno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question WHERE fcateno = 3 ORDER BY questno ASC;
SELECT questno, memberno, fcateno, title, quest, rdate FROM question WHERE fcateno = 2 AND quest LIKE '%내용%' ORDER BY questno ASC;

-- DELETE
DELETE FROM question WHERE questno = 13;
-- DELETE FROM question;
-- commit;


-- COUNT
SELECT COUNT(*) as cnt FROM question WHERE fcateno = 1;
SELECT COUNT(*) as cnt FROM question WHERE fcateno = 3 AND quest LIKE '%사진%';


-- UPDATE
-- UPDATE question SET title = '결제 방법', quest = '결제는 어떻게 하나요' WHERE questno  = 1;


-- commit;
















